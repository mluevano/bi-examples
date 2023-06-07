
import pandas as pd
import pyodbc
import json

# Datos de conexión a SQL Server
server = '127.0.0.1'
database = 'PythonTest'
username = 'SA'
password = 'Admin5341#'

# Establecer la conexión con la base de datos
conexion = pyodbc.connect('Driver={SQL Server Native Client 11.0};'
                          'Server='+server+';'
                          'Database='+database+';'
                          'UID='+username+';'
                          'PWD='+password+'')
# Consulta SQL
consulta = "SELECT * FROM [bill].[EmailTemplate]"

# Ejecutar la consulta y almacenar los resultados en un DataFrame de pandas
df = pd.read_sql_query(consulta, conexion)

# Exportar los resultados a un archivo JSON
df.to_json('EmailTemplate.json', orient='records')

# Cerrar la conexión
conexion.close()

