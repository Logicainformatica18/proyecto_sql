use pcventas;
select * from Categorias
select * from Articulos

-- inner join 
select * from Articulos a  inner join   Categoria c
on a.Categ = c.Categoria 
-- right join (full)
select * from Articulos a  right join   Categorias c
on a.Categ = c.Categoria 
--leff join (full)
select * from Articulos a  left join   Categorias c
on a.Categ = c.Categoria 
-- right join 
select c.* from Articulos a  right join   Categorias c
on a.Categ = c.Categoria where a.Categ is null
--leff join
select a.* from Articulos a  left join   Categorias c
on a.Categ = c.Categoria where a.Categ is null
-- full outer join
select * from Articulos a  full outer  join   Categorias c
on a.Categ = c.Categoria 
-- full outer join (no relacionados)
select * from Articulos a  full outer  join   Categorias c
on a.Categ = c.Categoria  where a.Categ is null or c.Categoria is null

