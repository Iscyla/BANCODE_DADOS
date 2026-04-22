CREATE DATABASE escola;

USE escola;

CREATE TABLE campus(
codigo_campus INT PRIMARY KEY AUTO_INCREMENT,
cidade VARCHAR(220),
endereco  VARCHAR(220)
);

CREATE TABLE cursos(
codigo_curso INT PRIMARY KEY AUTO_INCREMENT,
nome_curso VARCHAR(220),
turno VARCHAR(220),
duracao INT,
valor DECIMAL(10,2),
id_campus INT,
FOREIGN KEY (id_campus) REFERENCES campus(codigo_campus)
);

CREATE TABLE aluno(
codigo_academico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60),
data_nascimento DATE,
CPF CHAR(11),
sexo ENUM("M", "F")
);

CREATE TABLE matricula(
codigo_de_matricula INT PRIMARY KEY AUTO_INCREMENT,
data_de_matricula DATE,
registro_academico INT,
id_curso INT,
FOREIGN KEY (registro_academico)REFERENCES aluno(codigo_academico),
FOREIGN KEY (id_curso) REFERENCES cursos(codigo_curso)
);

-- 1 Lista de todos os cursos do campus de Vitória
SELECT *
FROM campus, cursos
WHERE cidade = 'Vitória';

-- 2 Lista de todos os cursos em ordem Alfabética
SELECT nome_curso
FROM cursos
ORDER BY nome_curso ASC;

-- 3 Quais os 5 cursos mais caros?
SELECT *
FROM cursos
ORDER BY valor DESC
LIMIT 5;

-- 4 Qual curso é o mais barato no Campus da Serra?
SELECT *
FROM campus, cursos
WHERE cidade = 'Serra'
ORDER BY valor ASC
LIMIT 1;

-- 5 Qual o turno com mais cursos disponíveis?
SELECT turno, COUNT(*) AS total_cursos
FROM cursos
GROUP BY turno
ORDER BY total_cursos DESC
LIMIT 1;

-- 6 Quantos cursos duram mais de dois anos e meio?
SELECT COUNT(*) AS total_duracao
FROM cursos
WHERE duracao > 2.5;

-- 7 Quais os cursos com maior quantidade de alunos inscritos?
SELECT A.nome_curso, COUNT(L.registro_academico) AS total_alunos
FROM cursos AS A
JOIN matricula AS L
ON A.codigo_curso = L.id_curso
GROUP BY A.nome_curso
ORDER BY total_alunos DESC;

-- 8 Qual a média de preço dos cursos listados?
SELECT AVG(valor) AS media_preco
FROM cursos;

-- 9 Quais cursos duram mais tempo
SELECT nome_curso, duracao
FROM cursos
ORDER BY duracao DESC;

-- 10 Quantos alunos estão matriculados em cada turno?
SELECT A.turno, COUNT(L.registro_academico) AS total_alunos
FROM cursos AS A
JOIN matricula AS L
ON A.codigo_curso = L.id_curso
GROUP BY A.turno;

-- 11 Qual o campus com mais cursos?
SELECT *
FROM campus, cursos
ORDER BY codigo_curso DESC
LIMIT 3;

-- 12 Quais cursos não possuem alunos cadastrados?
SELECT *
FROM cursos AS A
LEFT JOIN matricula AS L ON A.codigo_curso = L.id_curso
WHERE L.id_curso IS NULL;

-- 13 Quem se matriculou em 2021?
SELECT *
FROM matricula, aluno
WHERE data_de_matricula  LIKE '2021%';

-- 14 Qual a data de matrícula da aluna “Fernanda Lima”?
SELECT *
FROM matricula, aluno
WHERE nome = 'Fernada Lima';

-- 15 Quais alunos não se cadastraram em nenhum curso?
SELECT *
FROM aluno AS A
LEFT JOIN matricula AS L ON A.codigo_academico = L.id_curso
WHERE L.id_curso IS NULL;

-- 16 Quantas alunas matriculadas até o momento?
SELECT COUNT(*) AS total_sexo
FROM matricula, aluno
WHERE sexo = 'F';

-- 17 Quais alunos estão matriculados 3 cursos?
SELECT DISTINCT nome AS aluno, registro_academico
FROM matricula, aluno
WHERE registro_academico = 3;

-- 18 Qual o curso do aluno “Guilherme Costa”?
SELECT nome_curso, nome
FROM cursos, aluno
GROUP BY nome = 'Guilherme Costa';

-- 19 Quais os alunos matriculados em “Ciência da computação”
SELECT *
FROM cursos, aluno, matricula
WHERE nome_curso = 'Ciência da computação';

-- 20 Relação completa de todos os alunos e seus cursos
SELECT *
FROM aluno, campus, cursos, matricula;




