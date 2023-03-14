
--### Función CONCAT_WS
select CONCAT_WS(' ',FirstName,LastName) as FullName, * FROM Person.Person

--### Función ISNULL
select ISNULL(Title, 'Sin Titulo') as Title, * FROM Person.Person

--### Función REPLICATE, LEN y CONCAT
select CONCAT(REPLICATE('0',6-LEN(BusinessEntityID)),BusinessEntityID) as FolioEntity, * FROM Person.Person

--### Función SUBSTRING
select SUBSTRING(CAST(rowguid as nvarchar(100)),1,10) as PartialRowGUID, * FROM Person.Person

--### Función REPLACE
select ISNULL(REPLACE(Title,'Sr.','Señor'),'') as DescriptionTitle, * FROM Person.Person
select COALESCE(REPLACE(Title,'Sr.','Señor'),'') as DescriptionTitle, * FROM Person.Person
select REPLACE(REPLACE(Title,'Sr.','Señor'),'Sra.','Señora') as DescriptionTitle, * FROM Person.Person
select CASE WHEN Title IN ('Sr.','Mr.') THEN 'Señor' 
	ELSE 
		CASE WHEN tITLE IN ('Mrs.','Sra.','Ms.','Ms')THEN 'Sra' 
	ELSE '' 
	END 
END as DescriptionTitle, * FROM Person.Person

--### Función COALESCE
select COALESCE(Title,'Vacio.') as DescriptionTitle, * FROM Person.Person
select COALESCE(Title,MiddleName,'Vacio.') as DescriptionTitle, * FROM Person.Person

