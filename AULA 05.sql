CREATE DATABASE aula5_ccok262;

USE aula5_ccok262;

CREATE TABLE aluno(
id_aluno INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (45),
cpf CHAR (11)
);

CREATE TABLE empresa(
id_aluno INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (45),
cnpj CHAR (14)
);

CREATE USER 'estag'@'%'
 IDENTIFIED BY 'SPTECH@123senho';
 
 SHOW GRANTS FOR 'estag'@'%';
 
 --  *.* -> concede permissão de acesso a todos schemas e todas as suas tabelas
 GRANT SELECT ON aula5_ccok262.* TO 'estag'@'%';
 
 GRANT ALL ON *.* TO 'estag'@'%';
 
 GRANT CREATE, UPDATE ON aula5_ccok262.aluno TO 'estag'@'%';
 
FLUSH PRIVILEGES; 
 
 REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'estag'@'%';
 
GRANT CREATE, UPDATE ON aula5_ccok262.aluno TO 'estag'@'%';

REVOKE CREATE ON aula5_ccok262.aluno FROM 'estag'@'%';

DROP USER 'estag';


 
 