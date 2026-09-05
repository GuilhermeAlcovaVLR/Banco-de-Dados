-- LISTA 03 --
-- EXERCÍCIO 01 --
CREATE DATABASE game_store;

/* Criar a tabela chamada jogo que contenha o 
id como número e chave primária que se autoincrementa,
o nome do jogo com tamanho máximo de 30 caracteres,
o diretor do jogo com tamanho máximo de 30 caracteres, 
o genero com tamanho de 30 caracteres, a data_lancamento,
 a nota do jogo (entre 0–10) 
 e um campo para guardar a quantidade de unidades disponíveis. */
USE game_store;
CREATE TABLE jogo(
id_jogo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (30),
diretor VARCHAR (30),
genero VARCHAR (30),
data_nascimento DATE NULL, 
nota INT,
estoque INT,
CONSTRAINT chkNivel CHECK(nota>= 0 AND nota <= 10)
); 

-- Inserir pelo menos 5 registros para a tabela.

INSERT INTO jogo (nome, diretor, genero, data_nascimento, nota, estoque) VALUES
('PES', 'Cristiano Ronaldo','Esporte','2001-10-13','10', '9000'),
('Minecraft','João Silva', 'Aventura','2006-07-30','10','1234567890'),
('FIFA','Messi','Esporte','2026-08-21','7','8999'), 
('Clash Royale','Gustavo Yoshio','Estratégia','2016-12-01','6','867'),
('Candy Crush','Vó Tereza','Puzzle','2010-02-28','9','100000');

SELECT * FROM jogo;

-- Alterar a tabela para inserir uma coluna que represente o tipo_midia, 
-- que deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”.
ALTER TABLE jogo ADD COLUMN tipo_midia VARCHAR (7)
CONSTRAINT chkMidia CHECK(tipo_midia IN ('física', 'digital'));

-- Atualizar os registros dos jogos inseridos anteriormente.
UPDATE jogo SET tipo_midia='digital' WHERE id_jogo IN(4,5);
UPDATE jogo SET tipo_midia='física' WHERE id_jogo IN(1,2,3);

-- Exibir apenas os jogos com data de lançamento a partir de 2015.
SELECT * FROM jogo WHERE data_nascimento >= '2015-01-01';

-- Exibir os jogos que tenham a letra “a” em seu nome e são de mídia física.
SELECT * FROM jogo WHERE nome LIKE '%a%' AND tipo_midia='física';

-- Exibir os jogos onde o nome do diretor não contenha a letra “e”.
SELECT * FROM jogo WHERE diretor NOT LIKE  '%e%';

-- Alterar a tabela para criar uma checagem na inserção da nota,
-- onde o valor não pode ser menor que 0 e nem maior que 10.
-- JÁ FIZ ISSO

-- Exibir os jogos de um determinado gênero e que ainda esteja em estoque.
SELECT * FROM jogo WHERE genero='Esporte'AND estoque <> 0;

-- Excluir os jogos que não têm mais unidades disponíveis em estoque.
DELETE FROM jogo WHERE estoque=0 AND id_jogo IN(1,2,3,4,5);

-- Renomear a coluna diretor para criador e exibir como ficou a estrutura da tabela.
ALTER TABLE jogo RENAME COLUMN diretor TO criador; 
SHOW TABLES;
SELECT * FROM jogo;



-- EXERCÍCIO 2 --
/* Criar a tabela chamada esporte que contenha id 
como número e chave primária que se autoincrementa, 
nome que armazena o nome do esporte com limite de 40 caracteres, 
a categoria do esporte com limite de 20 caracteres que aceita apenas (“Individual” ou “Coletivo”), 
o num_jogadores que podem participar por equipe, 
estreia que armazena a data de quando o esporte estreou nas Olimpíadas 
e o pais_origem do esporte com até 30 caracteres.
*/
CREATE DATABASE jgsolimps;
USE jgsolimps;
CREATE TABLE esporte(
id_esporte INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (40),
categoria VARCHAR (20),
num_jogadores INT,
estreia DATE NULL,
país_origem VARCHAR(30)
);

ALTER TABLE esporte ADD CONSTRAINT chkcat CHECK(categoria IN('Individual', 'Coletivo'));
INSERT INTO esporte (nome, categoria, num_jogadores, estreia, país_origem) VALUES
('FUTEBOL','COLETIVO','11','1930-01-01','INGLATERRA');

INSERT INTO esporte (nome, categoria, num_jogadores, estreia, país_origem) VALUES
('VOLEI','COLETIVO','6','1964-01-01','ESTADOS UNIDOS'),
('BOXE','INDIVIDUAL','1','1904-01-01','EGITO'),
('SKATE','INDIVIDUAL','1','2020-06-20','ESTADOS UNIDOS'),
('BASQUETE','COLETIVO','5','1936-06-01','ESTADOS UNIDOS');

