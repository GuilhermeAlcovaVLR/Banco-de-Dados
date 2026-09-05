CREATE DATABASE ac1;
USE ac1;


CREATE TABLE aluno (
id_aluno INT PRIMARY KEY auto_increment, 
nome_aluno VARCHAR (120),
ra CHAR (8) UNIQUE,
frequencia DECIMAL (4,1),
periodo VARCHAR (20),
ativo TINYINT NOT NULL DEFAULT 1,
semestre TINYINT,
CONSTRAINT chkFreq CHECK (frequencia BETWEEN 0 AND 100), -- BETWEEN -> Entre
CONSTRAINT chkPeriodo CHECK (periodo IN ('Calouro', 'Veterano'))
);

INSERT INTO aluno (nome_aluno, ra, frequencia, 
periodo, ativo, semestre) VALUES
('Clara', '01212154', 100.0, 'Veterano', 1, 8),
('Matheus', '04262019', 90.0, 'Calouro', 1, 1),
('Matheus', '04262001', 98.0, 'Calouro', default, 10);

SELECT nome_aluno, ra, 
CASE
WHEN frequencia > 75 THEN 'Aprovado'
ELSE 'Reprovado'
END AS 'Aprovação',
CASE ativo
WHEN 1 THEN 'Ativo'
WHEN 0 THEN 'Inativo' 
END status_ativo FROM 
aluno;

ALTER TABLE aluno 
DROP CONSTRAINT chkFreq,    
DROP CONSTRAINT chkPeriodo,
ADD COLUMN novo VARCHAR(45),    
ADD COLUMN posso VARCHAR(30    
MODIFY COLUMN nome VARCHAR(200);

UPDATE aluno
SET nome_aluno = 'Clara Faria', frequencia = 99.9
WHERE id_aluno IN (1, 2, 5);

UPDATE aluno SET ativo = 0 WHERE periodo = 'Veterano'    