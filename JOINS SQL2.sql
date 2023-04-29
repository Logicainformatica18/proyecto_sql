USE PCVENTAS
-- INNER JOIN
-- OBTENER REGISTROS RELACIONADOS
-- DE AMBAS TABLAS
SELECT A.NomArticulo,C.NOMBRE 
FROM Categorias C
INNER JOIN Articulos A 
ON  A.Categ = C.Categoria
-- left join
-- trae registro relacionados
--y no relacionados de la tabla A
SELECT A.NomArticulo,C.NOMBRE 
FROM Categorias C
LEFT JOIN Articulos A 
ON  A.Categ = C.Categoria
-- RIGHT join
-- trae registro relacionados
--y no relacionados de la tabla B
SELECT A.NomArticulo,C.NOMBRE 
FROM Categorias C
RIGHT JOIN Articulos A 
ON  A.Categ = C.Categoria
--DEVUELVE REGISTROS RELACIONADOS Y NO RELACIONADOS
SELECT A.NomArticulo,C.NOMBRE 
FROM Categorias C
FULL OUTER JOIN Articulos A 
ON  A.Categ = C.Categoria

--LEFT EXCLUIDING JOIN
SELECT A.NomArticulo,C.NOMBRE 
FROM Categorias C
 LEFT JOIN Articulos A 
ON  A.Categ = C.Categoria
WHERE A.IdArticulo IS NULL
--RIGHT EXCLUIDING JOIN
SELECT A.NomArticulo,C.NOMBRE 
FROM Categorias C
 RIGHT JOIN Articulos A 
ON  A.Categ = C.Categoria
WHERE C.Categoria IS NULL
-- FULL OUTER EXCLUDING JOIN
-- DEVUELVE REGISTRO NO RELACIONADOS DE AMBAS TABLAS
SELECT A.NomArticulo,C.NOMBRE 
FROM Categorias C
FULL OUTER JOIN Articulos A 
ON  A.Categ = C.Categoria
WHERE A.IdArticulo IS NULL OR C.Categoria IS NULL