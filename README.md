# Coleccion de Ejemplos SQL

## Ejemplos de Consulta

Aqui vemos un ejemplo con las tablas Pedidos y Clientes, para revisar todos los ejemplos, los puedes encontrar en 

[Ejemplos de Consultas Selects.sql](https://github.com/mluevano/mysql-examples/blob/main/Ejemplos%20de%20Cnosultas%20Selects.sql)

```sql
select
*,
Notes,
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

