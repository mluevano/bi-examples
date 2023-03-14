/*
DOCUMENTACI�N:
Nombre de la vista: VW_Sales_BI
Descripci�n: Esta vista se utiliza para obtener informaci�n de ventas detallada, incluyendo informaci�n del cliente y del vendedor.
*/
ALTER VIEW VW_Sales_BI 
AS
SELECT 
sloh.*,
IIF(sloh.OnlineOrderFlag = 0,'Venta f�sica','Venta en l�nea') as OnlineOrderFlagName, 
CONCAT_WS(' ',prsn.FirstName,prsn.LastName) as Vendedor,
slt.[Name] SalesRegion,
slt.[Group] Continent,
spm.[Name]  as ShipMethod
FROM 
Sales.SalesOrderHeader sloh
LEFT JOIN
Sales.Customer cst on sloh.CustomerID = cst.CustomerID
LEFT JOIN
Person.Person prsn on sloh.SalesPersonID = prsn.BusinessEntityID
LEFT JOIN
Sales.SalesTerritory slt on sloh.TerritoryID = slt.TerritoryID
LEFT JOIN
Purchasing.ShipMethod spm ON sloh.ShipMethodID = spm.ShipMethodID
go

select * from VW_Sales_BI

