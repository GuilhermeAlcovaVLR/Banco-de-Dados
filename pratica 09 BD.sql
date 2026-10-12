
CREATE DATABASE sprint2;
USE sprint2;


CREATE TABLE publico_alvo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE colecao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    fk_publico_alvo INT NOT NULL,
    FOREIGN KEY (fk_publico_alvo) REFERENCES publico_alvo(id)
);

CREATE TABLE livro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    ano_publicacao INT NOT NULL,
    num_paginas INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    situacao VARCHAR(30) NOT NULL,
    fk_colecao INT NOT NULL,
    FOREIGN KEY (fk_colecao) REFERENCES colecao(id)
);

INSERT INTO publico_alvo (descricao) VALUES 
('Infantil'),
('Jovem Adulto'),
('Geral / Acadêmico');

INSERT INTO colecao (nome, fk_publico_alvo) VALUES 
('Contos de Fadas', 1),   
('Fábulas Animadas', 1),  
('Distopias Modernas', 2),
('Clássicos de Terror', 3);

INSERT INTO livro (titulo, ano_publicacao, num_paginas, preco, situacao, fk_colecao) VALUES 
('Chapeuzinho Vermelho', 2020, 32, 29.90, 'Disponível', 1),    
('Cinderela', 2021, 40, 34.90, 'Disponível', 1),               
('O Leão e o Rato', 2019, 24, 19.90, 'Esgotado', 2),           
('Frankenstein', 2018, 280, 45.00, 'Disponível', 4),           
('Drácula', 2017, 416, 49.90, 'Disponível', 4);    

SELECT * FROM livro;

SELECT l.titulo AS Livro, c.nome AS Colecao, p.descricao AS Publico_Alvo
FROM livro l
JOIN colecao c ON l.fk_colecao = c.id
JOIN publico_alvo p ON c.fk_publico_alvo = p.id;

SELECT DISTINCT c.nome AS Colecao
FROM colecao c
JOIN publico_alvo p ON c.fk_publico_alvo = p.id
WHERE p.descricao = 'Infantil';

SELECT * FROM livro
WHERE ano_publicacao > 2020
ORDER BY ano_publicacao DESC
LIMIT 3;

SELECT * FROM livro
WHERE preco BETWEEN 40.00 AND 80.00;

SELECT titulo, num_paginas,
    CASE 
        WHEN num_paginas <= 200 THEN 'Pequeno'
        WHEN num_paginas BETWEEN 201 AND 400 THEN 'Médio'
        ELSE 'Nem leio'
    END AS classificacao_tamanho
FROM livro;

UPDATE livro SET preco = 49.90 WHERE id = 1;

DELETE FROM livro WHERE id = 5;



CREATE TABLE area_atuacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE equipe (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    fk_area INT NOT NULL,
    FOREIGN KEY (fk_area) REFERENCES area_atuacao(id)
);

CREATE TABLE funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    fk_equipe INT NOT NULL,
    fk_mentor INT,
    FOREIGN KEY (fk_equipe) REFERENCES equipe(id),
    FOREIGN KEY (fk_mentor) REFERENCES funcionario(id)
);

INSERT INTO area_atuacao (nome) VALUES 
('Tecnologia da Informação'),
('Recursos Humanos'),
('Marketing e Vendas');

INSERT INTO equipe (nome, fk_area) VALUES 
('Desenvolvimento Backend', 1),
('Segurança da Informação', 1),
('Recrutamento e Seleção', 2),
('Growth Marketing', 3);


INSERT INTO funcionario (nome, email, data_admissao, salario, fk_equipe, fk_mentor) VALUES 
('Carlos Silva', 'carlos.silva@empresa.com', '2021-03-15', 8500.00, 1, NULL),       
('Ana Souza', 'ana.souza@empresa.com', '2022-01-10', 7000.00, 3, NULL),          
('Bruno Costa', 'bruno.costa@empresa.com', '2024-06-01', 4500.00, 1, 1),       
('Diana Rocha', 'diana.rocha@empresa.com', '2025-02-18', 4800.00, 2, 1),       
('Eduardo Lima', 'eduardo.lima@empresa.com', '2025-08-20', 4200.00, 4, NULL),  
('Fernanda Alves', 'fernanda.alves@empresa.com', '2026-03-02', 5200.00, 4, 2); 

