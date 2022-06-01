from dash import Dash, html, dcc, Input, Output
from dash.exceptions import PreventUpdate
import plotly.express as px
import pandas as pd
import database as db

app = Dash(__name__)
exp_List = ["{0}-{1}-{2}".format(row[1], row[2], row[3]) for index, row in db.getUpdatedExpList().iterrows()]


app.layout = html.Div(children=[
    html.Div(children=[
        dcc.Dropdown(placeholder="Enter a value or refresh the list", id="exp-lister", options=exp_List
    )
    ], style={"width":"40%", "padding":50}),
    html.Div(children=[
        dcc.Dropdown(placeholder="Enter a value or refresh the list", id="exp-lister2", options=exp_List
    )
    ], style={"width":"40%", "padding":10}),
], style={"display":"flex", "flex-direction":"row"})



if __name__ == '__main__':
    app.run_server(debug=True)