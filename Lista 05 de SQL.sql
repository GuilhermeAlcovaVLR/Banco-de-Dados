CREATE DATABASE lista5;
USE lista5;

CREATE TABLE pessoa(
idpessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45), 
cpf CHAR (11)
);


CREATE TABLE reserva(
idReserva INT PRIMARY KEY auto_increment,
dtReserva DATETIME,	
dtRetirada DATETIME,
dtDevolucao DATETIME,
fk_pessoa INT,
CONSTRAINT chkPessoa FOREIGN KEY (fk_pessoa)
REFERENCES pessoa (idpessoa)
);

INSERT INTO pessoa (nome, cpf) VALUES 
('Ana Souza', '12345678901'),
('Carlos Eduardo', '23456789012'),
('Beatriz Santos', '34567890123'),
('Ricardo Lima', '45678901234'),
('Mariana Costa', '56789012345');

INSERT INTO reserva (dtReserva, dtRetirada, dtDevolucao, fk_pessoa) VALUES 
('2026-09-01 10:00:00', '2026-09-02 08:00:00', '2026-09-05 18:00:00', 1),
('2026-09-02 14:30:00', '2026-09-03 09:00:00', '2026-09-10 09:00:00', 2),
('2026-09-03 11:15:00', '2026-09-03 12:00:00', '2026-09-04 12:00:00', 3),
('2026-09-05 16:00:00', '2026-09-06 10:00:00', '2026-09-13 10:00:00', 4),
('2026-09-06 09:00:00', '2026-09-07 07:00:00', '2026-09-09 17:00:00', 5);

SELECT * FROM reserva JOIN pessoa ON pessoa.idpessoa = reserva.idReserva;

SELECT dtReserva AS "Data da reserva", dtRetirada AS "Data da retirada", dtDevolucao AS "Data da devolução", 
fk_pessoa AS "Chave estrangeira", idpessoa AS "Identificação", nome, cpf AS "CPF" 
 FROM reserva JOIN pessoa ON pessoa.idpessoa = reserva.idReserva;

SELECT *,
CASE
WHEN dtReserva > "2026-09-03 10:00:00" THEN "Recente"
ELSE "Antigo"
END AS "Tempo de reserva"
FROM reserva JOIN pessoa ON pessoa.idpessoa = reserva.idReserva;




INSERT INTO pessoa (nome, cpf) VALUES 
('Richard Laranja', '62348901234');
INSERT INTO reserva (dtReserva, dtRetirada, dtDevolucao, fk_pessoa) VALUES 
('2026-09-05 16:00:00', '2026-09-06 10:00:00', NULL, 4);

SELECT *, IFNULL(dtDevolucao, "Não devolvido") AS "Data de devolução" FROM reserva 
JOIN pessoa ON pessoa.idpessoa = reserva.idReserva;




-- EXERCÍCIO 2 
CREATE TABLE pessoa1(
idpessoa1 INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45), 
cpf CHAR (11)
);

CREATE TABLE Pessoa2 (
idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNascimento DATE,
fkPessoa1 INT
);

INSERT INTO pessoa1 (nome, cpf) VALUES
('Carlos Silva', '12345678901'),
('Ana Souza', '98765432100'),
('Marcos Oliveira', '11122233344'),
('Julia Lima', '44455566677'),
('Roberto Costa', '88899900011');

INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES
('Carlos Silva Filho', '2010-05-15', 1),
('Beatriz Souza', '2015-08-20', 2),
('Mariana Oliveira', '2008-11-02', 3),
('Gabriel Lima', '2012-03-30', 4),
('Lucas Costa', '2014-07-12', 5);

ALTER TABLE Pessoa2 ADD CONSTRAINT fkpessoa1 FOREIGN KEY (fkPessoa1)
REFERENCES pessoa1(idpessoa1);
SELECT * FROM pessoa1 JOIN pessoa2 ON pessoa1.idpessoa1 = Pessoa2.fkPessoa1;

SELECT *, dtNascimento AS "Nascimento" FROM pessoa1 JOIN pessoa2 ON pessoa1.idpessoa1 = Pessoa2.fkPessoa1;

SELECT *,
CASE 
WHEN dtNascimento > "2010-05-15" THEN "Adolescente"
ELSE "Idoso"
END AS "idade"
FROM pessoa1 JOIN pessoa2 ON pessoa1.idpessoa1 = Pessoa2.fkPessoa1;


SELECT *, IFNULL(cpf, "Registro não encontrado") FROM pessoa1 JOIN pessoa2 ON pessoa1.idpessoa1 = Pessoa2.fkPessoa1;



-- Exercício 3


CREATE TABLE candidato (
    idCandidato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    categoria_pretendida VARCHAR(15) 
);

CREATE TABLE cnh_provisoria (
    idCNH INT PRIMARY KEY AUTO_INCREMENT,
    numero_registro VARCHAR(11) UNIQUE,
    data_emissao DATE,
    validade_anos INT DEFAULT 1,
    status_processo VARCHAR(20) DEFAULT 'Em Andamento',
    fkCandidato INT UNIQUE NOT NULL,
    CONSTRAINT fk_candidato_cnh FOREIGN KEY (fkCandidato) 
        REFERENCES candidato(idCandidato)
);

 INSERT INTO candidato (nome, cpf, categoria_pretendida) VALUES
('Ana Silva', '12345678901', 'AB'),
('Bruno Santos', '98765432100', 'B'),
('Carla Oliveira', '45678912300', 'A'),
('Diego Souza', '32165498700', 'B'),
('Elena Lima', '65498732100', 'AB');

