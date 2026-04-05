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
   periodo_curso ENUM("Matutino","Vespertino","Noturno"),
   duracao_curso INT,
   valor_curso DECIMAL(10,2)
);

CREATE TABLE matricula (
   cod_materia INT PRIMARY KEY AUTO_INCREMENT,
   data_materia DATE,
   id_aluno INT,
   id_curso INT,
   FOREIGN KEY (id_aluno) REFERENCES aluno(ra_aluno),
   FOREIGN KEY (id_curso) REFERENCES curso(cod_curso)
   );
   

INSERT INTO aluno (nome_aluno, data_nascimento, CPF_aluno, sexo_aluno)
VALUES ("Felipa","2003-10-10","12309845690","FEMININO"),
       ("Gregorio","1900-12-10","12309845656","MASCULINO"),
       ("Rute","2014-01-01","12306845676","FEMININO"),
       ("Fabiula","2005-05-04","12309856756","FEMININO"),
       ("Jivia","2000-06-10","95309845656","FEMININO"),
       ("Diunson","2019-03-18","12569845656","MASCULINO"),
       ("Hugo","2013-02-11","78609845656","FEMININO"),
       ("Rutineia","2017-12-10","23409845656","FEMININO"),
       ("Fabio","2019-11-10","34309845656","MASCULINO"),
       ("Rofrigo","2003-04-10","21309845656","MASCULINO");
       
SELECT * FROM aluno;
   

INSERT INTO curso (nome_curso, periodo_curso, duracao_curso, valor_curso)
VALUES ("Desenvovimento de Sistemas","Matutino","4",6000.00),
       ("Eletroeletrônica","Vespertino","3",1500.00),
       ("Mecânica","Noturno","2","4000.00"),
       ("Soldagem","Vespertino","3",1200.00),
       ("Costura","Noturno","1",1600.00);
   
SELECT * FROM curso;


INSERT INTO matricula (data_materia, id_aluno, id_curso)
VALUES ("2026-02-13",1,1),
       ("2026-02-13",4,4),
       ("2026-07-23",10,4),
       ("2027-02-12",9,5),
       ("2027-02-12",2,3),
       ("2027-02-12",3,2),
       ("2026-02-13",4,5),
       ("2026-07-23",6,1),
       ("2027-08-10",5,2),
       ("2027-08-10",7,2),
       ("2026-07-23",8,3),
       ("2026-02-13",1,4),
       ("2027-02-12",6,2),
       ("2027-08-10",9,5),
       ("2027-02-12",8,3),
       ("2026-02-13",10,3),
       ("2026-07-23",4,4),
       ("2026-02-13",7,2),
       ("2026-02-13",5,1),
       ("2026-07-23",8,1);
   
SELECT * FROM matricula;
