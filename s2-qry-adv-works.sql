------------ dim product ---------------
use AdventureWorksLT2019
--select * from SalesLT.Product p;
select  pm.Name as ProductModel, ppc.Name as ParentProductCategory, pc.Name as CategoryName, 
p.ProductID, p.Name, p.Color, p.ListPrice, p.StandardCost, p.Size, p.Weight,
p.SellStartDate, p.SellEndDate, p.DiscontinuedDate,
'' as EstratoCost, '' as EstratoPrice
--into DWAdventureWorksLT.dbo.DimProduct
from SalesLT.Product as p
inner join SalesLT.ProductCategory pc
	on pc.ProductCategoryID = p.ProductCategoryID
inner join SalesLT.ProductCategory ppc
	on ppc.ProductCategoryID = pc.ParentProductCategoryID
inner join SalesLT.ProductModel pm
	on pm.ProductModelID = p.ProductModelID
--where p.Color like '%e'
order by p.ListPrice desc


------------- dim customer -----------------
use AdventureWorksLT2019
select max (ca.AddressType) as AddressType, c.CustomerID, c.FirstName + ' ' + c.LastName as SingleFirstNameLastName
, c.LastName + ', ' + c.FirstName as SingleLastNameFirstName
, c.CompanyName, a.City, a.StateProvince, a.CountryRegion
--into DWAdventureWorksLT.dbo.DimCustomer
from SalesLT.Customer c
inner join SalesLT.CustomerAddress ca
	on c.CustomerID = ca.CustomerID
inner join SalesLT.Address a
	on a.AddressID = ca.AddressID
group by
	c.CustomerID, c.FirstName + ' ' + c.LastName 
	, c.LastName + ', ' + c.FirstName
	, c.CompanyName, a.City, a.StateProvince, a.CountryRegion

-------------------- fact sales order header ----------------
use AdventureWorksLT2019
select h.SalesOrderID, h.OrderDate, h.DueDate, h.ShipDate
, case h.Status
when 1 then 'In process' when 2 then 'Approved' 
when 3 then 'Backordered' when 4 then 'Rejected'
when 5 then 'Shipped' when 6 then 'Cancelled'
else 'Unknown' end as Status,
h.OnlineOrderFlag, h.CustomerID 
, a.City, a.StateProvince, a.CountryRegion, h.ShipMethod, 
h.SubTotal, h.TaxAmt, h.Freight, h.TotalDue
--into DWAdventureWorksLT.dbo.FactSalesOrderHeader
from SalesLT.SalesOrderHeader h
inner join SalesLT.Address a
	on a.AddressID = h.ShipToAddressID

------------------- fact sales order detail ----------------
use AdventureWorksLT2019
select 
d.SalesOrderID, d.ProductID, d.UnitPrice, d.OrderQty, 
d.UnitPriceDiscount * 100 as DiscountPercentage, 
d.UnitPriceDiscount * d.UnitPrice as UnitDiscount,
d.UnitPrice * d.OrderQty as PreviousTotal,
d.UnitPriceDiscount * d.UnitPrice * d.OrderQty as TotalDiscount
,d.LineTotal
--into DWAdventureWorksLT.dbo.FactSalesOrderDetail
from SalesLT.SalesOrderDetail d 

/*
tarea moral:
con base en el url http://bifuture.blogspot.com/2010/04/datavault-identying-hubs.html
defina los campos que deben tener las dimensiones (product, customer) y las fact (sod, soh)
*/