SELECT * FROM esporte;

-- Alterar a tabela para adicionar uma coluna popularidade
-- que armazene a popularidade do esporte como um valor decimal
-- entre 0 e 10 e exibir como ficou a estrutura da tabela.

ALTER TABLE esporte ADD COLUMN popularidade DECIMAL
CONSTRAINT chkpop CHECK(popularidade>=0 AND popularidade<=10);

-- Atualizar os registros para definir a popularidade dos esportes inseridos anteriormente.
UPDATE esporte SET popularidade='10' WHERE id_esporte IN(1, 2, 5);
UPDATE esporte SET popularidade='9' WHERE id_esporte IN(3, 4);

-- Exibir os esportes ordenados por popularidade em ordem crescente.
SELECT * from esporte ORDER BY popularidade;

-- Exibir apenas os esportes que estrearam nas Olimpíadas a partir do ano 2000.
SELECT * FROM esporte WHERE estreia >= '2000-01-01';

-- Criar uma checagem para que não possa ser inserido 
-- valores dentro de estreia que seja menor que 06 de abril de 1896
-- e depois da data atual.
ALTER TABLE esporte ADD CONSTRAINT chkEst CHECK(estreia>= '1896-04-06'); 

-- Alterar a tabela para excluir a regra de inserção de categoria, 
-- assim podendo colocar valores além de “Individual” ou “Coletivo”.
ALTER TABLE esporte DROP CONSTRAINT chkcat;

-- Exibir apenas os esportes cujo nome do país de origem tenha “a” na segunda letra.
SELECT * FROM esporte WHERE país_origem LIKE'a%';

-- Exibir os dados onde o número de jogadores por equipe esteja entre 4 e 11.
SELECT * FROM esporte WHERE num_jogadores>= 4 AND num_jogadores <= 11;

-- Remover os registros onde id seja 1, 3 e 5.
DELETE FROM esporte WHERE id_esporte= 1;
DELETE FROM esporte WHERE id_esporte IN (3, 5);


-- EXERCÍCIO 3
CREATE DATABASE desenho;
USE desenho;

CREATE TABLE desenho_s(
id_desenho INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR (50),
data_lancamento DATE NULL,
emissora_original VARCHAR(50),
classificação INT,
status_ CHAR(15),
nota INT,
CONSTRAINT chkDesenho CHECK(nota>=1 AND nota<=5)
) auto_increment= 10;

INSERT INTO desenho_s (titulo, data_lancamento, emissora_original, classificação, status_, nota) VALUES
('Apenas um show','2010-05-29','Cartoon Network','10','Exibindo','5'),
('Incrível Mundo de Gumball','2013-12-12','Cartoon Network','8','Exibindo','5'),
('Hora de Aventura','2012-07-21','Cartoon Network','10','Finalizado','5'),
('Ben 10','2005-12-27','Cartoon Network','10','Finalizado','5'),
('Avatar','2007-09-27','Nicklodeon','10','Finalizado','5'),
('Padrinhos Mágicos','2000-09-10','Nicklodeon','0','Finalizado','3');

SELECT * FROM desenho_s;

-- Exibir todos os desenhos com a classificação menor ou igual a 14 anos.
SELECT * FROM desenho_s WHERE classificação <= '14';

-- Exibir todos os desenhos de uma mesma emissora original.
SELECT * FROM desenho_s WHERE emissora_original = 'Cartoon Network';

-- Modificar o campo status, para que aceite apenas o status ‘exibindo’, 
-- ‘finalizado’, ‘cancelado’; tente inserir algum outro valor para ver se a regra foi aplicada.
ALTER TABLE desenho_s ADD CONSTRAINT chkStats CHECK(status_ IN('Exibindo','finalizado','cancelado'));
INSERT INTO desenho_s (status_) VALUES
('Só velho assiste');

-- Modificar o status ‘exibindo’ para ‘finalizado’ de 2 desenhos pelo ID.
UPDATE desenho_s SET status_ = 'finalizado' WHERE id_desenho IN(10, 11);

-- Deletar a linha do desenho de ID 12.
DELETE FROM desenho_s WHERE id_desenho = 12;

-- Exibir apenas os desenhos que comecem com uma determinada letra.
SELECT * FROM desenho_s WHERE titulo LIKE 'A%';

-- Renomear a coluna classificacao para classificacaoIndicativa.
ALTER TABLE desenho_s RENAME COLUMN classificação TO classificacaoIndicativa;

