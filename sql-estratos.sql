select * from Estratificacion b

begin tran
--update DimProduct set ListPrice = 28 where ProductID = 707
update DimProduct set EstratoPrice = 
(select e.Nombre from Estratificacion e where
e.Categoría = 'PrecioProducto' and 
e.Desde <= DimProduct.ListPrice and DimProduct.ListPrice < e.Hasta
)
commit;
select p.EstratoPrice,  p.* from DimProduct p
rollback