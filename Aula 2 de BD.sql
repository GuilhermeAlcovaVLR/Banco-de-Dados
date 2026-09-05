/*
Números Decimais
FLOAT - Usa até 7 digito
DOUBLE - Usa até 15 digitos
Decimal - Controlo a quantidade de casas antes e após a vírgula
*/

/*
Outros tipos de campos:
Numéricp: TINYINT - vai de - 128 até 127
Data: 
 - YYYY-MM-dd
Data e hora: DATATIME - YYYY-MM-dd HH:mm:ss
*/

--  AUTO_INCREMENT: incrementa automaticamente o me campo
-- Snake case: padrão de nomenclatura onde as palavras são separadas por underline(_)
-- Camel case: padrão de nomenclatura onde as palavras são separadas por letra maiúscula (inicia commit letra maiúscula)
USE sprint1;

CREATE TABLE pessoa(
id_pessoa INT PRIMARY KEY auto_increment,
nome VARCHAR(80)
dt_nascimento DATE 
);
-- Ano SEMPRE em frente para organização
INSERT INTO pessoa (nome, dt_nascimento) VALUES
("Clara", "1980-06-19");

INSERT INTO pessoa (nome,dt_nascimento) VALUES
("Isabela", '2000-01-01'),
("Pedro", "1999-06-10");
("Edimilson", "1945-07-13");

SHOW TABLES;

INSERT INTO pessoa (nome) VALUES
('Guilherme'),
('Mônica');

SELECT * FROM pessoa;

SELECT
nome,
IFNULL(dt_nascimento,"Sem data de nascimento")
FROM pessoa;

ALTER TABLE pessoa ADD COLUMN cpf CHAR(11);

DESCRIBE pessoa;
DESC pessoa;

ALTER TABLE pessoa MODIFY COLUMN cpf VARCHAR(12);

ALTER TABLE pessoa DROP COLUMN cpf;

ALTER TABLE pessoa RENAME COLUMN dt_nascimento TO dt_nasc;

DESC pessoa;

SELECT * FROM pessoa;

UPDATE pessoa SET nome='Clara Faria'
WHERE id_pessoa=4;
-- TODO UPDATE  tem que ter o WHERE;
UPDATE pessoa SET nome='Clara Faria' Where id_pessoa=4;

UPDATE pessoa SET nome='Sem nome' WHERE id_pessoa IN(1, 2);

DELETE FROM pessoa WHERE id_pessoa=1;

SELECT * FROM pessoa;

TRUNCATE pessoa;

SELECT * FROM pessoa;

CREATE TABLE funcionario(
id_func INT PRIMARY KEY auto_increment,
nome VARCHAR(50) DEFAULT 'Sem nome',
cpf CHAR(11) NOT NULL UNIQUE
);	

INSERT INTO funcionario(nome, cpf) VALUES
(NULL,'1234678901'),
(NULL,'1234678901');

INSERT INTO funcionario VALUES
(NULL,NULL,'12345678904');