-- Atualizar a nota e data de lançamento do desenho de ID 11.
UPDATE desenho_s SET nota= '3' WHERE id_desenho='11' ;
UPDATE desenho_s SET data_lancamento='2026-08-22' WHERE id_desenho='11' ;

-- Limpar todos os dados da tabela.
TRUNCATE desenho_s;

-- Remover a regra do status do desenho.
ALTER TABLE desenho_s DROP CONSTRAINT chkStats;


-- Exercício 4
CREATE DATABASE estoque;
USE estoque;
 
 /* Criar uma tabela chamada MisteriosSA, que possui os campos: 
 id um número inteiro chave primária, 
 nome um campo de texto para armazenar o nome do produto, 
 data_compra para armazenar a data na qual o produto foi comprado, 
 preco valor numérico com casas decimais, 
 peso um valor numérico que armazena o peso em gramas e 
 data_retirada para armazenar a data em que o produto foi consumido.
*/
CREATE TABLE MisteriosSA(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100),
data_compra DATE NULL,
preco DECIMAL (10, 2),
peso INT,
data_retirada DATE NULL
);
INSERT INTO MisteriosSA (nome, data_compra,preco, peso) VALUES
('Biscoitos Scooby','2026-08-23', '75.90','300'),
('Cachorro Quente','2026-08-15', '03.50','250'),
('Biscoitos Scooby','2026-08-20', '12.56','500'),
('Cachorro Quente','1900-12-01', '00.01','1000'),
('Biscoitos Scooby','2025-11-17', '15.75','500');

SELECT * FROM MisteriosSA;

-- Exibir os nomes, as datas de compra e retirada e o 
-- id dos alimentos ordenados a partir da data de compra mais antiga.
SELECT nome, data_compra, data_retirada, id FROM MisteriosSA;

-- Alguém comeu uma caixa de biscoitos, atualizar a data de retirada 
-- da caixa de “Biscoitos Scooby” que foi comprada a mais tempo.
UPDATE MisteriosSA SET data_retirada ='2026-08-24' WHERE id = 1;

-- Alterar o nome da coluna id para idComida.
ALTER TABLE MisteriosSA RENAME COLUMN id TO idComida;
 
-- Alterar o tipo do check para que os alimentos só possam ser “Biscoitos Scooby” ou “Cachorro-quente”
ALTER TABLE MisteriosSA ADD CONSTRAINT  chkAlimentos 
CHECK(nome = 'Biscoitos Scooby' or nome = 'Cachorro Quente');
SELECT * FROM MisteriosSA;

-- Exibir os produtos onde o nome seja “Biscoitos Scooby” de forma que o nome das colunas 
-- dataCompra apareça como “data da compra” e dataRetirada apareça como “data da retirada”.
  
    SELECT 
    data_compra AS 'Data da compra',
    data_retirada AS 'Data da Retirada'
    FROM MisteriosSA;
    
-- Exibir os alimentos que foram comprados antes do dia 25 de julho de 2024.
SELECT * FROM MisteriosSA WHERE data_compra < '2024-07-25';

-- Exibir os alimentos que possuem um preço acima ou igual a 30.50.
SELECT * FROM MisteriosSA WHERE preco >= '30.50';

-- Limpar a tabela.
TRUNCATE MisteriosSA;


-- Exercício 5: Heróis
CREATE DATABASE vingadores;
USE vingadores;

/* Criar uma tabela chamada heroi, onde terá um campo de nome contendo até 45 caracteres. 
O seu herói poderá ter uma versao, onde será armazenado o filme de sua escolha, 
esse campo aceitará até 45 caracteres. Todo herói tem uma habilidade que se destaca entre os outros super-heróis. 
Todo herói tem uma altura, esse campo aceitará valores inteiros representando centímetros.
 O id deverá se autoincrementar. */
 CREATE TABLE heroi (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(45),
 filme VARCHAR (45),
 habilidade VARCHAR(50) UNIQUE,
 altura int
 );
 
 -- Inserir 5 heróis para derrotar o vilão Doutor Destino.
 INSERT INTO heroi (nome, filme, habilidade, altura) VALUES 
 ('Homem Aranha','O Espetacular Homem Aranha','Agilidade','185'),
 ('Homem Formiga','Vingadores Ultimato','Mudar seu tamanho','162'),
 ('Capitão América','Guerra Civil','Bomba','189'),
 ('Homem de ferro','O Homem de Ferro 1','Ser rico','185'),
 ('Gavião Arqueiro','Vingadores','Flechas','187');
 SELECT * FROM heroi;
 
 -- Adicionar um campo de regeneracao, onde ele aceitará apenas os valores booleanos de TRUE ou FALSE.
