USE sprint1;
/* Considere a tabela aluguel, que armazena 
os dados de clientes e seus respectivos aluguéis de carro. 
A tabela possui, entre outros, os seguintes campos:
nome — primeiro nome do cliente.
sobrenome — sobrenome do cliente.
valor_total — valor total cobrado pelo aluguel.
status — situação do aluguel. Pode conter os valores: 
'finalizado', 'em_andamento' ou outros.*/
CREATE TABLE aluguel (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (40),
sobrenome VARCHAR (40),
valor_total DECIMAL (6, 2),
status_ VARCHAR (20),
CONSTRAINT chkStatus CHECK (status_ IN ('finalizado', 'em_andamento'))
);

INSERT INTO aluguel (nome, sobrenome, valor_total, status_) VALUES 
('Guilherme','Alcova',100.99, 'finalizado'),
('João','Silva',1000.00, 'finalizado'),
('José','Santos',782.00, 'em_andamento'),
('Felipe','Souza',1090.00, 'em_andamento');

SELECT * FROM aluguel;
SELECT CONCAT(nome," ", sobrenome) AS CLIENTE, 
valor_total,
CASE
WHEN  status_ = 'finalizado' THEN 'Concluído'
WHEN  status_ = 'em_andamento' THEN 'Em andamento'
ELSE 'Cancelado'
END AS 'situacao'
FROM aluguel ORDER BY CLIENTE;


-- Exercício 2: Biblioteca
CREATE DATABASE biblioteca;
USE biblioteca;
 /*Criar uma tabela chamada livro com os campos: 
 codigo, titulo, autor e ano_publicacao. 
 O campo autor deve ter o valor padrão definido como 'Sem Autor'.
 */
 CREATE TABLE livro (
codigo INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR (50),
autor VARCHAR (50) DEFAULT 'Sem autor',
ano_publicado Year
);
-- Adicionar dois registros na tabela livro.
INSERT INTO livro (titulo, autor, ano_publicado) VALUES
('A Revolução dos Bichos', 'George Orwell', '1945'),
('MAUS', 'Art Spiecelman', '1991');

SELECT * FROM livro;
UPDATE livro SET autor = 'George' WHERE codigo = 1;
SELECT titulo, autor FROM livro WHERE codigo = 1;

-- Adicionar dois registros na tabela livro.
DELETE FROM livro WHERE codigo = 2;
SELECT * FROM livro;

DESC livro;

-- Acrescentar uma nova coluna chamada editora na tabela livro.
ALTER TABLE livro ADD COLUMN editora VARCHAR (50);

-- Exibir todos os registros em que a coluna autor contenha a letra a.
SELECT * FROM livro WHERE autor LIKE '%a%';

-- Excluir a coluna editora da tabela livro.
ALTER TABLE livro DROP COLUMN editora;
DESC livro;

/* Criar uma tabela chamada usuario com os campos: 
codigo, nome e tipo. A coluna nome deve ser inserida obrigatoriamente.
*/
CREATE TABLE usuario(
codigo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50) NOT NULL,
tipo VARCHAR (50)
);

-- Adicionar dois usuários à tabela usuario.
INSERT INTO usuario (nome, tipo) VALUES
('João', 'Docente'),
('Paulo', 'Visitante');

-- Alterar o campo tipo para que aceite apenas os valores: 'docente', 'discente' ou 'visitante'.
ALTER TABLE usuario ADD CONSTRAINT chkTipo CHECK (tipo IN ('Docente', 'Discente', 'Visitante'));

-- Atualizar os dois registros de usuario, inserindo o valor do campo tipo.
UPDATE usuario SET tipo = 'Discente' WHERE codigo = 1;

-- Exibir todos os registros da tabela usuario em que a penúltima letra do campo nome seja m.
SELECT * FROM usuario WHERE nome LIKE '%m_';

-- Acrescentar uma nova coluna chamada telefone na tabela usuario.
ALTER TABLE usuario ADD COLUMN  telefone CHAR (12);
-- Alterar a tabela usuario, aumentando a quantidade de caracteres na coluna nome.
ALTER TABLE usuario MODIFY COLUMN nome VARCHAR (100); 
DESC usuario;

