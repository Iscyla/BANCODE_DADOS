-- Cria o banco
CREATE DATABASE escola;

DROP DATABASE escola;
 
USE escola;

CREATE TABLE aluno (
   ra_aluno INT PRIMARY KEY AUTO_INCREMENT,
   nome_aluno VARCHAR(47) NOT NULL,
   data_nascimento DATE,
   CPF_aluno CHAR(11),
   sexo_aluno ENUM("FEMININO","MASCULINO","PREFIRO NÃO INFORMAR")
);

CREATE TABLE curso (
   cod_curso INT PRIMARY KEY AUTO_INCREMENT,
   nome_curso VARCHAR(47) NOT NULL,
   periodo_curso ENUM("Matutino","Vespertino","Nortuno"),
   duracao_curso INT,
   valor_curos float
);

CREATE TABLE matricula (
   cod_materia INT PRIMARY KEY AUTO_INCREMENT,
   data_materia DATE,
   id_aluno INT,
   id_curso INT,
   FOREIGN KEY (id_aluno) REFERENCES aluno(ra_aluno),
   FOREIGN KEY (id_curso) REFERENCES aluno(cod_curso)
   );
   
   
   
   
   