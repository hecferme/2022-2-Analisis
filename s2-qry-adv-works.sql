use AdventureWorksLT2019
select pc.Name as CategoryName, p.ProductID, p.Name, p.Color, p.ListPrice from SalesLT.Product as p
inner join SalesLT.ProductCategory pc
	on pc.ProductCategoryID = p.ProductCategoryID
where p.Color like '%e'
order by p.ListPrice desc