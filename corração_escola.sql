CREATE DATABASE escolacorreção;

USE escolacorreção;

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
sexo ENUM("M", "F", "C")
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

-- 1 CORRIGIDA
SELECT * 
FROM campus AS cam
JOIN cursos AS cur
ON cam.codigo_campus = cur.id_campus
WHERE cam.cidade = 'Vitória';


-- 2 Lista de todos os cursos em ordem Alfabética
SELECT nome_curso
FROM cursos
ORDER BY nome_curso ASC; -- Esta correta!


-- 3 Quais os 5 cursos mais caros?
SELECT *
FROM cursos
ORDER BY valor DESC
LIMIT 5;
 
 -- 3 CORRIGIDA
SELECT nome_curso
FROM cursos
ORDER BY valor DESC
LIMIT 5;  -- Esta correta, apenas muda a forma de fazer!


-- 4 Qual curso é o mais barato no Campus da Serra?
SELECT *
FROM campus, cursos
WHERE cidade = 'Serra'
ORDER BY valor ASC
LIMIT 1;

-- 4 CORRIGIDA
SELECT * 
FROM campus AS cam
JOIN cursos AS cur
ON cam.codigo_campus = cur.id_campus
WHERE cam.cidade = 'Serra'
ORDER BY valor
LIMIT 1;


-- 5 Qual o turno com mais cursos disponíveis?
SELECT turno, COUNT(*) AS total_cursos
FROM cursos
GROUP BY turno
ORDER BY total_cursos DESC
LIMIT 2;

-- 5 CORRIGIDA
SELECT turno, COUNT(turno) AS contagem
FROM cursos
GROUP BY turno
ORDER BY contagem DESC
LIMIT 2; -- Esta correta, apenas muda a forma de fazer!


-- 6 Quantos cursos duram mais de dois anos e meio?
SELECT COUNT(*) AS total_duracao
FROM cursos
WHERE duracao > 5;

-- 6 CORRIGIDA
SELECT COUNT(duracao) AS contagem
FROM cursos
WHERE duracao > 5; -- Esta correta, apenas muda a forma de fazer!


-- 7 Quais os cursos com maior quantidade de alunos inscritos?
SELECT A.nome_curso, COUNT(L.registro_academico) AS total_alunos
FROM cursos AS A
JOIN matricula AS L
ON A.codigo_curso = L.id_curso
GROUP BY A.nome_curso
ORDER BY total_alunos DESC;

-- 7 CORRIGIDA
SELECT cur.nome_curso, COUNT(cur.nome_curso) AS contagem
FROM cursos AS cur
JOIN matricula AS mat
ON cur.codigo_curso = mat.id_curso
GROUP BY cur.nome_curso
HAVING contagem = 8
ORDER BY contagem DESC;


-- 8 Qual a média de preço dos cursos listados?
SELECT AVG(valor) AS media_preco
FROM cursos; -- Esta correta!


-- 9 Quais cursos duram mais tempo
SELECT nome_curso, duracao
FROM cursos
ORDER BY duracao DESC;

-- 9 CORRIGIDA (subquerie)
SELECT nome_curso, duracao
FROM cursos
WHERE duracao = (SELECT max(duracao) FROM cursos);


-- 10 Quantos alunos estão matriculados em cada turno?
SELECT A.turno, COUNT(L.registro_academico) AS total_alunos
FROM cursos AS A
JOIN matricula AS L
ON A.codigo_curso = L.id_curso
GROUP BY A.turno;

-- 10 CORRIGIDA
SELECT cur.turno, COUNT(cur.turno) AS total
FROM cursos AS cur
JOIN matricula AS mat
ON mat.id_curso = cur.codigo_curso
GROUP BY cur.turno; -- Esta correta, apenas muda a forma de fazer!



-- 11 Qual o campus com mais cursos?
SELECT *
FROM campus, cursos
ORDER BY codigo_curso DESC
LIMIT 3;

