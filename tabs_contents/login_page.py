import dash
from dash import Dash, html, dcc, Input, Output, State, ctx
from dash.exceptions import PreventUpdate
import dash_bootstrap_components as dbc
from app import app
from database import labDBmanager


login_page = dbc.Container([
    dbc.Row([
        dbc.Col([
            dbc.Alert("Invalid username or password", id="login-error-alert", color="danger", is_open=False, dismissable=True)
        ], width="auto")
    ], justify="left"),
    dbc.Row([
        dbc.Col([
            dbc.Label("Username"),
            dbc.Input(type="text", id="username-box")
        ], width={"size": "auto"})
    ], justify="center"),
    dbc.Row([
        dbc.Col([
            dbc.Label("Password"),
            dbc.Input(type="password", id="password-box")
        ], width="auto")
    ], justify="center"),
    dbc.Row([
        dbc.Col([
            html.Br(),
            dbc.Button("Login", id="login-control-button", color="success")
        ], width={"size": "auto", "offset": "2"})
    ], justify="center"),
])

@app.callback(
    Output("request-tab", "disabled"),
    Output("query-tab", "disabled"),
    Output("logout-tab", "disabled"),
    Output("new-data-tab", "disabled"),
    Output("login-tab", "disabled"),
    Output("tabs", "active_tab"),
    Output("login-error-alert", "is_open"),
    Input("login-control-button", "n_clicks"),
    Input("tabs", "active_tab"),
    State("username-box", "value"),
    State("password-box", "value"),
    prevent_initial_call=True
)
def yetkiKontrol(n_clicks, tab, uname, pword):
    if ctx.triggered_id == "login-control-button":
        if n_clicks is None:
            raise PreventUpdate

        permission_level = labDBmanager.obje1.kullanici_sec(uname, pword)
        print(permission_level)

        if permission_level == "admin":
            return False, False, False, False, True, "request-tab", False
        elif permission_level == "technician":
            return dash.no_update, dash.no_update, False, False, True, "new-data-tab", dash.no_update
        elif permission_level == "customer":
            return False, False, False, dash.no_update, True, "request-tab", dash.no_update
        else:
            return dash.no_update, dash.no_update, dash.no_update, dash.no_update, dash.no_update, \
                   dash.no_update, True

    if ctx.triggered_id == "tabs" and tab == "logout-tab":
        return True, True, True, True, False, "login-tab", False

    raise PreventUpdate