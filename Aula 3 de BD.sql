/*
Recapitulando:
COMANDOS DML (Manipulando os dados):
UPDATE: atualiza os registros
DELETE: apaga os registros
IFNULL(): selecionar o vazio


COMANDOS DDL (Alterando a estrutura):
ALTER TABLE: alterar a tabela
MODIFY COLUMN: modificar uma coluna
ADD COLUMN: adicionar uma coluna
DROP COLUMN: apagar uma coluna
RENAME COLUMN: renomear uma coluna
DROP: remove a tabela
TRUNCATE: apagar tudo
*/


CREATE DATABASE ccokaula3;

CREATE TABLE ccokaula3.usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
dt_nasc DATE NULL,
plano VARCHAR(40) DEFAULT 'Mensal',
nivel INT,
peso DECIMAL(5, 2),
nome VARCHAR(200) NOT NULL,
cpf CHAR(11) UNIQUE NOT NULL,
CONSTRAINT chkPlano CHECK(plano IN('Mensal','Semanal','Avulso')),
CONSTRAINT chkPlano2 CHECK(nivel >=1 AND nivel <=5)

);

INSERT INTO ccokaula3.usuario (nome, cpf) VALUES
('Clara','12345678901');

UPDATE ccokaula3.usuario SET nivel=2
WHERE id=1;

 USE ccokaula3; 

INSERT INTO usuario (cpf, nome, nivel, dt_nasc, plano, peso) VALUES
('10987654321', 'Guilherme', 5, '2003-05-16', 'Avulso', 75.90);

SELECT * FROM usuario;

ALTER TABLE usuario
ADD COLUMN dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE usuario 
ADD COLUMN genero VARCHAR (30),
DROP COLUMN XP;

-- ALIAS: é apelido
-- A sintaxe para usar o conceito de ALIAS é AS
SELECT nome, dt_nasc AS 'Data de Nascimento' FROM usuario;
 
 SELECT nome,
 CASE 
 WHEN nivel=1 THEN 'Nível Baixo'
 WHEN nivel=2 THEN 'Nível Médio'
 WHEN nivel=3 THEN 'Nível Alto'
 WHEN nivel=4 THEN 'Nível Muito Alto'
 ELSE 'Nível Máximo'
 END AS 'Nível',
 dt_nasc
 FROM usuario;
 
 SELECT
 concat('Olá, ', nome, '!', 'Data de Nascimento: ',
 IFNULL(dt_nasc, 'Sem registro'))
 AS frase FROM usuario;
 
 SELECT 
 nome AS 'NOME' 
 CASE
 WHEN nivel BETWEEN 1 AND 3 THEN 'Baixo'
 ELSE 'Alto'
 END AS 'NÍVEL' 
 FROM usuario;
 
 INSERT INTO usuario (nome, cpf, dt_cadastro) VALUES ('Nicolas','21212121212',NOW());
 
 SELECT * FROM usuario;
 
 CREATE TABLE empresa (
 id_empresa INT PRIMARY KEY AUTO_INCREMENT,
 nome_empresa VARCHAR(100),
 cnpj CHAR(14) NOT NULL
 )AUTO_INCREMENT=500
 ;
 INSERT INTO empresa (cnpj) VALUES
 ('121212121212'); 
 DROP TABLE usuario;
 
 -- ctrl c/v dessa aula
 CREATE DATABASE ccokaula3;

CREATE TABLE ccokaula3.usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
dt_nasc DATE NULL,
plano VARCHAR(40) DEFAULT 'Mensal',
nivel INT,
peso DECIMAL(5, 2),
nome VARCHAR(200) NOT NULL,
cpf CHAR(11) UNIQUE NOT NULL,
CONSTRAINT chkPlano CHECK(plano IN('Mensal', 'Semanal',
'Avulso')),
CONSTRAINT chkNivel CHECK(nivel >=1 AND nivel <=5)
);

INSERT INTO ccokaula3.usuario (nome, cpf) VALUES
('Clara', '12345678901');

UPDATE ccokaula3.usuario SET nivel=2
WHERE id=1;

USE ccokaula3;

INSERT INTO usuario (cpf, nome, nivel, dt_nasc, 
plano, peso) VALUES
('10987654321', 'Guilherme', 5, '2003-05-16',
'Avulso', 75.90);

SELECT * FROM usuario;

ALTER TABLE usuario 
ADD COLUMN dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP;

SELECT * FROM usuario;

ALTER TABLE usuario
	ADD COLUMN cor_favorita VARCHAR(30),
    ADD COLUMN  XP INT;
    
ALTER TABLE usuario
	ADD COLUMN genero VARCHAR(30),
    DROP COLUMN  XP;
    
-- ALIAS: é um apelido
-- A sintaxe para usar o conceito de ALIAS é AS
SELECT 
	nome AS 'Nome',
	dt_nasc AS 'Data de Nascimento'
    FROM usuario;

SELECT
	nome,
    CASE 
    WHEN nivel=1 THEN 'Nível Baixo'
    WHEN nivel=2 THEN 'Nível Médio'
    WHEN nivel=3 THEN 'Nível Alto'
    WHEN nivel=4 THEN 'Nível Muito Alto'
    ELSE 'Nível Máximo'
    END AS 'Nível',
    dt_nasc
    FROM usuario;
    
    SELECT
    CONCAT('Olá, ', nome, '!', 
    ' Data de Nascimento: ', IFNULL(dt_nasc, 'Sem registro'))
    AS frase
    FROM usuario;
    
SELECT
	nome AS 'NOME',
    CASE
    WHEN nivel BETWEEN 1 AND 3 THEN 'Baixo'
    ELSE 'Alto'
    END AS 'NIVEL'
    FROM usuario;

INSERT INTO usuario (nome, cpf, dt_cadastro) VALUES
('Nicolas', '21212121212', NOW());

SELECT * FROM usuario;

CREATE TABLE empresa (
id_empresa INT PRIMARY KEY AUTO_INCREMENT,
nome_empresa VARCHAR(100),
cnpj CHAR(14) NOT NULL
)AUTO_INCREMENT=500
;

INSERT INTO empresa (cnpj) VALUES
('12121212121212');

SELECT * FROM empresa;