use AdventureWorksLT2019
select  pm.Name as ProductModel, ppc.Name as ParentProductCategory, pc.Name as CategoryName, p.ProductID, p.Name, p.Color, p.ListPrice from SalesLT.Product as p
inner join SalesLT.ProductCategory pc
	on pc.ProductCategoryID = p.ProductCategoryID
inner join SalesLT.ProductCategory ppc
	on ppc.ProductCategoryID = pc.ParentProductCategoryID
inner join SalesLT.ProductModel pm
	on pm.ProductModelID = p.ProductModelID
where p.Color like '%e'
order by p.ListPrice desc


/*
tarea moral:
con base en el url http://bifuture.blogspot.com/2010/04/datavault-identying-hubs.html
defina los campos que deben tener las dimensiones (product, customer) y las fact (sod, soh)
*/