import pandas as pd
from dash import Dash, html, dcc, Input, Output, State, ctx
from dash.exceptions import PreventUpdate
import dash_bootstrap_components as dbc
import dash_mantine_components as dmc
from app import app

viscosity_input_table = dbc.Container([
    dbc.Container([
        dbc.Row([
            dbc.Col(dbc.Label('Tanım'), width={'size': 3}, style={'font-weight': 'bold'}),
            dbc.Col(dbc.Label('Zaman'), width={'size': 3}, style={'font-weight': 'bold'}),
            dbc.Col(dbc.Label('Değer'), width={'size': 3}, style={'font-weight': 'bold'}),
            dbc.Col(dbc.Label('Sıcaklık'), width={'size': 3}, style={'font-weight': 'bold'})
    ]),
        dbc.Row([
            dbc.Col(
                dbc.Input(placeholder='Run X', type='text'), width={'size': 3}
            ),
            dbc.Col(
                dmc.TimeInput(), width={'size': 3}
            ),
            dbc.Col(
                dbc.Input(placeholder='4.2', type='number', min=0, max=100), width={'size': 3}
            ),
            dbc.Col(
                dbc.Input(placeholder='50', type='number', min=20, max=60), width={'size': 3}
            )
    ]),
],
        id='viscosity_table'),
    html.Br(),
    dbc.Row([
        dbc.Col(
            dbc.Button('Add Row', id='add_row'), width={'size': 'auto', 'order': 'first'}, style={'padding-top': '40px'}
        ),
        dbc.Col(
            dbc.Button('Remove Row', id='remove_row'), width={'size': 'auto', 'order': 'last'}, style={'padding-top': '40px'}
        )
    ])
])

new_data_page = dbc.Container([
    dbc.Modal([
            dbc.ModalHeader(dbc.ModalTitle("Veri Girişı Tamamlanamadı!")),
            dbc.ModalBody("Kod, Teknisyen, Tarih ve Küratif Ekleme alanları boş bırakılamaz."),
            dbc.ModalFooter(dbc.Button("Close", id="close_error_modal")),
            ],
            id="error_modal",
            is_open=False,
        ),
    dbc.Modal([
            dbc.ModalHeader(dbc.ModalTitle("Veri Girişı Tamamlandi!")),
            dbc.ModalBody("Teşekkürler."),
            dbc.ModalFooter(dbc.Button("Close", id="close_success_modal")),
            ],
            id="success_modal",
            is_open=False,
        ),
    dbc.Row([
        dbc.Col([
            dbc.InputGroup([dbc.InputGroupText("Kod"), dbc.Input(placeholder='YGXX-XXX-XX', type='text', id='code')]),
            html.Br(),
            dbc.InputGroup([dbc.InputGroupText("Teknisyen"), dbc.Input(placeholder='İsim Soyisim', type='text', id='operator')]),
            html.Br(),
            dbc.InputGroup([dbc.InputGroupText("Tarih"), dbc.Input(type='date', id='date')]),
            html.Br(),
            dbc.InputGroup([dbc.InputGroupText("Küratıf Ekleme Saatı"), dmc.TimeInput(id='curative_add')])],
            width={'size': 3}),
        dbc.Col([
            viscosity_input_table],
            style={'border-style': 'solid', 'background-color': 'rgb(196, 196, 196)'}, width={'size': 5, 'offset': 2}
        )], style={'padding-top': '20px'}),
    dbc.Row(
            dbc.Col(
                dbc.Button('Submit', id='submit_data'), width={'size': 1, 'offset': 11}))
])