INSERT INTO cnh_provisoria (numero_registro, data_emissao, status_processo, fkCandidato) VALUES
('10000000001', '2026-01-15', 'Aprovado', 1),
('10000000002', '2026-03-10', 'Aprovado', 2),
(NULL, NULL, 'Em Andamento', 3),
('10000000004', '2026-05-20', 'Aprovado', 4),
(NULL, NULL, 'Reprovado', 5);

 SELECT * 
FROM candidato 
JOIN cnh_provisoria ON idCandidato = p.fkCandidato;

 SELECT 
nome AS 'Nome do Candidato',
cpf AS 'CPF',
categoria_pretendida AS 'Categoria',
numero_registro AS 'Nº CNH Provisória',
status_processo AS 'Status'
FROM candidato 
LEFT JOIN cnh_provisoria ON idCandidato = fkCandidato;


SELECT 
nome AS 'Candidato',
status_processo AS 'Situação',
CASE 
WHEN status_processo = 'Aprovado' THEN 'Habilitação Liberada (Válida por 1 ano)'
WHEN status_processo = 'Em Andamento' THEN 'Aguardando Exames/Aulas'
ELSE 'Processo Encerrado / Refazer'
END AS 'Resultado Final'
FROM candidato 
LEFT JOIN cnh_provisoria ON idCandidato = fkCandidato;

 SELECT 
nome AS 'Candidato',
IFNULL(numero_registro, 'Documento Não Emitido') AS 'Registro CNH',
IFNULL(DATE_FORMAT(data_emissao, '%d/%m/%Y'), 'Sem Data') AS 'Data de Emissão'
FROM candidato 
LEFT JOIN cnh_provisoria ON idCandidato = fkCandidato;


-- EXERCÍCIO 4
CREATE TABLE endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
logradouro VARCHAR(100) NOT NULL,
numero VARCHAR(10) NOT NULL,
bairro VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
cep CHAR(8) NOT NULL
);

CREATE TABLE farmacia (
idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
nome_fantasia VARCHAR(100) NOT NULL,
cnpj CHAR(14) UNIQUE NOT NULL,
telefone VARCHAR(15),
fkEndereco INT UNIQUE NOT NULL,
CONSTRAINT fk_farmacia_endereco FOREIGN KEY (fkEndereco) 
REFERENCES endereco(idEndereco)
);

CREATE TABLE farmaceutico (
idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
crf VARCHAR(15) UNIQUE NOT NULL,
salario DECIMAL(10,2),
fkFarmacia INT NOT NULL,
CONSTRAINT fk_farmaceutico_farmacia FOREIGN KEY (fkFarmacia) 
REFERENCES farmacia(idFarmacia)
);
        
INSERT INTO endereco (logradouro, numero, bairro, cidade, cep) VALUES
('Av. Paulista', '1000', 'Bela Vista', 'São Paulo', '01310100'),
('Rua Augusta', '500', 'Consolação', 'São Paulo', '01305000'),
('Av. Brigadeiro Faria Lima', '1500', 'Itaim Bibi', 'São Paulo', '01452001'),
('Rua Domingos de Morais', '200', 'Vila Mariana', 'São Paulo', '04010000'),
('Av. Rebouças', '3000', 'Pinheiros', 'São Paulo', '05402000');

INSERT INTO farmacia (nome_fantasia, cnpj, telefone, fkEndereco) VALUES
('Drogaria São Paulo - Paulista', '12345678000101', '11987654321', 1),
('Drogasil - Augusta', '12345678000102', '11987654322', 2),
('Farmácia Pague Menos - Faria Lima', '12345678000103', '11987654323', 3),
('Drogaria Ultrafarma - Vila Mariana', '12345678000104', '11987654324', 4),
('Farmácia Extrafarma - Pinheiros', '12345678000105', '11987654325', 5);

INSERT INTO farmaceutico (nome, crf, salario, fkFarmacia) VALUES
('Carlos Eduardo', 'CRF-SP12345', 4500.00, 1),
('Mariana Souza', 'CRF-SP23456', 5200.00, 1),
('Roberto Alves', 'CRF-SP34567', 4800.00, 2),
('Fernanda Costa', 'CRF-SP45678', NULL, 3),
('Lucas Martins', 'CRF-SP56789', 5100.00, 4);

SELECT * 
FROM farmacia 
JOIN endereco ON fkEndereco = idEndereco
JOIN farmaceutico fm ON fkFarmacia = idFarmacia;

SELECT 
nome_fantasia AS 'Nome da Farmácia',
CONCAT(logradouro, ', ', numero) AS 'Endereço',
nome AS 'Farmacêutico Responsável',
crf AS 'Registro CRF'
FROM farmacia 
JOIN endereco ON fkEndereco = idEndereco
LEFT JOIN farmaceutico ON fkFarmacia = idFarmacia;

 
 SELECT 
nome AS 'Farmacêutico',
nome_fantasia AS 'Farmácia',
salario AS 'Salário Base',
CASE 
WHEN salario >= 5000 THEN 'Sênior / Supervisor'
WHEN salario < 5000 THEN 'Pleno'
ELSE 'Salário Não Cadastrado'
END AS 'Categoria Salarial'
FROM farmaceutico
JOIN farmacia ON fkFarmacia = idFarmacia;

SELECT 
nome AS 'Farmacêutico',
crf AS 'CRF',
IFNULL(salario, 0.00) AS 'Salário R$',
IFNULL(telefone, 'Telefone Não Informado') AS 'Contato Farmácia'
FROM farmaceutico 
RIGHT JOIN farmacia ON fkFarmacia = idFarmacia;
	

