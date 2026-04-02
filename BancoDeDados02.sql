-- Cria o banco
CREATE DATABASE campeonato;

-- Utilizando o banco
USE campeonato;

-- Cria a tabela equipe
CREATE TABLE equipe (
   cod_equipe INT PRIMARY KEY AUTO_INCREMENT,
   nome_equipe VARCHAR(47) NOT NULL,
   sigla_equipe CHAR(3) UNIQUE,
   estado CHAR(2)
);

-- Cria a tabela de jogador
CREATE TABLE jogador(
    cod_jogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nacionalidade VARCHAR(50),
    altura DECIMAL(3,2),
    peso DECIMAL(6,3),
    idade INT,
    numero_camisa int,
    posicao ENUM("GOLEIRO","ZAGUEIRO","MEIO-CAMPO","ATACANTE"),
    id_equipe INT,
    FOREIGN KEY (id_equipe) REFERENCES equipe(cod_equipe)
);

-- CRUD no banco
-- C = CREATE
-- Forma 1: com colunas
INSERT INTO equipe (nome_equipe, sigla_equipe, estado)
    VALUES ("Gama","GAM","DF");

-- Forma 2: Sem Colunas
INSERT INTO equipe
VALUES (DEFAULT, "Vasco da Gama","VAS","RJ");

INSERT INTO equipe (nome_equipe, sigla_equipe, estado)
    VALUES ("Fluminense","FFC","RJ");
    
INSERT INTO equipe (nome_equipe, sigla_equipe, estado)
    VALUES ("Bota Fogo","BRF","RJ");
    
INSERT INTO equipe (nome_equipe, sigla_equipe, estado)
    VALUES ("Atlético Mineiro","CAM","MG");

-- Inserindo várias equipes
INSERT INTO equipe
VALUES (DEFAULT, "Grêmio","GRE","RS");

-- Inserindo várias equipes
INSERT INTO equipe (nome_equipe, sigla_equipe, estado)
VALUES ("São Paulo","SPA","SP"),
       ("Real Madrid","RMD","PA"),
	   ("Manchaster","MUN","AC");

-- R = READ
SELECT * FROM equipe;

-- U: UPDATE
UPDATE equipe
SET estado = "MD"
WHERE nome_equipe = "Real Madrid";

-- D: DELETE
DELETE FROM equipe
WHERE cod_equipe = 6;

-- Inserir jogadores
INSERT INTO jogador (nome, peso, numero_camisa, posicao, id_equipe)
	VALUES("Vinicius Jr", 73.0, 7,"Atacante", 4),
		  ("Neymar", 100.0, 10,"Atacante", 4),
          ("Dinamite", 70.0, 2,"MEIO-CAMPO", 2);
    
SELECT * FROM jogador;

    