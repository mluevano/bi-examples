# Documentación del Repositorio de Consultas SQL

Este repositorio contiene dos consultas de SQL para la tabla de Customer y Orders en la base de datos bill. Ambas consultas utilizan diferentes tipos de joins para combinar la información de diferentes tablas en una sola consulta.

## Consulta de Pedidos
La consulta Consulta de Pedidos muestra una lista de todos los pedidos de los clientes en la tabla Customer. La consulta utiliza las siguientes tablas:

Customer: Esta tabla contiene información sobre los clientes, como su nombre, dirección, etc.

Orders: Esta tabla contiene información sobre los pedidos realizados por los clientes, como el ID del cliente, la fecha del pedido, el estado del pedido, etc.
OrderStatus: Esta tabla contiene información sobre los estados posibles de los pedidos, como "Enviado", "Entregado", etc.

La consulta utiliza varios joins para combinar la información de estas tablas y mostrar información detallada sobre los pedidos de los clientes. Además, la consulta también utiliza una subconsulta para contar el número total de pedidos que no están relacionados con ningún cliente en la tabla Customer.

## Consulta de Clientes

La consulta Consulta de Clientes muestra una lista de todos los clientes en la tabla Customer. La consulta utiliza las mismas tablas que la consulta anterior.

Al igual que la consulta anterior, la consulta utiliza varios joins para combinar la información de estas tablas y mostrar información detallada sobre los clientes. Además, la consulta también utiliza una subconsulta para contar el número total de pedidos que no están relacionados con ningún cliente en la tabla Customer.

## Cómo utilizar estas consultas

Para utilizar estas consultas, simplemente copie y pegue la consulta deseada en su editor de SQL preferido y ejecútela en la base de datos bill. Asegúrese de tener los permisos necesarios para acceder a la base de datos y a las tablas correspondientes antes de ejecutar estas consultas.

Ejemplo de Union de SalesOrders y Customers

´´´sql
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

--## Consulta de Clientes

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
´´´

¡Eso es todo! Espero que esta documentación sea útil para utilizar estas consultas en su proyecto. Si tiene alguna pregunta o sugerencia, no dude en crear un problema en este repositorio.
