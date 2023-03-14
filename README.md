# Tabla de contenidos BI

- [Introducción](#introducción)
- [Primeros pasos](#primeros-pasos)
- [Ejemplos de Consulta](#sección-dos)
- [Conclusiones](#conclusiones)

## Introducción

Bienvenido/a al repositorio de ejemplo para el uso de SQL y BI. Este repositorio tiene como objetivo proporcionar ejemplos prácticos y guías útiles para aquellos que estén interesados en aprender sobre SQL y BI.

### ¿Qué es SQL?
SQL (Structured Query Language) es un lenguaje de programación utilizado para administrar y manipular bases de datos relacionales. Se utiliza para realizar diversas tareas, como la creación de bases de datos, la inserción de datos en ellas, la modificación de datos existentes y la eliminación de datos. SQL es un lenguaje muy popular entre los desarrolladores y analistas de datos debido a su facilidad de uso y su capacidad para manejar grandes conjuntos de datos.

### ¿Qué es BI?
BI (Business Intelligence) es un conjunto de tecnologías y herramientas que se utilizan para analizar y presentar datos empresariales. BI se utiliza para ayudar a las empresas a tomar decisiones informadas, basadas en datos, sobre su rendimiento y estrategias. BI incluye herramientas para la visualización de datos, la elaboración de informes, el análisis de datos y la minería de datos.

En este repositorio, encontrarás ejemplos prácticos de cómo utilizar SQL y BI juntos para analizar y visualizar datos empresariales. También encontrarás guías útiles sobre cómo crear bases de datos, escribir consultas SQL y utilizar herramientas de BI populares como Tableau y Power BI.

¡Esperamos que encuentres este repositorio útil y que te ayude a aprender más sobre SQL y BI!

## Primeros pasos

Es necesario cargar una base de datos de muestra como AdventureWorks de SQL Server para realizar ejercicios, puedes hacerlo en el siguiente enlace:

[Descarga .bak de AdventureWorks 2019](https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak)

### Notas 

```sql
select
*,
Notes
FirstName,
from 
bill.Customer cst
LEFT JOIN bill.Orders ord 
on cst.CustomerID = ord.CustomerId
INNER JOIN
bill.ORderStatus ords 
on ord.OrderStatusId = ords.StatusId
LEFT JOIN
(
	SELECT Count(Total) as Todal 
	FROM bill.Orders where OrderId not in 
		(
			Select * from bill.Customers where CreationDate= GEtdate()
			
		)
) as ordt
ON ord.OrderId = ordt.OrderId
```

## Ejemplos de GROUP BY

Aqui vemos un ejemplo con las tablas Pedidos y Clientes, para revisar todos los ejemplos, los puedes encontrar en 

[Ejemplos de Consultas Selects.sql](https://github.com/mluevano/mysql-examples/blob/main/Ejemplos%20de%20Cnosultas%20Selects.sql)

