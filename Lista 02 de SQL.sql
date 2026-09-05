-- EXERCÍCIO 1
USE sprint1;
CREATE TABLE atleta(
id_atleta INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
modalidade VARCHAR (50),
qtd_medalha INT
);

INSERT INTO atleta VALUES
(1, "Ayrton Senna","F1","3"),
(2, "Cristiano Ronaldo","futebol","36"),
(3, "Pelé","futebol","3"),
(4, "Neymar","futebol","30"),
(5,"Kobe Bryant","basquete","5");

SELECT * FROM atleta;
SHOW TABLES;
-- Atualizando os dados de medalhas do atleta com id específico
UPDATE atleta SET qtd_medalha = "10" WHERE id_atleta=1;
SELECT * FROM atleta;

UPDATE atleta SET qtd_medalha= "7" WHERE id_atleta IN(2,3);
SELECT * FROM atleta;
-- Atualizando o Nome
UPDATE atleta SET nome="Ney" WHERE id_atleta=4;
SELECT * FROM atleta;
-- Adicionando uma nova coluna a tabela
ALTER TABLE atleta ADD COLUMN dt_nascimento DATE;
-- Atualizando os dados de nascimentos
UPDATE atleta SET dt_nascimento="2007-11-29" WHERE id_atleta IN(1,5);
UPDATE atleta SET dt_nascimento="1985-02-05" WHERE id_atleta=2;
UPDATE atleta SET dt_nascimento="1992-02-05" WHERE id_atleta=4;
UPDATE atleta SET dt_nascimento="1940-10-23" WHERE id_atleta=3;
-- Atualizando de TODOS  ao mesmo tempo
UPDATE atleta SET dt_nascimento="2007-11-29" WHERE id_atleta IN (1,2,3,4,5);
SELECT * FROM atleta;
-- Deletando apenas 1 dado
DELETE FROM atleta WHERE id_atleta=5;

SELECT * FROM atleta WHERE modalidade <> 'natação';

SELECT * FROM atleta WHERE qtd_medalha>=8;
-- Alterando a estrutura da coluna
ALTER TABLE atleta MODIFY COLUMN modalidade VARCHAR(50);
ALTER TABLE atleta MODIFY COLUMN nome VARCHAR (40);
DESCRIBE atleta;
-- Esvaziando os dados da tabela inteira 
TRUNCATE atleta;
SELECT * FROM atleta;

-- EXERCÍCIO 2 --
USE sprint1;

CREATE TABLE musica(
id_musica INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR (40),
artista VARCHAR (40),
genero VARCHAR (40)
);
INSERT INTO musica VALUES
(1,"ADRENALINA","M4RKIM","RAP"),
(2,"DIVINA COMÉDIA","FÁBIO BRAZA","RAP"),
(3,"SUCK MY KISS","RHCP","ROCK"),
(4,"SENHOR DO TEMPO","CBJR","ROCK"),
(5,"NO PASSO A PASSO","CBJR","ROCK"),
(6,"HIGWAY TO HELL","ACDC","ROCK"),
(7,"PIRATA E TESOURO","FERRUGEM","PAGODE");
SELECT * FROM musica;

ALTER TABLE musica ADD COLUMN curtidas INT;
UPDATE musica SET curtidas=67 WHERE id_musica=6;
UPDATE musica SET curtidas=200000000 WHERE id_musica=5;
UPDATE musica SET curtidas=540 WHERE id_musica=1;
UPDATE musica SET curtidas=983 WHERE id_musica=2;
UPDATE musica SET curtidas=1234567890 WHERE id_musica=3;
UPDATE musica SET curtidas=987654321 WHERE id_musica=4;
UPDATE musica SET curtidas= 26380 WHERE id_musica=7;
SELECT * FROM musica;

-- Modificar o campo artista do tamanho 40 para o tamanho 80.
ALTER TABLE musica MODIFY COLUMN artista VARCHAR (80);
DESC TABLE musica;

-- Atualizar a quantidade de curtidas da música com id=1.
UPDATE musica SET curtidas= 1080 WHERE id_musica=1;

-- Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3.
UPDATE musica SET curtidas= 777 WHERE id_musica IN (2,3);
SELECT * FROM musica;

-- Atualizar o nome da música com o id=5.
UPDATE musica SET titulo="Dias de luta, dias de glória" WHERE id_musica=5;

-- Excluir a música com o id=4.
DELETE FROM musica WHERE id_musica=4;

-- Exibir as músicas onde o gênero é diferente de funk.
SELECT * FROM musica WHERE genero<>"funk";

-- Exibir os dados das músicas que têm curtidas maior ou igual a 20.
SELECT * FROM musica;
SELECT * FROM musica WHERE curtidas>=200;

-- Descrever os campos da tabela mostrando a atualização do campo artista.
DESC musica;
ALTER TABLE musica MODIFY COLUMN artista VARCHAR (100);
DESCRIBE musica;

-- Limpar os dados da tabela.
TRUNCATE musica;
SELECT * FROM musica;


-- EXERCÍCIO 3 
/* Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50),
 genero (tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
*/
USE sprint1;
CREATE TABLE filme(
id_filme INT PRIMARY KEY,
titulo VARCHAR (50),
genero VARCHAR (40),
diretor VARCHAR (40)
);

