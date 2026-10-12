CREATE DATABASE prática_6;
USE prática_6;

CREATE TABLE autor(
id_autor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (145) NOT NULL
);


CREATE TABLE livros(
id_livros INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR (145) NOT NULL,
genero VARCHAR (145),
ano_publicacao DATE,
fk_autor INT,
CONSTRAINT cfkAutor FOREIGN KEY (fk_autor) REFERENCES autor (id_autor)
);

INSERT INTO autor (nome) VALUES 
('Machado de Assis'),
('George Orwell'),
('Clarice Lispector'),
('J.R.R. Tolkien');

 INSERT INTO livros (titulo, genero, ano_publicacao, fk_autor) VALUES 
('Dom Casmurro', 'Romance', '1899-01-01', 1),
('Memórias Póstumas de Brás Cubas', 'Realismo', '1881-01-01', 1),
('1984', 'Ficção Distópica', '1949-06-08', 2),
('A Revolução dos Bichos', 'Sátira Política', '1945-08-17', 2),
('A Hora da Estrela', 'Romance', '1977-10-26', 3),
('Perto do Coração Selvagem', 'Romance', '1943-12-01', 3),
('O Hobbit', 'Fantasia', '1937-09-21', 4),
('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', '1954-07-29', 4);

SELECT
   autor.nome AS 'AUTOR',
   livros.titulo AS 'TÍTULO',
   livros.genero AS 'GÊNERO',
   livros.ano_publicacao AS 'ANO DE PUBLICAÇÃO'
   FROM autor
   JOIN livros
   ON id_autor = fk_autor;
   
SELECT
   autor.nome AS 'AUTOR',
   livros.titulo AS 'TÍTULO',
   livros.genero AS 'GÊNERO',
   livros.ano_publicacao AS 'ANO DE PUBLICAÇÃO'
   FROM autor
   JOIN livros
   ON id_autor = fk_autor WHERE livros.ano_publicacao > '1940-01-01';
   
SELECT
   autor.nome AS 'AUTOR',
   livros.titulo AS 'TÍTULO',
   livros.genero AS 'GÊNERO',
   livros.ano_publicacao AS 'ANO DE PUBLICAÇÃO'
   FROM autor
   JOIN livros
   ON id_autor = fk_autor ORDER BY ano_publicacao DESC;
   

-- Exercício 2 — Escola de tecnologia
CREATE TABLE curso(
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (145),
área VARCHAR (45),
duracao INT
);

CREATE TABLE aluno(
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
ra INT,
nome VARCHAR (100),
email VARCHAR (100) UNIQUE,
semestre INT,
fk_curso INT,
CONSTRAINT cfkCurso FOREIGN KEY (fk_curso)
REFERENCES curso (id_curso)
);

INSERT INTO curso (nome, área, duracao) VALUES 
('Análise e Desenvolvimento de Sistemas', 'Tecnologia', 5),
('Administração de Empresas', 'Negócios', 8),
('Engenharia de Software', 'Tecnologia', 10);

INSERT INTO aluno (ra, nome, email, semestre, fk_curso) VALUES 
(1001, 'Ana Silva', 'ana.silva@email.com', 1, 1),
(1002, 'Bruno Souza', 'bruno.souza@email.com', 3, 1),
(1003, 'Carlos Oliveira', 'carlos.oliveira@email.com', 5, 1),
(1004, 'Daniela Lima', 'daniela.lima@email.com', 2, 2),
(1005, 'Eduardo Santos', 'eduardo.santos@email.com', 4, 2),
(1006, 'Fernanda Costa', 'fernanda.costa@email.com', 6, 2),
(1007, 'Gabriel Almeida', 'gabriel.almeida@email.com', 1, 3),
(1008, 'Amanda Martins', 'amanda.martins@email.com', 3, 3),
(1009, 'Igor Pereira', 'igor.pereira@email.com', 7, 3),
(1010, 'Julia Rodrigues', 'julia.rodrigues@email.com', 2, 1);

