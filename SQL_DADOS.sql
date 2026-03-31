-- CREATE DATABASE: Cria um banco
CREATE DATABASE Bercario;

-- DROP DATABASE: Deleta um banco
DROP DATABASE Bercario;

-- USE: Utiliza um banco para realizar as operações
USE Bercario;

-- CREATE TABLE: Cria uma tabela no banco
-- PRIMARY KET: Diz que aquele atributo é chave primária
-- AUTO_INCREMENT: Diz que aquele atributo aumenta o número automaticamente
-- NOT NULL: Diz que aquele atributo deve ser preechido, não pode estar vazio
-- UNIQUE: Diz que só pode ter um daquele registro na tabela
CREATE TABLE tb_mae(
     cod_mae INT PRIMARY KEY AUTO_INCREMENT,
     nome_mae VARCHAR(255) NOT NULL,
     telefone_mae VARCHAR(20),
     email_mae VARCHAR(20) UNIQUE
     );

CREATE TABLE tb_medico(
     cod_medico INT PRIMARY KEY AUTO_INCREMENT,
     nome_medico VARCHAR(70) NOT NULL,
     CRM VARCHAR(20) DEFAULT '123456-ES'
	 );

-- ALTER: Altera algo existente no banco
-- ADD: Adiciona colunas a uma tabela existente
ALTER TABLE tb_medico
ADD especilidade ENUM("GERAL","PEDIATRA","OBSTRETA");

-- DROP COLUMN - Deleta uma coluna de uma tabela existente
ALTER TABLE tb_medico
DROP COLUMN especialidade;

-- MODIFY: Modifica uma coluna de uma tabela existente
ALTER TABLE tb_medico
MODIFY especialidade VARCHAR(255);

-- DROP TABLE: Deleta uma tabela
DROP TABLE tb_medico;

-- Cria a tabela bebe
CREATE TABLE tb_bebe(
     cod_bebe INT PRIMARY KEY AUTO_INCREMENT,
     nome_bebe VARCHAR(255),
     dt_nascimento DATE,
     hr_nascimento TIME,
     peso DECIMAL(6, 4),
     id_mae INT,
     id_medico INT,
     FOREIGN KEY (id_mae) REFERENCES tb_mae(cod_mae),
     FOREIGN KEY (id_medico) REFERENCES tb_medico(cod_medico)
);