-- 11 CORRIGIDA 
SELECT cidade, COUNT(cidade) AS total
FROM campus AS cam
JOIN cursos AS cur
ON cam.codigo_campus = cur.id_campus
GROUP BY cidade
ORDER BY total DESC
LIMIT 1;



-- 12 Quais cursos não possuem alunos cadastrados?
SELECT *
FROM cursos AS A
LEFT JOIN matricula AS L 
ON A.codigo_curso = L.id_curso
WHERE L.id_curso IS NULL;

-- 12 CORRIGIDA
SELECT *
FROM cursos AS cur
LEFT JOIN matricula AS mat
ON mat.id_curso = cur.codigo_curso
WHERE mat.id_curso IS NULL; -- Esta correta, apenas muda a forma de fazer!


-- 13 Quem se matriculou em 2021?
SELECT *
FROM matricula, aluno
WHERE data_de_matricula  LIKE '2021%'; -- Esta correta!


-- 14 Qual a data de matrícula da aluna “Fernanda Lima”?
SELECT *
FROM matricula, aluno
WHERE nome = 'Fernanda Lima';

-- 14 CORRIGIDA ATUALIZADA 2026
SELECT nome, data_nascimento
FROM aluno AS alu
JOIN matricula AS mat
ON alu.codigo_academico = mat.registro_academico
WHERE alu.nome = "Fernanda Lima";


-- 15 Quais alunos não se cadastraram em nenhum curso?
SELECT *
FROM aluno AS A
LEFT JOIN matricula AS L ON A.codigo_academico = L.id_curso
WHERE L.id_curso IS NULL;

-- 15 CORRIGIDA
SELECT nome, codigo_de_matricula
FROM aluno AS alu
LEFT JOIN matricula AS mat
ON alu.codigo_academico = mat.registro_academico
WHERE mat.codigo_de_matricula IS NULL;


-- 16 Quantas alunas matriculadas até o momento?
SELECT COUNT(*) AS total_sexo
FROM matricula, aluno
WHERE sexo = 'F';

-- 16 CORRIGIDA
SELECT COUNT(DISTINCT(nome)) AS contagem
FROM aluno AS alu
LEFT JOIN matricula AS mat
ON alu.codigo_academico = mat.registro_academico
WHERE alu.sexo = "F"; 


-- 17 Quais alunos estão matriculados 3 cursos?
SELECT DISTINCT nome AS aluno, registro_academico
FROM matricula, aluno
WHERE registro_academico = 3;

-- 17 CORRIGIDA
SELECT nome, COUNT(mat.registro_academico) AS vezes
FROM aluno AS alu
JOIN matricula AS mat
ON alu.codigo_academico = mat.registro_academico
GROUP BY alu.nome
HAVING vezes = 3;


-- 18 Qual o curso do aluno “Guilherme Costa”?
SELECT nome_curso, nome
FROM cursos, aluno
GROUP BY nome = 'Guilherme Costa';

-- 18 CORRIGIDA
SELECT *
FROM vw_alunosEcursos
WHERE alunos = "Guilherme Costa";



-- 19 Quais os alunos matriculados em “Ciência da computação”
SELECT *
FROM cursos, aluno, matricula
WHERE nome_curso = 'Ciência da computação';

-- 19 CORRIGIDA 
SELECT *
FROM vw_alunosEcursos
WHERE curso = "Ciência da computação";


-- 20 Relação completa de todos os alunos e seus cursos
SELECT *
FROM aluno, campus, cursos, matricula;

-- 20 CORRIGIDA
CREATE VIEW vw_alunosEcursos AS 
SELECT alu.nome AS alunos, cur.nome_curso AS curso
FROM matricula AS mat
JOIN aluno AS alu
     ON alu.codigo_academico = mat.registro_academico
JOIN cursos AS cur 
     ON cur.codigo_curso = mat.id_curso;





