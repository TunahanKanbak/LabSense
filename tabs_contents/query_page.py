import dash
from dash import Dash, html, dcc, Input, Output, State, ctx
from dash.exceptions import PreventUpdate
import dash_bootstrap_components as dbc
from app import app
from database import database

exp_list_DB = database.getUpdatedExpList()
exp_res_DB = database.getUpdatedExpResult()


query_page = dbc.Container(
    dbc.Row([
        dbc.Col(dcc.Dropdown(
            options=exp_list_DB["Fullname"], placeholder="Select an experiment", multi=True, id="result-list-picker"
        ), width={"size": 4, "order": "first"}),
        dbc.Col(html.P(id="test-area"), width={"size": 6, "offset": 2, "order": "last"}),
    ])
)

@app.callback(
    Output("test-area", "children"),
    Input("result-list-picker", "value")
)
def createResultTable(experiment_list):
    if experiment_list is None:
        raise PreventUpdate

    return createDynamicTable(experiment_list)
    #return [html.P("You will see {0}'s result here".format(experiment)) for experiment in experiment_list]


def createDynamicTable(filter_list):
    filtered_exp_list = exp_list_DB[exp_list_DB["Fullname"].isin(filter_list)]
    merged_exp_result = filtered_exp_list.merge(exp_res_DB, how="left", on="id", indicator=True)
    sorted_exp_result = merged_exp_result.sort_values(["Fullname", "time"])
    sorted_exp_result = sorted_exp_result[sorted_exp_result["_merge"] == "both"]

    table_header = [html.Thead(html.Tr([html.Th("Exp Name"), html.Th("Time"), html.Th("Result")]))]
    table_body = [html.Tbody([html.Tr([html.Td(value) for value in row]) for index, row
                              in sorted_exp_result[["Fullname", "time", "res"]].iterrows()])]

    return dbc.Table(table_header + table_body, bordered=True, hover=True, striped=True)