-- Criar uma consulta na tabela usuario, renomeando a coluna nome para nome_completo.
SELECT nome AS nome_completo FROM usuario;

-- Criar uma consulta na tabela livro, mostrando titulo e autor juntos em uma única coluna chamada detalhes.
SELECT concat(titulo, " ", autor) AS detalhes FROM livro;

-- Criar uma consulta na tabela livro, mostrando titulo, ano_publicacao 
-- e uma coluna classificacao que classifica livros publicados antes do ano 2000 
-- como "Antigo" e os demais como "Moderno".
SELECT * from livro;
SELECT titulo, ano_publicado,
CASE
WHEN ano_publicado < 2000 THEN 'Antigo'
ELSE 'Moderno'
END classificacao 
FROM livro;
 
 -- Criar uma consulta na tabela livro, mostrando todos os dados em ordem decrescente pelo campo titulo.
SELECT * FROM livro ORDER BY titulo;

-- Criar uma consulta na tabela usuario, mostrando todos os dados em que o campo tipo seja diferente de 'docente'.
SELECT * FROM usuario WHERE tipo <> 'Docente';

-- Esvaziar todos os registros da tabela livro, mantendo sua estrutura.
TRUNCATE livro;

-- Apagar o banco de dados biblioteca completamente.
DROP DATABASE biblioteca;



-- EXERCICIO 3
USE sprint1;
/*id — inteiro.
	nome — texto com tamanho adequado para o nome do produto.
	categoria — texto (ex.: "Camiseta", "Blusa", "Calça", "Jaqueta", "Short", "Moletom").
	tamanho — campo curto (ex.: 'P', 'M', 'G', 'GG').
	preco — valor numérico com casas decimais.
	disponivel — campo que armazena 0 (indisponível) ou 1 (disponível).
	data_cadastro — data e hora do cadastro do produto.
*/

CREATE TABLE produto (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50),
categoria VARCHAR (50),
tamanho VARCHAR (2) 
CONSTRAINT chkTamanho CHECK (tamanho IN ('P', 'M', 'G', 'GG')),
preco DECIMAL (10,2),
disponivel INT CONSTRAINT chkDisponivel CHECK (disponivel IN (0, 1)),
data_cadastro DATETIME
);

-- Inserir pelo menos 6 produtos variados, com diferentes categorias, 
-- 		tamanhos, datas de cadastro e valores de disponibilidade.
INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, data_cadastro) VALUES 
("camiseta Milan temporada 06/07",'Camiseta','G', '220.10', 1, '2006-07-22 12:30:21');
INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, data_cadastro) VALUES 
("Calça Baggy",'Calça','M', '120.50', 1, '2026-12-27 20:35:41'),
("Oversized",'Camiseta','GG', '80.99', 0, '2016-12-20 10:35:41'),
("Corta Vento",'Blusa','P', '129.00', 0, '2023-11-01 23:20:49'),
("Shorts",'Short','GG', '40.50', 1, '2026-09-09 06:00:59');
SELECT * FROM produto;
INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, data_cadastro) VALUES 
('Camiseta do Santos', 'Manto', 'G', 120.00, 1, '2026-01-09 20:35:27');

-- Listar os produtos que contenham a palavra "Camiseta" no nome.
SELECT * FROM produto WHERE nome LIKE '%camiseta%';

-- 2.	Listar os produtos que não sejam do tamanho 'M'.
SELECT * FROM produto WHERE tamanho <> 'M';

-- 3. 	Exibir apenas os produtos cadastrados depois de 18 de agosto de 2026.
SELECT * FROM produto WHERE data_cadastro > "2026-08-18";

-- 4. 	Listar os produtos disponíveis cuja categoria seja "Camiseta" ou "Blusa".
SELECT * FROM produto WHERE categoria = 'Camiseta' or categoria = 'Blusa';