@app.callback(
    Output('viscosity_table', 'children'),
    Input('add_row', 'n_clicks'),
    Input('remove_row', 'n_clicks'),
    Input('submit_data', 'n_clicks'),
    State('viscosity_table', 'children'),
    State('code', 'value'),
    State('operator', 'value'),
    State('date', 'value'),
    State('curative_add', 'value')
)
def update_row(n_clicks_add, n_clicks_remove, n_clicks_submit, rows, code, operator, date, curative_add):
    if ctx.triggered_id == 'add_row' and n_clicks_add is not None:
        rows.append(
            dbc.Row([
                dbc.Col(
                    dbc.Input(placeholder='Run X', type='text'), width={'size': 3}
                ), dbc.Col(
                    dmc.TimeInput(), width={'size': 3}
                ), dbc.Col(
                    dbc.Input(placeholder='4.2', type='number', min=0, max=100), width={'size': 3}
                ),
                   dbc.Col(
                    dbc.Input(placeholder='50', type='number', min=20, max=60), width={'size': 3}
                )
            ])
        )
        return rows
    elif ctx.triggered_id == 'remove_row' and n_clicks_remove is not None:
        if len(rows) > 2:
            rows.pop()
            return rows
        else:
            raise PreventUpdate
    elif ctx.triggered_id == 'submit_data' and n_clicks_submit is not None:
        if None in [code, operator, date, curative_add] or '' in [code, operator, date, curative_add]:
            raise PreventUpdate
        else:
            return [
                    dbc.Row([
                        dbc.Col(dbc.Label('Tanım'), width={'size': 3}, style={'font-weight': 'bold'}),
                        dbc.Col(dbc.Label('Zaman'), width={'size': 3}, style={'font-weight': 'bold'}),
                        dbc.Col(dbc.Label('Değer'), width={'size': 3}, style={'font-weight': 'bold'}),
                        dbc.Col(dbc.Label('Sıcaklık'), width={'size': 3}, style={'font-weight': 'bold'})
                    ]),
                    dbc.Row([
                        dbc.Col(
                            dbc.Input(placeholder='Run X', type='text'), width={'size': 3}
                        ), dbc.Col(
                            dmc.TimeInput(), width={'size': 3}
                        ), dbc.Col(
                            dbc.Input(placeholder='4.2', type='number', min=0, max=100), width={'size': 3}
                        ),
                           dbc.Col(
                            dbc.Input(placeholder='50', type='number', min=20, max=60), width={'size': 3}
                        )
                    ]),
                ]
    else:
        raise PreventUpdate


@app.callback(
    Output('code', 'value'),
    Output('operator', 'value'),
    Output('date', 'value'),
    Output('curative_add', 'value'),
    Input('submit_data', 'n_clicks'),
    State('viscosity_table', 'children'),
    State('code', 'value'),
    State('operator', 'value'),
    State('date', 'value'),
    State('curative_add', 'value')
)
def submit_data(n_clicks, children, code, operator, date, curative_add):
    if n_clicks is None:
        raise PreventUpdate

    if None in [code, operator, date, curative_add] or '' in [code, operator, date, curative_add]:
        raise PreventUpdate

    print('Here is our result:\n{}\n{}\n{}\n{}'.format(code, operator, date, curative_add))

    df = pd.DataFrame({'Tag': [],
                           'Time': [],
                           'Result': [],
                           'Temperature': []})


    for row in children:
        for col in row['props']['children']:
            if 'value' in col['props']['children']['props'].keys():
                #print(col['props']['children'])
                print(col['props']['children']['props']['value'])

    return None, None, None, None


@app.callback(
    Output("error_modal", "is_open"),
    Input("close_error_modal", "n_clicks"),
    Input('submit_data', 'n_clicks'),
    State('code', 'value'),
    State('operator', 'value'),
    State('date', 'value'),
    State('curative_add', 'value'),
    prevent_initial_call=True
)
def toggle_error_modal(n1, n2, code, operator, date, curative_add):
    if ctx.triggered_id == 'close_error_modal':
        return False

    if None in [code, operator, date, curative_add] or '' in [code, operator, date, curative_add]:
        return True

@app.callback(
    Output("success_modal", "is_open"),
    Input("close_success_modal", "n_clicks"),
    Input('submit_data', 'n_clicks'),
    State('code', 'value'),
    State('operator', 'value'),
    State('date', 'value'),
    State('curative_add', 'value'),
    prevent_initial_call=True
)
def toggle_success_modal(n1, n2, code, operator, date, curative_add):
    if ctx.triggered_id == 'close_success_modal':
        return False

    if None not in [code, operator, date, curative_add] and '' not in [code, operator, date, curative_add]:
        return True
