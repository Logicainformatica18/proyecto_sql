--funciones de agregado para consultas
--sum
--avg
--count
--max
--min
select c.Nombre ,count(*) from articulos a
join categorias c
on a.Categ = c.Categoria
group by c.Nombre

--avg
select a.NomArticulo ,
avg(d.preventa * d.Cantidad) 
from articulos a
join Detalles d
on a.IdArticulo = d.IdArticulo
group by a.NomArticulo
------------------------------------------
-- consulta para una factura
--(consulta de parámetros)
declare @idfactura int =10000
select  idfactura, fecha,c.NomCliente from Facturas f
inner join clientes c 
on f.idcliente = c.Idcliente
where IdFactura = @idfactura
--detalle
select a.NomArticulo ,d.preventa, d.Cantidad,
d.PreVenta * d.Cantidad as subtotal,
(d.PreVenta * d.Cantidad ) * 0.10 as dscto,
(d.PreVenta * d.Cantidad)- (d.PreVenta * d.Cantidad ) * 0.10  as monto
from articulos a
join Detalles d
on a.IdArticulo = d.IdArticulo
where d.IdFactura =  @idfactura
order by a.NomArticulo asc
