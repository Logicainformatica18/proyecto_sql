
use pcventas
go
--
select * from Clientes
select * from Facturas
select * from Detalles
go
create view v_clientes_d_facturas
as
select c.nomcliente,year(f.fecha) as anio,(d.cantidad * d.PreVenta) as subtotal 
from Detalles d  inner join Facturas f on d.IdFactura = f.IdFactura 
join clientes c on c.Idcliente = f.IdCliente

/*
select c.NomCliente,year(f.fecha) as anio, (d.PreVenta * d.Cantidad) as subtotal
from Clientes c inner join Facturas f on c.Idcliente = f.IdCliente
inner join Detalles d on f.IdFactura = d.IdFactura
*/
select * from v_clientes_d_facturas

select * from v_clientes_d_facturas
 pivot(
 sum(subtotal) for nomcliente in([ALFREDO HUAYTA],[MARCOS VALER],[ALEJANDRO VALDERRAMA])  
 ) AS P
 go
 -- pivot articulos detalles factura
 
 create view v_articulos_detalle_factura
 as 
 select a.NomArticulo ,year(f.fecha) as anio,(d.PreVenta * d.Cantidad) as subtotal 
 from facturas f inner join detalles d on f.IdFactura = d.IdFactura
 inner join Articulos a on d.IdArticulo = a.IdArticulo
 --sql pivot
 select * from v_articulos_detalle_factura
 pivot(
 avg(subtotal) for nomarticulo in ([Case AT Minitower])
 ) as p

 -------------------
 create view v_categoria_articulo_detalle 
 as
 select C.Nombre as Categoria, A.NomArticulo,(d.PreVenta * d.Cantidad) as subtotal 
 from Categorias C inner join Articulos A on A.categ = C.Categoria
 inner join Detalles D on D.IdArticulo = A.IdArticulo

 --sql pivot(
 select * from v_categoria_articulo_detalle 
 pivot (sum(subtotal) for categoria  in ([Componentes],[Mainboards],[Multimedias])
 ) as p
















use northwind
select * from Transportistas
select * from Pedidos
select * from Estado_de_pedidos

create view v_compania_pedidoss
as
select  t.Compañía as compania,count(p.[Id de pedido]) as cantidad,e.[Nombre del estado]
from Transportistas t
join Pedidos p on t.Id = p.[Id de transportista]
join Estado_de_pedidos e
on e.[Id de situación]=p.[Id de situación]
group by t.Compañía,e.[Nombre del estado]

select * from v_compania_pedidoss
pivot(sum(cantidad) for [Nombre del estado] in([Cerrado],[Enviado],[Nuevo]
)
)p

--
 create view clientes_anio_factura
 as
 select c.nomcliente,YEAR(f.fecha) as anio,
 (d.PreVenta * d.Cantidad) as subtotal from Clientes c
 join Facturas f on c.Idcliente = f.IdCliente join Detalles d
 on f.IdFactura = d.IdFactura
 group by c.NomCliente,f.Fecha,(d.PreVenta * d.Cantidad)

 select * from clientes_anio_factura
 pivot(sum(subtotal)for nomcliente in(
 [Alejandro valderrama] ,[Marcos Valer]
 )
  )p
  go










    ----------------------------------------------------------------------------------------
	create view articulos_anio_facturas
	as
	select a.NomArticulo,YEAR(f.fecha) as anio,(d.preventa * d.cantidad)*0.18 as igv
	 from Articulos a join detalles d on a.IdArticulo = d.IdArticulo
	join Facturas f on d.IdFactura = f.IdFactura
	group by a.NomArticulo,f.Fecha,(d.preventa * d.cantidad)*0.18
	--------------------------------------------------------
	select * from articulos_anio_facturas
 pivot(sum(igv)for NomArticulo in(
	[Teclado Acer],[Teclado BTC]
	)
	)p
	go



  --------------------------------------------------------------------------------------
  use Northwind
  go
  --CANTIDAD
  CREATE view v_pedidos_estado_transportista
  as
  select t.compañía,e.[Nombre del estado],
  count(p.[Id de pedido])  AS cantidad_pedido from 
  Estado_de_pedidos e join Pedidos p
  on e.[Id de situación] = p.[Id de situación]
  join Transportistas t on p.[Id de transportista] = t.Id
  group by t.compañía,e.[Nombre del estado]
  ----------- PIVOT
  select * from v_pedidos_estado_transportista
  pivot(sum(cantidad_pedido) for [Nombre del estado] in ([Cerrado],Enviado,Nuevo))
   p
   GO
   --------------------------------------------
   CREATE VIEW V_PRODUCTO_PEDIDO_CANTIDAD_MES
   AS
   SELECT P.[Nombre del producto],MONTH(PE.[Fecha de pedido]) AS MES_PEDIDO,
   sum(d.cantidad) AS CANTIDAD
   FROM Productos P
   JOIN Detalles_de_pedido D ON P.Id = D.[Id de producto]
   JOIN Pedidos PE ON D.[Id de pedido]=PE.[Id de pedido]
   GROUP BY P.[Nombre del producto],PE.[Fecha de pedido]
   
   -----------------------------------------------------------------------------------------
   SELECT * FROM V_PRODUCTO_PEDIDO_CANTIDAD_MES
   PIVOT(SUM(CANTIDAD) FOR MES_PEDIDO IN([3]))
   P


   create  view  v_pedido_demora_dias
as
(
select CONCAT(e.nombre,' ',e.Apellidos) as nombres,DATEDIFF(dd,[fecha de envío],
[Fecha de creación]) as dias_demora,
d.[Costo unitario] * d.Cantidad as subtotal 
from Pedidos_de_compra p
 join Detalles_de_pedidos_de_compra d
 on p.[Id de pedido de compra] = d.[Id de pedido de compra]
 join Empleados e on p.[Creado por] =e.Id)

 --
select * from v_pedido_demora_dias
pivot (sum(subtotal) for [dias_demora]
in ([0],[8])) as
p
 ------------------------------------------------------------------------------------------