-- 5.	Exibir o nome do produto concatenado com seu preço, usando o alias 'produto_preco'.
SELECT 
CONCAT(nome, "  R$", preco)
 AS produto_preco
 FROM produto;
 
 -- 6.	Listar os produtos cujo nome NÃO contenha a palavra "Blusa".
SELECT * FROM produto WHERE nome NOT LIKE 'Blusa';

-- 7.	Listar todos os produtos com uma coluna adicional chamada 'status' que 
-- 		mostre "Disponível" se disponivel = 1 e "Indisponível" caso contrário.

SELECT *,
CASE
WHEN disponivel = 1 THEN 'Disponível'
ELSE 'Indisponível'
END AS 'status'
 FROM produto;
 
 -- 8. 	Listar os produtos da categoria "Calça" com preço maior que R$ 100,00.
SELECT * FROM produto WHERE categoria = 'Calça' AND  preco > 100.00;

-- 9.	Listar os produtos com nome que não contenha a palavra "Camiseta".
SELECT * FROM produto WHERE nome NOT LIKE '%camiseta%';

-- 10.	Exibir os produtos cujo id seja 1, 3 ou 5.
SELECT * FROM produto WHERE id IN (1,3, 5);

-- 11.	Listar os produtos com tamanho diferente de 'P' e 'M'.
SELECT * FROM produto WHERE tamanho <> 'P' AND tamanho <> 'M';

-- 12.	Listar os produtos cadastrados antes de 18 de agosto de 2025.
SELECT * FROM produto WHERE data_cadastro < '2025-08-18';

-- 13.	Listar o nome e preço de todos os produtos, usando o alias 'produto_valor' para o campo preço.
SELECT nome, 
preco AS 'produto_valor' 
FROM produto;

-- 14.	Mostrar todos os produtos com uma coluna chamada 'info_completa' que una nome, 
-- 		categoria e preço em uma única coluna.
SELECT *,
concat(nome, " ",categoria,' R$',preco) AS 'info_completa'
FROM produto;

-- 15.	Mostrar os produtos que estão disponíveis e têm tamanho 'M'.
SELECT * FROM produto WHERE disponivel = 1 AND tamanho = 'M';

-- 16.	Listar os produtos com nomes que começam com a letra 'C'.
SELECT * FROM produto WHERE nome LIKE 'C%'; 

-- 1.	Atualizar o preço da "Jaqueta Couro" (Corta Vento) para R$ 270,00.
UPDATE produto SET preco = '270.00' WHERE id = 4;

 -- 2.	Marcar como indisponível todos os produtos da categoria "Blusa".
UPDATE produto SET disponivel = 0 WHERE  categoria = 'Blusa';
SELECT * FROM produto;
-- 3.	Atualizar o campo tamanho para 'M' nos produtos com nome que contenha "Short".
UPDATE produto SET tamanho = 'M' WHERE nome LIKE '%Short%';

-- 4.	Atualizar a categoria para "Camiseta" em todos os produtos cujo nome contenha "Camiseta".
UPDATE produto SET categoria = 'Camiseta' WHERE nome LIKE '%camiseta%';

-- 5.	Marcar como disponível todos os produtos cadastrados após 20 de agosto de 2026.
UPDATE produto SET disponivel = 1 WHERE data_cadastro > '2026-08-20';

-- 6.	Aumentar em 5% o preço dos produtos com preço inferior a R$ 100,00.
UPDATE produto SET preco = preco * 1.05 
WHERE preco < 100.00;

-- Atualizar o nome do produto de id = 4 para "Short Esportivo Unissex".
UPDATE produto SET nome = 'Short Esportivo Unissex' WHERE id = 4;

-- Marcar como indisponíveis os produtos com nome que contenha "Blusa" ou "Moletom".
UPDATE produto SET disponivel = '0' WHERE nome LIKE '%blusa%' OR nome LIKE '%Moletom%';
SELECT * FROM produto;

-- Atualizar a data_cadastro de todos os produtos da categoria "Camiseta" para a data atual.
UPDATE produto SET data_cadastro = Now() WHERE categoria = 'Camiseta';

