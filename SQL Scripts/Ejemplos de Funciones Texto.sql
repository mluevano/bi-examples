
--### Funci�n CONCAT_WS
select CONCAT_WS(' ',FirstName,LastName) as FullName, * FROM Person.Person

--### Funci�n ISNULL
select ISNULL(Title, 'Sin Titulo') as Title, * FROM Person.Person

--### Funci�n REPLICATE, LEN y CONCAT
select CONCAT(REPLICATE('0',6-LEN(BusinessEntityID)),BusinessEntityID) as FolioEntity, * FROM Person.Person

--### Funci�n SUBSTRING
select SUBSTRING(CAST(rowguid as nvarchar(100)),1,10) as PartialRowGUID, * FROM Person.Person

--### Funci�n REPLACE
select ISNULL(REPLACE(Title,'Sr.','Se�or'),'') as DescriptionTitle, * FROM Person.Person
select COALESCE(REPLACE(Title,'Sr.','Se�or'),'') as DescriptionTitle, * FROM Person.Person
select REPLACE(REPLACE(Title,'Sr.','Se�or'),'Sra.','Se�ora') as DescriptionTitle, * FROM Person.Person
select CASE WHEN Title IN ('Sr.','Mr.') THEN 'Se�or' 
	ELSE 
		CASE WHEN tITLE IN ('Mrs.','Sra.','Ms.','Ms')THEN 'Sra' 
	ELSE '' 
	END 
END as DescriptionTitle, * FROM Person.Person

--### Funci�n COALESCE
select COALESCE(Title,'Vacio.') as DescriptionTitle, * FROM Person.Person
select COALESCE(Title,MiddleName,'Vacio.') as DescriptionTitle, * FROM Person.Person