SELECT f.nome AS Funcionario, e.nome AS Equipe, a.nome AS Area
FROM funcionario f
JOIN equipe e ON f.fk_equipe = e.id
JOIN area_atuacao a ON e.fk_area = a.id;

SELECT f.nome AS Funcionario, m.nome AS Mentor
FROM funcionario f
JOIN funcionario m ON f.fk_mentor = m.id;

SELECT f.nome AS Funcionario, a.nome AS Area
FROM funcionario f
JOIN equipe e ON f.fk_equipe = e.id
JOIN area_atuacao a ON e.fk_area = a.id
WHERE a.nome IN ('Tecnologia da informaçãp', 'Recursos Humanos');

SELECT f.nome, f.data_admissao, e.nome AS Equipe, a.nome AS Area
FROM funcionario f
JOIN equipe e ON f.fk_equipe = e.id
JOIN area_atuacao a ON e.fk_area = a.id
WHERE f.data_admissao > '2023-01-01'
ORDER BY f.data_admissao DESC
LIMIT 3;

SELECT f.nome AS Orientado
FROM funcionario f
JOIN funcionario m ON f.fk_mentor = m.id
WHERE m.nome = 'Carlos Silva';

SELECT DISTINCT m.nome AS Mentor
FROM funcionario f
JOIN funcionario m ON f.fk_mentor = m.id
WHERE m.nome LIKE 'C%';

DELETE FROM funcionario WHERE id = 6;



CREATE TABLE curso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    carga_horaria INT NOT NULL
);

CREATE TABLE turno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL,
    data_inicio DATE NOT NULL,
    fk_curso INT NOT NULL,
    fk_turno INT NOT NULL,
    FOREIGN KEY (fk_curso) REFERENCES curso(id),
    FOREIGN KEY (fk_turno) REFERENCES turno(id)
);

CREATE TABLE status_matricula (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL
);

CREATE TABLE aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ra VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    fk_turma INT,
    fk_status INT NOT NULL,
    FOREIGN KEY (fk_turma) REFERENCES turma(id),
    FOREIGN KEY (fk_status) REFERENCES status_matricula(id)
);

INSERT INTO curso (nome, carga_horaria) VALUES 
('Desenvolvimento de Sistemas', 1200),
('Administração', 800),
('Redes de Computadores', 1000);

INSERT INTO turno (nome) VALUES 
('Manhã'),
('Tarde'),
('Noite');

INSERT INTO turma (codigo, data_inicio, fk_curso, fk_turno) VALUES 
('DS-2026-N', '2026-02-10', 1, 3),
('ADM-2026-M', '2026-02-15', 2, 1),
('DS-2026-T', '2026-03-01', 1, 2),
('RC-2026-N', '2026-03-05', 3, 3);

INSERT INTO status_matricula (descricao) VALUES 
('Ativo'),
('Trancado'),
('Concluído');

INSERT INTO aluno (ra, nome, email, data_nascimento, fk_turma, fk_status) VALUES 
('RA001', 'Carlos Silva', 'carlos@email.com', '2005-04-12', 1, 1),
('RA002', 'Ana Souza', 'ana@email.com', '2004-08-22', 1, 1),
('RA003', 'Bruno Costa', 'bruno@email.com', '2006-01-15', 1, 2),
('RA004', 'Mariana Lima', 'mariana@email.com', '2003-11-30', 1, 3),
('RA005', 'Diego Rocha', 'diego@email.com', '2005-07-19', 2, 1),
('RA006', 'Beatriz Alves', 'beatriz@email.com', '2004-05-14', 2, 2),
('RA007', 'Fernanda Dias', 'fernanda@email.com', '2005-12-01', 3, 1);

SELECT DISTINCT t.nome AS Turno
FROM turno t
JOIN turma tu ON t.id = tu.fk_turno;

SELECT a.nome, a.ra, tu.codigo AS Turma, c.nome AS Curso, sm.descricao AS Status
FROM aluno a
LEFT JOIN turma tu ON a.fk_turma = tu.id
LEFT JOIN curso c ON tu.fk_curso = c.id
JOIN status_matricula sm ON a.fk_status = sm.id;

SELECT a.nome, tu.codigo AS Turma, c.nome AS Curso
FROM aluno a
JOIN turma tu ON a.fk_turma = tu.id
JOIN curso c ON tu.fk_curso = c.id
WHERE c.nome = 'Desenvolvimento de Sistemas'
LIMIT 5;