-- Segunda Inserção e Consultas Avançadas
-- Inserir mais 6 produtos na tabela.
INSERT INTO produto ( nome, categoria, tamanho, preco, disponivel, data_cadastro) value
('Blusa Tricô', 'Blusa', 'G', 110.00, 0, '2026-08-12 14:20:00'),
('Bermuda Cargo', 'Bermuda', 'M', 99.00, 1, '1926-08-20 19:45:00'),
('Moletom Canguru','Blusa','GG',187.69, 1, '2023-10-21 07:30:53'),
('Calça Cino', 'Calça', 'P', 140.00, 1, '2026-08-16 11:30:00'),
('Meia','calçado','G',200.00,0, '2001-07-21 13:56:43'),
('Jaqueta Impermeável', 'Jaqueta', 'G', 220.00, 0, '2026-08-25 10:00:00');

-- Exibir os produtos com categoria igual a "Jaqueta" e que não estejam disponíveis.
SELECT * FROM produto WHERE categoria = 'Jaqueta' AND disponivel = 0;

-- Listar os produtos com tamanho 'GG' ou 'P', ordenados pelo preço em ordem decrescente.
SELECT * FROM produto WHERE tamanho = 'GG' OR tamanho = 'P' ORDER BY preco;

-- Mostrar apenas o nome e o tamanho dos produtos cadastrados no mês de agosto de 2026.
SELECT nome, tamanho FROM produto WHERE '2026-08-01'<data_cadastro< '2026-08-30';

-- Exibir os produtos com nomes terminando em "a".
SELECT * FROM produto WHERE nome LIKE '%a';

-- Exibir os produtos cuja categoria não esteja entre "Camiseta", "Calça" e "Short".
SELECT * FROM produto WHERE 
categoria <> 'Camiseta' 
AND categoria <> 'Calça'
 AND categoria <> 'Short';
 
-- Mostrar os produtos com preço entre R$ 50,00 e R$ 150,00, 
-- usando alias para o nome e para o preço.
SELECT nome AS 'Mercadoria', preco AS 'Preço' 
FROM produto WHERE '50.00'<preco AND preco <'150.00';

-- Exibir todos os produtos e adicionar uma coluna chamada 'info' 
-- que una nome e categoria com um hífen.
SELECT *, concat(nome, "-",categoria) AS 'info' FROM produto;

-- Mostrar os produtos que estão indisponíveis com uma coluna status que exiba "Em falta".
SELECT nome, 
disponivel,
CASE 
WHEN disponivel = 0 THEN 'Em falta'
END AS 'status' 
FROM produto WHERE disponivel = 0;

-- Listar todos os produtos cujo nome tenha 2 palavras (dica: o nome contém um espaço).
SELECT * FROM produto WHERE nome LIKE '% %';

/* Criar uma consulta completa exibindo os produtos cujo nome não contenha "Blusa", 
que tenham tamanho 'M' ou 'G', estejam disponíveis e tenham sido cadastrados 
após 15 de agosto de 2025. A consulta deve exibir:

O nome com alias nome_produto
O preço com alias preco_atual
A data_cadastro
Uma coluna descricao concatenando nome, categoria e preço
Uma coluna status_disponibilidade para mostrar o texto "Disponível" ou "Indisponível"*/

SELECT
nome AS 'nome_produto',
preco AS 'preco_atual', 
data_cadastro, concat(nome, " ",categoria, " ", preco) AS 'descrição',
tamanho,
CASE 
WHEN disponivel = 0 THEN 'Indisponível' 
WHEN disponivel = 1 THEN 'Disponível' 
END AS 'status_disponibilidade'
FROM produto 
WHERE nome NOT LIKE '%Blusa%' AND
tamanho = 'M' or
tamanho = 'G' AND
data_cadastro > '2026-08-15';


-- Exercício 4: Tabela Jogo
USE sprint1;

