

--# Calculations for Totals by Orders and Customers 

--## Consulta de Pedidos

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