
-- INNER JOIN
SELECT *
FROM autores AS A
JOIN livros AS L
ON A.autor_id = L.autor_id ;

-- INNER JOIN com filtro de colunas
SELECT L.titulo, A.name
FROM autores AS A
JOIN livros AS L
ON A.autor_id = L.autor_id ;

-- LEFT JOIN
SELECT L.titulo, A.name AS autor
FROM autores AS A
LEFT JOIN livros AS L
ON A.autor_id = L.autor_id ;

-- RIGHT JOIN
SELECT L.titulo, A.name AS autor
FROM autores AS A
RIGHT JOIN livros AS L
ON A.autor_id = L.autor_id ;

-- LEFT EXCLUDING JOIN
-- MOSTRA SÓ O QUE ESTA NA TABELA LEFT
-- NESSE CASO, MOSTRA SÓ OS AUTORES QUE NÃO TEM LIVRO ASSOCIADO
SELECT L.titulo, A.name AS autor
FROM autores AS A
LEFT JOIN livros AS L
ON A.autor_id = L.autor_id
WHERE L.livro_id IS NULL;

-- RIGHT EXCLUDING JOIN
-- MOSTRA SÓ O QUE ESTA NA TABELA RIGHT
-- NESSE CASO, MOSTRA SÓ OS AUTORES QUE NÃO TEM AUTOR ASSOCIADO
SELECT L.titulo, A.name AS autor
FROM autores AS A
RIGHT JOIN livros AS L
ON A.autor_id = L.autor_id
WHERE L.autor_id IS NULL;

-- OUTER JOIN
-- JUNÇÃO DE DOIS OU MAIS JOINS

-- FAÇO O RIGHT JOIN
SELECT L.titulo, A.name AS autor
FROM autores AS A
LEFT JOIN livros AS L
ON A.autor_id = L.autor_id 

-- OPERADORA DE UNIÃO
UNION

-- FAÇO O LEFT JOIN
SELECT L.titulo, A.name AS autor
FROM autores AS A
RIGHT JOIN livros AS L
ON A.autor_id = L.autor_id ;

-- OUTER EXCLUDING JOIN
-- FAZ O LEFT JOIN COM EXCLUSÃO
SELECT L.titulo, A.name AS autor
FROM autores AS A
LEFT JOIN livros AS L
ON A.autor_id IS NULL

-- OPERADORA DE JUNÇÃO
UNION

-- FAZ O RIGHT JOIN COM EXCLUSÃO
SELECT L.titulo, A.name AS autor
FROM autores AS A
RIGHT JOIN livros AS L
ON A.autor_id IS NULL;

-- O MELHOR JOIN
-- JOIN COM TRES TABELAS
-- SELECIONO A PRIMEIRA TABELA
SELECT titulo, G.name AS genero, A.name AS autor
FROM livros AS L
-- FAÇO A JUNÇÃO COM A PRIMEIRA E RELACIONO AS CHAVES
JOIN autores AS A 
ON A.autor_id = L.autor_id
-- FAÇO A JUNÇÃO COM A SEGUNDA E RELACIONO AS CHAVES
JOIN generos AS G
ON g.genero_id = L.genero_id;