SELECT a.nome, sm.descricao AS Status
FROM aluno a
JOIN status_matricula sm ON a.fk_status = sm.id
WHERE sm.descricao = 'Ativo';

SELECT c.nome AS Curso, tu.codigo AS Turma
FROM curso c
LEFT JOIN turma tu ON c.id = tu.fk_curso;

SELECT tu.codigo AS Turma, a.nome AS Aluno
FROM turma tu
LEFT JOIN aluno a ON tu.id = a.fk_turma;

SELECT c.nome AS Curso, tu.codigo AS Turma, a.nome AS Aluno
FROM curso c
LEFT JOIN turma tu ON c.id = tu.fk_curso
LEFT JOIN aluno a ON tu.id = a.fk_turma;

SELECT 
    a.nome AS Aluno, 
    tu.codigo AS Turma, 
    DATE_FORMAT(tu.data_inicio, '%d/%m/%Y') AS Data_Inicio,
    DATEDIFF(NOW(), tu.data_inicio) AS Dias_Decorridos,
    CASE 
        WHEN DATEDIFF(NOW(), tu.data_inicio) <= 120 THEN 'Calouros'
        WHEN DATEDIFF(NOW(), tu.data_inicio) BETWEEN 121 AND 240 THEN 'Turma Intermediária'
        ELSE 'Veteranos'
    END AS Faixa_Tempo
FROM aluno a
JOIN turma tu ON a.fk_turma = tu.id;




CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE status_chamado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE chamado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_abertura DATE NOT NULL,
    fk_categoria INT NOT NULL,
    fk_status INT NOT NULL,
    FOREIGN KEY (fk_categoria) REFERENCES categoria(id),
    FOREIGN KEY (fk_status) REFERENCES status_chamado(id)
);

INSERT INTO categoria (nome) VALUES
('Hardware'),
('Software'),
('Redes');
INSERT INTO status_chamado (descricao) VALUES
('Aberto'),
('Em Atendimento'),
('Resolvido');
INSERT INTO chamado (titulo, descricao, data_abertura, fk_categoria, fk_status) VALUES
('Computador não liga', 'O computador da recepção não dá sinal de vida após queda de energia.', '2026-10-01', 1, 1),
('Erro ao abrir o ERP', 'O sistema principal exibe erro de conexão com o banco de dados ao iniciar.', '2026-10-02', 2, 2),
('Wi-Fi lento na sala de reuniões', 'Sinal instável e velocidade abaixo do contratado durante videoconferências.', '2026-10-03', 3, 1),
('Troca de mouse quebrado', 'O botão esquerdo do mouse do setor financeiro parou de funcionar.', '2026-10-04', 1, 3),
('Atualização do Antivírus', 'Necessário homologar a nova versão do agente de segurança nos servidores.', '2026-10-05', 2, 2),
('Instalação de ponto de rede', 'Solicitação de novo cabeamento para a mesa do novo colaborador de RH.', '2026-10-06', 3, 3);

CREATE USER 'atendente_suporte'@'localhost' IDENTIFIED BY 'Atende@2026';
CREATE USER 'analista_suporte'@'localhost' IDENTIFIED BY 'Analista@2026';
CREATE USER 'gestor_suporte'@'localhost' IDENTIFIED BY 'Gestor@2026';

GRANT SELECT ON suporte_dcl.categoria TO 'atendente_suporte'@'localhost';
GRANT SELECT ON suporte_dcl.status_chamado TO 'atendente_suporte'@'localhost';
GRANT SELECT, INSERT, UPDATE ON suporte_dcl.chamado TO 'atendente_suporte'@'localhost';

GRANT SELECT ON suporte_dcl.categoria TO 'analista_suporte'@'localhost';
GRANT SELECT ON suporte_dcl.status_chamado TO 'analista_suporte'@'localhost';
GRANT SELECT ON suporte_dcl.chamado TO 'analista_suporte'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON suporte_dcl.categoria TO 'gestor_suporte'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON suporte_dcl.status_chamado TO 'gestor_suporte'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON suporte_dcl.chamado TO 'gestor_suporte'@'localhost';

SHOW GRANTS FOR 'atendente_suporte'@'localhost';
SHOW GRANTS FOR 'analista_suporte'@'localhost';
SHOW GRANTS FOR 'gestor_suporte'@'localhost';

REVOKE UPDATE ON suporte_dcl.chamado FROM 'atendente_suporte'@'localhost';

SHOW GRANTS FOR 'atendente_suporte'@'localhost';