INSERT INTO filme VALUES
(1,"O Espetacular homem-aranha","Ficção","Andrew Garfield"),
(2,"Ainda Estou Aqui","Drama","Walter Sales"),
(3,"Pecadores","Terror","Ryan Coogler"),
(4,"Creed","Ação","Ryan Coogler"),
(5,"Gente Grande","Comédia","Adam Sandler"),
(6,"Vingadores","Ficção","Joss Whedon"),
(7,"Como se fosse a primeira vez","Comédia","Adam Sandler");

-- Exibir todos os dados da tabela.
SELECT * FROM filme;
DESC filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela.
ALTER TABLE filme ADD COLUMN protagonista VARCHAR (50);
DESC filme;
SELECT * FROM filme;

-- Atualizar o campo protagonista de todos os filmes inseridos.
UPDATE filme SET protagonista = "Michael B Jordan" WHERE id_filme IN (3,4);
UPDATE filmE SET protagonista = "Adam Sandler" WHERE id_filme IN (5,7);
UPDATE filme SET protagonista = "Fernanda Torres" WHERE id_filme = 2;
UPDATE filme SET protagonista = "Andrew Garfield" WHERE id_filme = 1;
UPDATE filme SET protagonista = "Robert Downey Jr" WHERE id_filme = 6;
SELECT * FROM filme;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150.
ALTER TABLE filme MODIFY COLUMN diretor VARCHAR (150);
DESC filme;

-- Atualizar o diretor do filme com id=5.
UPDATE filme SET diretor = "Kevin James" WHERE id_filme = 5;

-- Atualizar o diretor dos filmes com id=2 e com o id=7.
UPDATE filme SET diretor = "Selton Melo" WHERE id_filme = 2;
UPDATE filme SET diretor = "Kevin James" WHERE id_filme = 7;

-- Atualizar o título do filme com o id=6.
SELECT * FROM filme;
UPDATE filme SET titulo = "Ultimato" WHERE id_filme = 6;

-- Excluir o filme com o id=3.
DELETE FROM filme WHERE id_filme = 3;
SELECT * FROM filme;

-- Exibir os filmes em que o gênero é diferente de drama.
SELECT * FROM filme WHERE genero <> "terror";

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’.
SELECT * FROM filme WHERE genero = "suspense";

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor.
DESC filme;

-- Limpar os dados da tabela.
TRUNCATE filme;



-- EXERCÍCIO 4 
USE sprint1;
CREATE TABLE PROFESSOR(
ID INT PRIMARY KEY,
NOME VARCHAR (50),
ESPECIALIDADE VARCHAR (40),
DTNASC CHAR (10)
);

INSERT INTO PROFESSOR VALUES
(1,'RAIMUNDO','MULTIDISCIPLINAR','1960-12-29'),
(2,'MANOEL','LITERATURA','1983-03-19'),
(3,'MARCOS','FISICA','1977-11-01'),
(4,'HELENA','GEOGRAFIA','1956-03-25'),
(5,'FABIANA', 'GEOGRAFIA','2000-09-01'),
(6,'FRIZZA','ALGORITMO','1980-02-13');

-- Exibir todos os dados da tabela.
SELECT * FROM PROFESSOR;

-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’.
ALTER TABLE PROFESSOR ADD COLUMN FUNCAO VARCHAR (50);

-- Atualizar os professores inseridos e suas respectivas funções.
UPDATE PROFESSOR SET FUNCAO = "TITULAR" WHERE ID IN(2,4,6);
UPDATE PROFESSOR SET FUNCAO = "MONITOR" WHERE ID IN(1,3);
UPDATE PROFESSOR SET FUNCAO = "ASSISTENTE" WHERE ID IN(5);

-- Inserir um novo professor.
INSERT INTO PROFESSOR VALUES
(7,"JIRAYA","PORTUGUES","1890-12-26","ASSISTENTE");

-- Excluir o professor onde o idProfessor é igual a 5.
DELETE FROM PROFESSOR WHERE ID=5;
SELECT * FROM PROFESSOR;

-- Exibir apenas os nomes dos professores titulares.
SELECT NOME FROM PROFESSOR WHERE FUNCAO="TITULAR";

-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores.
SELECT ESPECIALIDADE, DTNASC FROM PROFESSOR WHERE FUNCAO="MONITOR";

-- Atualizar a data de nascimento do idProfessor igual a 3.
UPDATE PROFESSOR SET DTNASC="2007-11-29" WHERE ID=3;

-- Limpar a tabela Professor.
TRUNCATE PROFESSOR;


-- EXERCÍCIO 5 
USE sprint1;
CREATE TABLE curso(
id INT PRIMARY KEY,
nome VARCHAR (50),
sigla VARCHAR (3),
cordenador VARCHAR (40)
);

INSERT INTO curso VALUES
(1,"Ciências da computação","CCO","Marisa"),
(2,"Anasilise e Desenvolvimento de Sistemas","ADS","Bill Gates"),
(3,"Sistemas de Informação","SIS","Steve Jobs"),
(4,"Engenharia de Software","ES","Elon Musk");

SELECT * FROM curso;

-- Exibir apenas os coordenadores dos cursos.
SELECT cordenador FROM curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM curso WHERE sigla="CCO";

-- Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM curso ORDER BY nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT * FROM curso ORDER BY cordenador DESC;

-- Exibir os dados da tabela dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM curso WHERE nome LIKE "A%";

-- Exibir os dados da tabela dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM curso WHERE nome like "%o";

-- Exibir os dados da tabela dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM curso WHERE nome like "_n%";

-- Exibir os dados da tabela dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM curso WHERE nome like "%r_";

-- Elimine a tabela.
TRUNCATE curso; 
