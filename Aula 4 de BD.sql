CREATE DATABASE aula_pre_prova;
USE aula_pre_prova;

CREATE TABLE produtos(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (60),
tipo VARCHAR (45),
CONSTRAINT chk_tipo CHECK (tipo IN("Geladeira",
"Alimento", "Videogame")),
preco DECIMAL (5,2),
quantidade_venda INT DEFAULT 0,
dt_compra DATETIME NOT NULL,
dt_venda DATETIME  NULL,
desconto DECIMAL(5,2)
);

INSERT INTO produtos 
(nome, tipo, preco, quantidade, dt_compra, desconto) VALUES
...


ALTER TABLE produtos MODIFY COLUMN 
dt_venda DATETIME DEFAULT CURRENT_TIMESTAMP;

DESC produtos;

INSERT INTO produtos (nome, tipo,
 preco, dt_compra, quantidade_venda, desconto )VALUES 
("TV", 'Geladeira','100.00',now(),100, 0.10),
('Nitendo 64', 'Videogame',700.99, '2026-08-27', 200, 50.00),
('Bolacha', 'Alimento', 9.99, '2026-08-24', 1000, 0.0),
('GTA6', 'Videogame', 499.99, '2026-07-21', 2, 0.00); 

select * FROM produtos;

-- COMANDOS COM NULL
-- COMANDOS PARA BUSCAR PRODUTOS COM dt_venda NULA
SELECT * FROM produtos WHERE dt_venda IS NULL;
SELECT * FROM produtos WHERE dt_venda = NULL;

SELECT * FROM produtos WHERE dt_venda IS NOT NULL;

SELECT nome, dt_venda, isnull(dt_venda) FROM produtos;
SELECT nome, isnull(dt_venda) FROM produtos;


-- ISNULL() RETORNA 1 PARA 'É NULO' E 0 PRA 'NÃO NULO
-- ISNULL <> IS NULL

-- IFNULL
-- COMANDO PARA SUBSTITUIR O 'NULL' POR ALGO
SELECT nome, dt_venda, IFNULL(dt_venda, 'não vendido') FROM produtos;
SELECT nome, dt_venda,
 IFNULL(dt_venda, 'produto ruim, não vendido') FROM produtos;
 
 -- NULLIF -> SE NULO
 -- COMANDO PARA ATRIBUIR 'NULL' QUANDO 2 VALORES FOREM IGUAIS
 SELECT nome, preco, NULLIF(dt_compra,dt_venda) FROM produtos;
 
 
 
 -- DATA E HORA
 SELECT now(), current_timestamp(), CURDATE();
 
 -- COMANDO QUE BUSCA SOMENTE A DATA - DIA
 SELECT nome, tipo, DAY(dt_compra) FROM produtos;
 
 SELECT nome,tipo, MONTH(dt_compra) FROM produtos;
 
 SELECT nome,tipo, YEAR(dt_compra) FROM produtos;
 
 SELECT nome,tipo, YEAR(dt_compra) AS 'Ano', 
 MONTH(dt_compra) AS 'Mês' FROM produtos;

SELECT * FROM produtos;

-- COMANDO PARA FORMATAR A SAÍDA DA DATA
SELECT nome, tipo, DATE_FORMAT(dt_compra, "%d/%m/%y")
FROM produtos;
SELECT nome, tipo, DATE_FORMAT(dt_compra, "%d/%m/%Y") AS 'Data formatada'
FROM produtos;

SELECT nome, tipo, DATE_FORMAT(dt_compra, "%d/%m/%Y %h:%i:%s") AS 'Data formatada'
FROM produtos;

/*
%d -> dia
%m -> mês
%y -> ano

%H -> hora
%i -> Minutos
%s -> segundo
*/

 -- DATEDIFF ()
 SELECT nome, tipo, DATEDIFF(NOW(), dt_compra) AS 'Dias desde a compra'
 FROM produtos;
 
 -- TIMESTAMPDIFF ()
 
 SELECT nome, TIMESTAMPDIFF(DAY, NOW(), dt_compra) FROM produtos;
 SELECT nome, TIMESTAMPDIFF(HOUR, NOW(), dt_compra) FROM produtos;
 
 SELECT nome, TIMESTAMPDIFF(HOUR, dt_compra,NOW()) FROM produtos;
 SELECT nome, TIMESTAMPDIFF(DAY, dt_compra,NOW()) FROM produtos;


SELECT nome, tipo, preco, desconto FROM produtos;
SELECT nome, tipo, preco - desconto FROM produtos;

ALTER TABLE produtos ADD COLUMN procent_descon INT;

UPDATE produtos SET procent_descon = 20 WHERE desconto = 0;

-- COMANDO PARA REMOVER O SAFE UPDATE
SET SQL_SAFE_UPDATES = 0;
