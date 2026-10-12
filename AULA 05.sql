 CREATE DATABASE aula5_ccok262;

USE aula5_ccok262;

-- ==========================================================================
-- COMANDOS DCL
-- ==========================================================================

-- Comando para a criação de usuário.
-- A sintaxe 'estag'@'%' indica: 'nome_do_usuario'@'ip_sendo_usado'
-- IDENTIFIED BY indica a senha
CREATE USER 'estag'@'%' 
IDENTIFIED BY 'SPTECH@123senha';

-- Mostra as permissões do usuário
-- GRANT = conceder
-- REVOKE = remover
SHOW GRANTS FOR 'estag'@'%';

-- *.* -> concede permissão de acesso a todos os
-- schemas e todas as suas tabelas

-- *.* -> é como se fosse schema.table

-- Concedendo permissão de SELECT para o usuário estag
-- no IP '%' (qualquer um), dentro do schema aula5_ccok262
-- e em todas as tabelas (por causa do *). 
GRANT SELECT ON aula5_ccok262.* TO 'estag'@'%';

-- Concedendo todas as permissões para o usuário estag
GRANT ALL ON *.* TO 'estag'@'%';

-- Concedendo permissão de CREATE E UPDATE ao estag
-- no DATABASE aula5_ccok262, apenas na tabela aluno
GRANT CREATE, UPDATE ON aula5_ccok262.aluno 
TO 'estag'@'%';

-- Comando para atualizar permissões
FLUSH PRIVILEGES;

-- Comando para remover todas as permissões
REVOKE ALL PRIVILEGES, GRANT OPTION 
FROM 'estag'@'%';

-- Comando para remover uma permissão específica.
-- Nesse caso, removendo o CREATE, do estag, no schema
-- aula5_ccok262, ns tsbrls aluno.
REVOKE CREATE ON aula5_ccok262.aluno 
FROM 'estag'@'%';

-- "Apagando" o usuário
DROP USER 'estag'@'%';


-- ==========================================================================
-- CHAVE ESTRANGEIRA E JUNÇÃO DAS TABELAS
-- FOREIGN KEY (FK) E JOIN
-- ==========================================================================
USE aula5_ccok262;
CREATE TABLE empresa (
id_empresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45), 
cpnj CHAR(14)
);

-- Se eu tentar criar a tabela aluno antes da tabela empresa, vai dar erro.
-- Esse erro acontece porque para eu fazer uma FK, a PK precisa existir.
-- Por isso, não consigo fazer fk_empresa se o id_empresa nem existe ainda.
CREATE TABLE aluno (
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
ra CHAR(8),
fk_empresa INT,
CONSTRAINT cFkEmpresa FOREIGN KEY(fk_empresa)
REFERENCES empresa (id_empresa)
);

/*
Explicações:

CREATE TABLE aluno (
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
ra CHAR(8),
--> O campo que irá conter a restrição de FK deve ser criado primeiro
--> Você pode dar qualquer nome, mas, dê um nome de fácil compreensão
--> O tipo desse campo que irá ser FK precisa ser o mesmo tipo da PK da outra tabela
fk_empresa INT,
--> Essa constraint que faz um campo virar Foreign Key
--> Sintaxe: CONSTRAINT nome_constraint FOREIGN KEY (campo_que_voce_criou_para_fk)
--> REFERENCES tabela_que_possui_pk (pk)
CONSTRAINT cFkEmpresa FOREIGN KEY(fk_empresa)
REFERENCES empresa (id_empresa)
);
*/

INSERT INTO empresa (nome) VALUES
('Safra'),
('Avanade');

SELECT * FROM empresa;

-- Essa FK que vai fazer a relação entre as duas tabelas
INSERT INTO aluno (nome, fk_empresa) VALUES
('Matheus', 1),
('Julio', 2),
('Arthur', 1);

-- JOIN: junção de duas tabelas no SELECT.
-- Todo JOIN deve ter o ON em seguida, para especificar 
-- qual campo é a PK e qual campo é FK de cada tabela
SELECT
	aluno.nome 'Nome Aluno',
    empresa.nome AS 'Nome Empresa'
    FROM aluno
    JOIN empresa
    ON empresa.id_empresa = aluno.fk_empresa;



