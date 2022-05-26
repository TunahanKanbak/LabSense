from dash import Dash, html
import pandas as pd

df = pd.read_csv('https://gist.githubusercontent.com/chriddyp/c78bf172206ce24f77d6363a2d754b59/raw/c353e8ef842413cae56ae3920b8fd78468aa4cb2/usa-agricultural-exports-2011.csv')

table = {
    'border-collapse': 'collapse',
    'border': '2px solid rgb(200, 200, 200)',
    'letter-spacing': '1px',
    'font-family': 'sans-serif',
    'font-size': '.8rem'
}

cell = {
    'border': '1px solid rgb(190, 190, 190)',
    'padding': '5px 10px'
}

def generate_table(dataframe, max_rows=10):
    return html.Table([
        html.Thead(
            html.Tr([html.Th(col) for col in dataframe.columns])
        ),
        html.Tbody([
            html.Tr([
                html.Td(dataframe.iloc[i][col], style=cell) for col in dataframe.columns
            ]) for i in range(min(len(dataframe), max_rows))
        ])
    ], style=table)


app = Dash(__name__)

app.layout = html.Div([
    html.H4(children='US Agriculture Exports (2011)'),
    generate_table(df)
])

if __name__ == '__main__':
    app.run_server(debug=True)