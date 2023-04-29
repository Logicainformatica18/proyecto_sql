select f.IdFactura,c.NomCliente
from  facturas f
inner join clientes c
on f.IdCliente = c.Idcliente
--consulta de tres tablas
select f.IdFactura,c.NomCliente,d.Cantidad
from  facturas f
inner join clientes c
on f.IdCliente = c.Idcliente inner join 
detalles d
on f.IdFactura = d.IdFactura 
--
select 
C.nombre, 
sum(D.cantidad) as Cantidad
from Categorias C
inner join Articulos A
on A.Categ = C.Categoria
inner join Detalles D
on A.IdArticulo = D.IdArticulo
where C.Nombre = 'Multimedias'
group by C.Nombre
--
select 
C.nombre, 
sum(D.cantidad) as Cantidad
from Categorias C
inner join Articulos A
on A.Categ = C.Categoria
inner join Detalles D
on A.IdArticulo = D.IdArticulo
group by C.Nombre
having c.nombre= 'Multimedias'

--left join
select a.NomArticulo,c.nombre from Articulos a 
left join 
Categorias c
on a.Categ = c.Categoria

--right join
select a.NomArticulo,c.nombre from Articulos a 
right join 
Categorias c
on a.Categ = c.Categoria
--excluding join 
--left excluding join
select a.NomArticulo,c.nombre from Articulos a 
left join 
Categorias c
on a.Categ = c.Categoria
where c.Categoria is null
--right excluding join
select a.NomArticulo,c.nombre from Articulos a 
right join 
Categorias c
on a.Categ = c.Categoria
where a.IdArticulo is null
---- full outer join
select a.NomArticulo,c.nombre from Articulos a 
full outer join
Categorias c
on a.Categ = c.Categoria 
---- full excluding outer join
select a.NomArticulo,c.nombre from Articulos a 
full outer join
Categorias c
on a.Categ = c.Categoria
where a.IdArticulo is null 
or c.Categoria is null

-- uso del and (consultas de intervalo)
select * from Detalles
where  cantidad > 10  and cantidad < 20
--
select * from Articulos 
where Categ = 3 
select * from Articulos 
where Categ = 3 and stock > 50
-- uso del or
select * from Articulos 
where Categ = 3 or categ =1