SELECT
    aluno.ra AS 'RA',
    aluno.nome AS 'Aluno',
    aluno.email AS 'e-mail',
    aluno.semestre AS 'Semestre',
    curso.nome AS 'Curso',
    curso.área AS 'Área'
    FROM aluno
    JOIN curso
    ON aluno.fk_curso = curso.id_curso;
    
SELECT
    aluno.ra AS 'RA',
    aluno.nome AS 'Aluno',
    aluno.email AS 'e-mail',
    aluno.semestre AS 'Semestre',
    curso.nome AS 'Curso',
    curso.área AS 'Área'
    FROM aluno
    JOIN curso
    ON aluno.fk_curso = curso.id_curso 
    WHERE aluno.nome LIKE 'A%';

SELECT
    aluno.ra AS 'RA',
    aluno.nome AS 'Aluno',
    aluno.email AS 'e-mail',
    aluno.semestre AS 'Semestre',
    curso.nome AS 'Curso',
    curso.área AS 'Área'
    FROM aluno
    JOIN curso
    ON aluno.fk_curso = curso.id_curso
    ORDER BY curso.nome AND aluno.nome;


-- Exercício 3 — Empresa
CREATE TABLE departamento(
id_departamento INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
nivel VARCHAR (45),
area_ VARCHAR (45)
);

CREATE TABLE funcionario(
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cargo VARCHAR(45),
salario DECIMAL (10, 2),
fk_departamento INT,
CONSTRAINT cfkDepartamento foreign key (fk_departamento)
 REFERENCES departamento (id_departamento)
 );
 
 INSERT INTO departamento (nome, nivel, area_) VALUES
('Recursos Humanos', 'Tático', 'Administrativo'),
('Tecnologia da Informação', 'Operacional', 'Tecnologia'),
('Financeiro', 'Estratégico', 'Finanças'),
('Marketing e Vendas', 'Tático', 'Comercial');

INSERT INTO funcionario (nome, cargo, salario, fk_departamento) VALUES
('Ana Silva', 'Gerente de RH', 8500.00, 1),
('Bruno Souza', 'Analista de DP', 4200.00, 1),
('Carlos Oliveira', 'Recrutador', 3800.00, 1),
('Daniela Lima', 'Desenvolvedora Senior', 12000.00, 2),
('Eduardo Costa', 'Desenvolvedor Pleno', 7500.00, 2),
('Fernanda Ribeiro', 'Analista de Suporte', 3500.00, 2),
('Gabriel Almeida', 'Diretor Financeiro', 15000.00, 3),
('Helena Santos', 'Analista Fiscal', 5000.00, 3),
('Igor Carvalho', 'Assistente Contábil', 3200.00, 3),
('Juliana Mendes', 'Coordenadora de Marketing', 6800.00, 4),
('Lucas Pereira', 'Analista de SEO', 4100.00, 4),
('Mariana Costa', 'Executiva de Vendas', 4500.00, 4);
 
 SELECT
    funcionario.nome AS 'Funcionário',
    funcionario.cargo AS 'Cargo',
    departamento.nome AS 'Departamento'
    FROM funcionario
    JOIN departamento
    ON departamento.id_departamento = funcionario.id_funcionario;
    
SELECT 
 funcionario.* 
 FROM funcionario
 JOIN departamento
 ON departamento.id_departamento = funcionario.id_funcionario
 WHERE departamento.nome = 'Tecnologia' 
 OR departamento.nome = 'Recursos Humanos';
 
 /*SELECT 
 funcionario.* 
 FROM funcionario
 JOIN departamento
 ON departamento.id_departamento = funcionario.id_funcionario
 WHERE departamento.nome IN( "Tecnologia", "Recursos Humanos");
*/

