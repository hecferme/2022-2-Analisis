--create database HelloWorld
use HelloWorld
select 'Hola Mundo' as HolaMundo;
select 12763454.0 / 3214;
declare @v1 as int = 12763454;
declare @v2 as int = 3214;
select cast (@v1 as float) / @v2;
declare @v3 as varchar (10) = 'Hello'
declare @v4 as varchar (10) = 'World'
select len(substring(lower (upper (CONCAT(@v3, ' ', @v4))), 3, 5)) as helloworld

declare @f1 as date = '2021-05-29 15:49:30.317'
declare @f2 as dateTIME = '2025-11-19 15:39:38.517'
declare @f3 as time = '2021-05-29 15:49:30.317'
select @f1, @f2, @f3
select DATEADD(hour, -17, @f2)
select DATEDIFF (hour, @f2, getdate()) 
select convert(varchar(120), @f2, 109)
select DATEPART(hour, @f3)

declare @h1 as int = 4;
select 
	case @h1
		when 1 then 'Hello'
		when 2 then 'World'
		when 5 then 'Cinco'
		else 'Hola Mundo'
	end as ColumnaCase


declare @h2 as float = 4.5;
select 
	case
		when @h2 > 1 then 'Hello'
		when @h2 > 2 then 'World'
		when @h2 > 5 then 'Cinco'
		else 'Hola Mundo'
	end as ColumnaCase