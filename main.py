from dash import Dash, html, dcc, Input, Output, State, ctx
import dash_bootstrap_components as dbc
from dash.exceptions import PreventUpdate
import plotly.express as px
import pandas as pd
import database as db
from tabs_contents import login_page, new_data_page, query_page, request_page
from app import app

app.layout = dbc.Container([
    dbc.Tabs([
        dbc.Tab(children=login_page.login_page, label="Login", active_tab_style={"font-weight": "bold"}, id="login-tab",
                tab_id="login-tab"),
        dbc.Tab(children=request_page.request_page, label="Request", active_tab_style={"font-weight": "bold"}, id="request-tab",
                tab_id="request-tab", disabled=True),
        dbc.Tab(children=query_page.query_page, label="Query", active_tab_style={"font-weight": "bold"}, id="query-tab",
                tab_id="query-tab", disabled=True),
        dbc.Tab(children=new_data_page.new_data_page, label="New Data", active_tab_style={"font-weight": "bold"},
                tab_id="new-data-tab", id="new-data-tab", disabled=True),
        dbc.Tab(label="Logout", id="logout-tab", tab_id="logout-tab",
                tab_style={"marginLeft": "auto", "text-align": "right"}, disabled=True)],
        id="tabs",
        active_tab="login-tab"
    )
])

if __name__ == '__main__':
    app.run_server(debug=True)