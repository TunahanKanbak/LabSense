import dash
import pandas as pd
from dash import Dash, html, dcc, Input, Output, State, ctx
from dash.exceptions import PreventUpdate
import plotly.express as px
import plotly.graph_objects as go
import numpy as np
import dash_bootstrap_components as dbc
from app import app
from database import labDBmanager

df_of_results = pd.DataFrame({})

query_page = dbc.Container([
    dcc.Store(id='current-data'),
    dcc.Download(id="download-dataframe-csv"),
    dbc.Row([
        dbc.Col([
            dcc.Dropdown(
                options=[], placeholder="Select an experiment",
                multi=True, id="result-list-picker"
            ),
            html.Br(),
            dbc.Button('İndir', id='download-raw-data-button')
        ], width={"size": 3, "order": "first"}),
        dbc.Col(dbc.Table([[], []], bordered=True, hover=True, responsive=True, id='result-table')),
    ], justify='between'),
    dbc.Row([
        dbc.Col(
            dcc.Graph(id='result-graph')
        )
    ])
], style={'padding-top': '20px'})

@app.callback(
    Output("result-table", "children"),
    Output('result-graph', 'figure'),
    Output('current-data', 'data'),
    Input("result-list-picker", "value"),
    prevent_initial_call=True
)
def sonuclariGoster(experiment_list):
    if len(experiment_list) == 0:
        empty_graph = go.Figure().add_annotation(x=2, y=2, text="No Data to Display",
                                                 font=dict(family="sans serif", size=25, color="crimson"),
                                                 showarrow=False,yshift=10)
        return None, empty_graph, {}

    global df_of_results
    df_of_results_filtered = df_of_results[df_of_results['talepID'].isin(experiment_list)].sort_values(by=['talepID',
                                                                                                        'zaman'])
    #Table formati
    table_header = [html.Thead(html.Tr([html.Th(column) for column in df_of_results_filtered.columns]))]
    table_body = [html.Tbody([html.Tr([html.Td(data) for data in row])
                             for index, row in df_of_results_filtered.iterrows()])]
    #Graph formati
    dateCol = df_of_results_filtered.groupby('talepID').apply(normalizeToKS)['zaman']
    dateCol = dateCol/np.timedelta64(1, 'h')
    mergedDF = df_of_results_filtered.merge(dateCol, how='inner', left_index=True, right_index=True)
    print(dateCol)
    print(df_of_results_filtered)
    print(mergedDF)
    graph = px.line(mergedDF, x='zaman_y', y='sonuc', text='aciklama', color='talepID')
    graph.update_traces(textposition="bottom right")
    return table_header + table_body, graph, df_of_results_filtered.to_dict()

@app.callback(
    Output('result-list-picker', 'options'),
    Input("tabs", "active_tab"),
    prevent_initial_call=True
)
def deneySonucuGuncelle(activated):
    if activated == "query-tab":
        global df_of_results
        df_of_results = labDBmanager.obje1.deney_sonucu_goruntule()
        list_of_results = df_of_results.loc[:, 'talepID'].unique()

        if list_of_results is None:
            return dash.no_update
        else:
            return list_of_results
    else:
        return dash.no_update

@app.callback(
    Output('download-dataframe-csv', 'data'),
    Input('download-raw-data-button', 'n_clicks'),
    State('current-data', 'data'),
    prevent_initial_call=True
)
def downloadRawData(click, data):
    df = pd.DataFrame(data)
    return dcc.send_data_frame(df.to_csv, "Result.csv")


def normalizeToKS(group):
    print(group[group['aciklama'].str.upper() == 'KS']['zaman'])
    group['zaman'] = group['zaman'] - group[group['aciklama'].str.upper() == 'KS']['zaman'].iloc[0]
    return group