SELECT funcionario.nome,
    CASE
    WHEN salario < 3000 THEN 'Salário inicial'
    WHEN salario >= 6000 THEN 'Salário intermediario'
    ELSE 'Salário avançado'
    END AS 'Classificação do salário'
    FROM funcionario;
    
    SELECT funcionario.nome,
    CASE
    WHEN salario < 3000 THEN 'Salário inicial'
    WHEN salario >= 6000 THEN 'Salário intermediario'
    ELSE 'Salário avançado'
    END AS 'Classificação do salário'
    FROM funcionario ORDER BY funcionario.salario DESC;


-- Exercício 4 — Loja virtual
CREATE TABLE categoria(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
descricao VARCHAR (100)
);

CREATE TABLE produto(
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
preco DECIMAL (10,2),
qtd_estoque INT,
marca VARCHAR (45),
fk_categoria INT,
CONSTRAINT cfkCategoria FOREIGN KEY (fk_categoria)
REFERENCES categoria (id_categoria)
);

INSERT INTO categoria (nome, descricao) VALUES
('Eletrônicos', 'Dispositivos eletrônicos e aparelhos de tecnologia'),
('Vestuário', 'Roupas, calçados e acessórios de moda'),
('Alimentos', 'Itens de mercearia e produtos alimentícios perecíveis e não perecíveis'),
('Casa e Decoração', 'Móveis, utensílios domésticos e objetos decorativos');


INSERT INTO produto (nome, preco, qtd_estoque, marca, fk_categoria) VALUES
('Smartphone Galaxy S24', 4500.00, 15, 'Samsung', 1),
('Redmi Note 13', 1200.00, 30, 'Xiaomi', 1),
('Fone de Ouvido Bluetooth', 350.00, 50, 'Sony', 1),
('Mouse Sem Fio', 299.90, 25, 'Logitech', 1),
('Camiseta Dry Fit', 89.90, 100, 'Nike', 2),
('Calça Jeans Straight', 199.00, 40, 'Levi''s', 2),
('Tênis Running Esportivo', 149.90, 60, 'Adidas', 2),
('Blusa de Moleton', 79.90, 80, 'Hering', 2),
('Chocolate em Barra', 4.50, 200, 'Nestlé', 3),
('Arroz Integral 1kg', 8.90, 150, 'Camil', 3),
('Café Torrado e Moído', 12.50, 90, 'Melitta', 3),
('Ketchup Tradicional', 6.20, 120, 'Heinz', 3),
('Jogo de Panelas Antiaderente', 450.00, 10, 'Tramontina', 4),
('Aparelho de Jantar 20 Peças', 120.00, 35, 'Oxford', 4),
('Jogo de Toalhas de Banho', 89.90, 45, 'Teka', 4);

SELECT 
   produto.*,
   categoria.nome AS 'Categoria'
   FROM produto
   JOIN categoria
   ON categoria.id_categoria = produto.fk_categoria;
   
SELECT 
   produto.*,
   categoria.nome AS 'Categoria'
   FROM produto
   JOIN categoria
   ON categoria.id_categoria = produto.fk_categoria
   WHERE produto.nome LIKE '%jogo%';

SELECT 
   produto.*,
   categoria.nome AS 'Categoria',
   CASE
   WHEN qtd_estoque = 0 THEN 'Indisponível'
   WHEN qtd_estoque >= 5 THEN 'Estoque baixo'
   ELSE 'Disponível'
   END AS 'Estoque'
   FROM produto
   JOIN categoria
   ON categoria.id_categoria = produto.fk_categoria;
   
   SELECT 
   produto.*,
   categoria.nome AS 'Categoria',
   CASE
   WHEN qtd_estoque = 0 THEN 'Indisponível'
   WHEN qtd_estoque >= 5 THEN 'Estoque baixo'
   ELSE 'Disponível'
   END AS 'Estoque'
   FROM produto
   JOIN categoria
   ON categoria.id_categoria = produto.fk_categoria
   ORDER BY categoria.nome AND produto.preco DESC;
