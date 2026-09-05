CREATE DATABASE sprint1;
USE sprint1;
-- TABELA
CREATE TABLE Atleta(
id INT PRIMARY KEY,
nome VARCHAR (40),
modalidade VARCHAR (40),
qtdMedalha INT
);
-- Inserir os atletas
INSERT INTO Atleta VALUES
(67, 'Ayrton Senna', 'F1', 3),
(68, 'Lewis Hamilton', 'F1', '7'),
(69, 'Pelé', 'futebol', 3),
(70, 'Neymar', 'futebol', 0),
(71, 'Raysa Leal', 'Skate', 90),
(96, 'Tony Hawk', 'Skate', 0),
(13, 'Cristiano Ronaldo', 'futebol', 36);

select id, nome, modalidade, qtdMedalha FROM Atleta;

SELECT nome, qtdMedalha FROM Atleta;

SELECT * FROM Atleta WHERE modalidade = 'futebol';

SELECT * FROM Atleta ORDER BY modalidade;

SELECT * FROM Atleta ORDER BY qtdMedalha DESC;

SELECT * FROM Atleta WHERE nome LIKE '%S%';

SELECT * FROM Atleta WHERE nome LIKE 'P%';

SELECT * FROM Atleta WHERE nome LIKE '%O';

SELECT * FROM Atleta WHERE nome LIKE '%R_';