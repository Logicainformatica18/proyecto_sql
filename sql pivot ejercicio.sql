-----------
select a.nomarticulo,c.nombre,d.cantidad
from Articulos a 
join Categorias c
on a.Categ = c.Categoria
join Detalles d
on d.IdArticulo = a.IdArticulo
--crear vista
create view v_total_cantidad_articulos
as
select a.nomarticulo,c.nombre,d.cantidad
from Articulos a 
join Categorias c
on a.Categ = c.Categoria
join Detalles d
on d.IdArticulo = a.IdArticulo

select * from  v_total_cantidad_articulos
pivot ( 
sum(cantidad) for nombre in ([Multimedias],[Componentes])
) as p
----------
select c.NomCliente,a.nomarticulo,
d.PreVenta * d.Cantidad as subtotal 
from Clientes c
inner join 
Facturas f
on c.Idcliente = f.IdCliente
inner join detalles d
on f.IdFactura = d.IdFactura
inner join Articulos a 
on d.IdArticulo = a.IdArticulo
go
-- crear vistas
create view v_total_articulo_cliente
as
select c.NomCliente,a.nomarticulo,
d.PreVenta * d.Cantidad as subtotal 
from Clientes c
inner join 
Facturas f
on c.Idcliente = f.IdCliente
inner join detalles d
on f.IdFactura = d.IdFactura
inner join Articulos a 
on d.IdArticulo = a.IdArticulo
--sql pivot
select * from  v_total_articulo_cliente
pivot(
sum(subtotal) for nomarticulo in ([Case AT Minitower],[Case ATX Minitower])
) as p


