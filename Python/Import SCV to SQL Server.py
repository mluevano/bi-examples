import csv
import pyodbc
import pandas as pd

# Datos de conexión a SQL Server
server = '127.0.0.1'
database = 'PythonTest'
username = 'SA'
password = 'Admin5341#'

# Conexión a SQL Server
conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)

# Ruta y nombre del archivo CSV a cargar
csv_file = 'C:/Phyton Data/Customers.csv'

data_csv = pd.read_csv(csv_file)
list_valores = data_csv.values.tolist()



# Nombre de la tabla en la que se cargarán los datos
table_name = 'Customers'

# Abrir archivo CSV y determinar tipos de datos
with open(csv_file, 'r') as f:
    reader = csv.reader(f)
    header = next(reader)  # Obtener encabezados de las columnas
    types = []
    for row in reader:
        for i, col in enumerate(row):
            try:
                # Intentar convertir a entero
                int(col)
                if i >= len(types):
                    types.append('INT')
                elif types[i] != 'INT':
                    types[i] = 'DECIMAL(19,6)'  # Si ya se había detectado como FLOAT, dejar como FLOAT
            except ValueError:
                try:
                    # Intentar convertir a fecha
                    pd.to_datetime(col)
                    if i >= len(types):
                        types.append('DATETIME')
                    elif types[i] != 'DATETIME':
                        types[i] = 'VARCHAR(50)'  # Si ya se había detectado como VARCHAR, dejar como VARCHAR
                except ValueError:
                    try:
                        # Intentar convertir a decimal
                        float(col)
                        if i >= len(types):
                            types.append('DECIMAL(19,6)')
                        elif types[i] != 'DECIMAL(19,6)':
                            types[i] = 'VARCHAR(50)'
                    except ValueError:
                        if i >= len(types):
                            types.append('VARCHAR(50)')

# Generar comando SQL para crear la tabla
create_table_sql = f'IF OBJECT_ID(N\'dbo.{table_name}\', N\'U\') IS NOT NULL DROP TABLE [dbo].[{table_name}]; CREATE TABLE {table_name} ('
for i, col in enumerate(header):
    create_table_sql += '{} {}, '.format(col.strip().replace(" ","").title(), types[i])
create_table_sql += ')'

# Ejecutar comando SQL para crear la tabla
cursor = conn.cursor()
cursor.execute(create_table_sql)
conn.commit()

# Cargar datos del archivo CSV a la tabla
query = 'INSERT INTO {} VALUES ({})'.format(table_name, ', '.join('?'*len(header)))
    
# Insertar un set de datos
cursor.executemany(query, list_valores)
conn.commit()

# Cerrar conexión a SQL Server
conn.close()
