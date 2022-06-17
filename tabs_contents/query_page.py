import dash
from dash import Dash, html, dcc, Input, Output, State, ctx
from dash.exceptions import PreventUpdate
import dash_bootstrap_components as dbc
from app import app
from database import database



query_page = dbc.Container(
    dbc.Row([
        dbc.Col(dcc.Dropdown(
            options=["to be constructed"], placeholder="Select an experiment", multi=True, id="result-list-picker"
        ), width={"size": 4, "order": "first"}),
        dbc.Col(html.P(id="test-area"), width={"size": 6, "offset": 2, "order": "last"}),
    ])
)

@app.callback(
    Output("test-area", "children"),
    Input("result-list-picker", "value")
)
def sonuclariGoster(experiment_list):
    pass


def createDynamicTable(filter_list):
    pass