/*Crie a tabela jogo contendo as seguintes definições de campos: I

Identificador único que se autoincrementa como chave primária.
Campo de texto nome_jogo obrigatório.
Campo genero obrigatório. 
Campo preco do tipo numérico real com precisão exata.
Campo plataforma com limite de até 10 caracteres.
Campo data_lancamento apenas com dia, mês e ano.
Campo data_cadastro que armazene automaticamente a data e horário no momento do cadastro.
Campo modo_online que receba de forma binária apenas os valores 'S' ou 'N'.
*/
CREATE TABLE jogo (
id_jogo INT PRIMARY KEY AUTO_INCREMENT,
nome_jogo VARCHAR (50) NOT NULL,
genero VARCHAR (20),
preco DECIMAL (10,2),
plataforma VARCHAR (10),
data_lancamento DATE,
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
modo_online CHAR (1) CONSTRAINT chkModo CHECK(modo_online IN('S', 'N'))
);

INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUES 
('Red Dead Redemption 2', 'Ação/Aventura', 249.90, 'PC', '2018-10-26', '2026-03-01 10:00:00', 'S'),
('Counter-Strike 2', 'FPS', NULL, 'PC', '2023-09-27', CURRENT_TIMESTAMP, 'S'),
('Valorant', 'FPS', 0.00, 'PC', '2020-06-02', CURRENT_TIMESTAMP, 'S'),
('Chrono Trigger', 'RPG', 49.99, 'PC', '1995-03-11', CURRENT_TIMESTAMP, 'N'),
('Grand Theft Auto 2', 'Ação', 19.99, 'PC', '1999-10-22', CURRENT_TIMESTAMP, 'N'),
('DOOM', 'FPS', 61.50, 'PC', '1993-12-10', CURRENT_TIMESTAMP, 'N'),
('DOOM', 'FPS', 59.90, 'PS4', '2016-05-13', CURRENT_TIMESTAMP, 'S'),
('Tetris Effect', NULL, 73.99, 'Switch', '2018-11-09', CURRENT_TIMESTAMP, 'N');

SELECT * FROM jogo; 
SELECT nome_jogo, preco FROM jogo;
SELECT * FROM jogo WHERE preco > 100.00;
SELECT * FROM jogo WHERE plataforma = 'PC';
SELECT * FROM jogo ORDER BY preco;
SELECT * FROM jogo ORDER BY preco DESC;
SELECT * FROM jogo WHERE YEAR(data_lancamento) > 2020;
SELECT nome_jogo, preco AS 'Valor' FROM jogo;
SELECT concat(nome_jogo," ",plataforma) AS 'Dados' FROM jogo;
SELECT IFNULL(preco, 'Gratuito') FROM jogo;
SELECT IFNULL(genero, "Não informado") FROM jogo;
SELECT nome_jogo, data_lancamento, data_cadastro,CONCAT("R$",preco) FROM jogo;
SELECT data_lancamento AS 'Lançamento' FROM jogo;
SELECT modo_online AS 'Modo Online' FROM jogo;
SELECT CONCAT(nome_jogo,'-',genero) FROM jogo;

SELECT
CASE
WHEN preco IS NULL THEN CONCAT("O jogo ",nome_jogo, "com a data de lançamento ",data_lancamento, "está Grátis!")
ELSE CONCAT("O jogo ",nome_jogo, "com a data de lançamento ",data_lancamento, "está custando R$ ", preco,'.')
END AS 'Mostrar' FROM jogo;

SELECT nome_jogo,
CASE
WHEN preco > 200.00 THEN 'Caro'
ELSE 'Acessível'
END AS 'classificação' FROM jogo;

SELECT nome_jogo,
CASE
WHEN modo_online = 'S' THEN 'ONLINE'
END AS 'Modo' FROM jogo;

SELECT nome_jogo,
CASE
WHEN modo_online = 'N' THEN 'OFFLINE'
END AS 'Modo' FROM jogo;

SELECT CONCAT(nome_jogo," ", preco, " ", modo_online) FROM jogo;

SELECT *,
CASE 
WHEN YEAR(data_lancamento) > 2026 THEN 'Lançamento recente'
END AS 'laçamento' FROM jogo;  

