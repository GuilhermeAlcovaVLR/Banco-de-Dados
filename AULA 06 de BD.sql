 CREATE DATABASE aula6_ccok262;

CREATE TABLE aula6_ccok262.responsavel(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(150),
cpf CHAR(11)
);

USE aula6_ccok262;

CREATE TABLE empresa(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cnpj CHAR(14) UNIQUE NOT NULL,
fk_responsavel INT UNIQUE,
CONSTRAINT ckFkResponsavel
	FOREIGN KEY (fk_responsavel) REFERENCES
    responsavel (id)
);

CREATE TABLE funcionario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(150),
cpf CHAR(11) UNIQUE NOT NULL,
salario DECIMAL(10,2),
fk_empresa INT,
CONSTRAINT ckFkEmpresa 
	FOREIGN KEY (fk_empresa) REFERENCES
    empresa (id)
);

INSERT INTO responsavel (nome, cpf) VALUES
('Clara', '11111111111'),
('Victor', '22222222222');

INSERT INTO empresa (nome, cnpj, fk_responsavel) VALUES
('SPTECH', '11111111111111', 1),
('Bradesco', '22222222222222', 2);
 
INSERT INTO funcionario 
(nome, cpf, salario, fk_empresa) VALUES
('Isa', '11111111112', 2000.00, 1),
('Julia', '11111111113', 5000.99, 1);

SELECT 
e.nome AS 'Nome Empresa',
resposanvel.nome 'Nome Resp.',
f.nome 'Nome Func.'
FROM responsavel
	JOIN empresa e 
    ON e.fk_responsavel = r.id
    JOIN funcionario f
    ON f.fk_empresa = e.id;
    
SELECT
	empresa.nome,
    funcionario.nome
FROM
empresa LEFT JOIN funcionario
	ON funcionario.fk_empresa = empresa.id;
    
SELECT
	empresa.nome AS nome_empresa,
    IFNULL(funcionario.nome, 'Sem funcionários') nome_funcionario
FROM empresa LEFT JOIN funcionario
	ON funcionario.fk_empresa = empresa.id
WHERE empresa.nome LIKE 'S%' OR empresa.nome LIKE 'B%'
ORDER BY empresa.nome;


SELECT e.nome
	FROM empresa e;
    
    
/*
Tipos de comandos DCL
Comando para conceder permissão: GRANT
Comando para revogar permissão: REVOKE
Comando para criar usuários: CREATE
Comando para apagar usuários: DROP
Comando para atualizar permissões: FLUSH PRIVILEGES
*/
 


 
 