ALTER TABLE heroi ADD COLUMN regeneracao VARCHAR (5) 
CONSTRAINT chkReg CHECK (regeneracao = 'TRUE' OR regeneracao = 'FALSE'); 

-- Modificar o campo versao para aceitar até 100 caracteres.
ALTER TABLE heroi MODIFY COLUMN filme VARCHAR (100);

-- Remover o herói de id 3 pois ele se morreu em batalha.
DELETE FROM heroi WHERE id = 3;

-- Chegou reforços, inserir um novo herói para a equipe.
INSERT INTO heroi (nome, filme, habilidade, altura) VALUE 
('Batman', 'O Cavalheiro das trevas', 'Ser MUITO rico','187');

-- Exibir todos os dados inseridos na tabela onde o nome do herói começa com “C” ou “H”.
SELECT * FROM heroi WHERE nome LIKE 'C%' OR  nome LIKE 'H%';

-- Exibir todos os dados inseridos na tabela onde o nome do herói não contém a letra “A” no campo nome.
SELECT * FROM heroi WHERE nome NOT LIKE '%A%';

-- Exibir apenas o nome do herói onde a altura for maior que 190.
SELECT * FROM heroi WHERE altura > '190';

-- Exibir todos os dados da tabela de forma decrescente pelo nome onde a altura do herói for maior que 180.
SELECT * FROM heroi WHERE altura > '180' ORDER BY nome;

-- Limpar os dados da tabela.
TRUNCATE TABLE heroi;



-- Exercício 6: Revista
USE sprint1;

/* Criar a tabela chamada Revista para conter os campos: 
idRevista (int e chave primária da tabela),
 nome (varchar, tamanho 40), categoria (varchar, tamanho 30). 
 Os valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente pelo sistema. */
 
 CREATE TABLE revista (
 idRevista INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR (40),
 categoria VARCHAR (30)
 );
 
 -- Inserir 4 registros na tabela, mas sem informar a categoria.

INSERT INTO revista (nome) VALUES
('Placar'),
('Forbe'),
('Olé'),
('People');


-- Exibir todos os dados da tabela.
SELECT * FROM revista;

-- Atualizar os dados das categorias das 3 revistas inseridas. 
-- Exibir os dados da tabela novamente para verificar se atualizou corretamente.
UPDATE revista SET categoria = 'Esporte' WHERE idRevista IN(1, 3);
UPDATE revista SET categoria = 'Negócios' WHERE idRevista IN(2);
 
 -- Inserir mais 3 registros completos.
INSERT INTO revista (nome, categoria) VALUES 
('Veja', 'Política'),
('Foco', 'Negócios'),
('Recreio','Juvenil');

 -- Exibir novamente os dados da tabela.
SELECT * FROM revista;
DESC revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE revista MODIFY COLUMN categoria VARCHAR (40);
DESC revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE revista ADD COLUMN periodicidade VARCHAR (15);
UPDATE revista SET periodicidade = 'Semanal' WHERE idRevista IN (1, 2, 3, 4, 5,6, 7);

-- Exibir os dados da tabela.
SELECT * FROM revista;

ALTER TABLE revista DROP COLUMN periodicidade;



-- Exercício 7: Carro
USE sprint1;

/* Criar a tabela chamada Carro para conter os campos: idCarro (int e chave primária da tabela),
 nome (varchar, tamanho 40), placa (char, tamanho 7). 
 Os valores de idCarro devem iniciar com o valor 1000
 e ser incrementado automaticamente pelo sistema. */
 
 CREATE TABLE carro (
 idCarro INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR (40),
 placa CHAR (7)
 )auto_increment = 1000;
 
INSERT INTO carro (nome, placa) VALUES
('Relampago Mcqueen', '9595957'),
('Jackson Storm', '2000000'),
('Rei Strip Weathers', '4343434'),
('Jackson Storm', '2000000');

SELECT * FROM carro;

-- Inserir mais 3 registros sem a placa dos carros.
INSERT INTO carro (nome) VALUES
('Sally Carrera'),
('Tow Mate'),
('Doc Hudson');

SELECT * FROM carro;
DESC carro;

-- Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.
ALTER TABLE carro MODIFY COLUMN nome VARCHAR (28);
DESC carro;

-- Acrescentar a coluna ano à tabela, que é char(4).
ALTER TABLE carro ADD COLUMN ano CHAR (4);

UPDATE carro SET ano = '2007' WHERE idCarro IN ( 1000, 1004, 1005);
UPDATE carro SET ano = '2020' WHERE idCarro IN ( 1001, 1003);
UPDATE carro SET ano = '1990' WHERE idCarro IN ( 1002);
UPDATE carro SET ano = '1970' WHERE idCarro IN ( 1006);