SELECT 	*,
CASE 
WHEN preco = 0 THEN 'Gratuito'
WHEN preco IS NULL THEN 'Gratuito'
ELSE 'Pago'
END AS 'situação'
FROM jogo;

SELECT nome_jogo, genero, preco,
CASE 
WHEN plataforma = 'PC' THEN 'Computador'
ELSE 'CONSOLE'
END AS 'PLATAFORMA'
FROM jogo;

SELECT nome_jogo, genero, 
CASE 
WHEN preco < 50.00 THEN 'Econômico'
WHEN preco < 100.00 THEN 'Intermediário'
ELSE 'CARO'
END AS 'PREÇO'
FROM jogo;

SELECT nome_jogo, genero, preco,
CASE 
WHEN YEAR(data_lancamento) <2015 THEN 'Clássico'
ELSE 'Nova geração'
END AS 'categoria'
FROM jogo;

SELECT * FROM jogo 
WHERE preco IS NULL OR preco = 0 
ORDER BY nome_jogo;

/*Criar uma consulta consolidada contendo:
Nome do jogo;
Plataforma;
Preço tratado amigavelmente para valores não informados;
Classificação de preço em Econômico, Intermediário ou Caro.*/
 
 SELECT concat(
 nome_jogo, ' / ',
 plataforma, ' / ') AS 'INFOS',
 CASE 
 WHEN preco < 50.00 THEN 'Econômico'
 WHEN preco < 100.00 THEN 'Intermediário'
 ELSE 'Intermediário'
 END AS 'Preço' FROM jogo;
 SELECT * FROM jogo;
 
 UPDATE jogo SET preco = 67.00 WHERE id_jogo = 4;
 UPDATE jogo SET genero = 'Aventura' WHERE id_jogo = 1;
 UPDATE jogo SET modo_online = 'S' WHERE plataforma = 'PC';
 UPDATE jogo SET preco = 0.00 WHERE preco IS NULL;
 UPDATE jogo SET plataforma = 'PS4' WHERE id_jogo = 5;
 UPDATE jogo SET data_lancamento = '2017-09-12' WHERE id_jogo = 7;

UPDATE jogo SET preco = 0.00; 💀;
SELECT * FROM jogo; 

DELETE FROM jogo WHERE id_jogo = 7;

DELETE FROM jogo WHERE genero IS NULL;

DELETE FROM jogo WHERE YEAR (data_lancamento) < 2019;

TRUNCATE jogo;
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUES 
('Red Dead Redemption 2', 'Ação/Aventura', 249.90, 'PC', '2018-10-26', '2026-03-01 10:00:00', 'S');
-- DELETE 'SOME' com o dado visualmente mas seu ID fica 'na memória', o TRUNCATE é uma amnésia que reinicia o id

ALTER TABLE jogo ADD COLUMN classificacao_indicativa INT;
DESC jogo;
ALTER TABLE jogo ADD COLUMN tamanho_jogo FLOAT;
ALTER TABLE jogo ADD COLUMN Desenvolvedora VARCHAR (45);
ALTER TABLE jogo ADD COLUMN modo_historia CHAR (1),
ADD CONSTRAINT chkHistoria check (modo_historia IN ('S', 'N'));

ALTER TABLE jogo MODIFY COLUMN nome_jogo VARCHAR(100);
ALTER TABLE jogo MODIFY COLUMN plataforma VARCHAR(20);
ALTER TABLE jogo MODIFY COLUMN preco DECIMAL (18,2);

ALTER TABLE jogo DROP CHECK chkModo;
ALTER TABLE jogo RENAME COLUMN  modo_online to Modo;
DESC jogo;
ALTER TABLE jogo DROP COLUMN desenvolvedora;
ALTER TABLE jogo DROP COLUMN modo_historia;

ALTER TABLE jogo DROP COLUMN inexistente;
/*Código de erro: 1091. Não é possível executar DROP em 'inexistente'; 
verifique se a coluna/chave existe.
A mensagem informa o erro do comando, e ainda oferece sugestões para 
corrigi-los*/

ALTER TABLE jogo MODIFY COLUMN nome_jogo VARCHAR (100) UNIQUE;