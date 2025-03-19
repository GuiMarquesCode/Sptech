-- criar o banco de dados sprint 1
-- Todos os comandos são em inglês
-- todos os comandos terminam com ponto e virgula
-- toda tabela tem uma chave primaria

-- criar um banco de dados 
CREATE DATABASE sprint1;

-- usar o banco de dados usado

USE sprint1;

-- criar nossa primeira tabela 

CREATE TABLE aluno(
ra char(08) primary key,
nome varchar(30),
bairro varchar(25)
);

-- descrever a taela
describe aluno;
desc aluno;

-- mostrar tabelas criadas

show tables;

-- inserir os dados

INSERT INTO aluno VALUES 
('01251020','Henry', 'Flor de Maio');

-- exibir os dados da minha tabela

SELECT ra, nome, bairro FROM aluno;
SELECT * FROM aluno; -- asteristico serve pra selecionar todos

INSERT INTO aluno VALUES  
('01251089', 'Anne', 'Barroso'),
('01251008', 'Joao Victor', 'Cantinho do Céu');

-- Inserindo apenas dados especificos
INSERT INTO aluno(ra,nome) VALUES
('01251057', 'Hygor');

-- Exibir os alunos que moram em Cantinho do céu

SELECT * FROM  aluno WHERE bairro = 'Cantinho do céu';

-- Exibir os alunos que moram num bairro diferente de cantinho do céu

SELECT * FROM aluno WHERE  bairro != 'Cantinho do céu';

-- Exibir o aluno que mora em lor de maio e o aluno que mora em cantinho do céuninstall

SELECT * FROM aluno Where bairro = 'Flor de maio' OR bairro = 'Cantinho do céu'; -- O or foi ultilizado pois o "And" as duas afirmações deveriam estar ccorretas
SELECT * FROM aluno WHERE bairro in ('Flor de maio', 'Cantinho do céu'); -- Tudo que está dentro do in, vai ser selecionado

SELECT * FROM aluno;

-- EXIBIR OS NOMES QUE COMEÇAM COM A LETRA handler

SELECT nome FROM aluno WHERE nome LIKE 'H%';
-- A porcentagem significa que tudo depois do H não importam

-- EXIBIR OS NOMES QUE TERMINAM COM COM R 
SELECT nome FROM aluno WHERE nome LIKE '%R';

-- EXIBIR OS NOMES QUE CONTÉM A LETRA Y
SELECT nome FROM aluno WHERE nome LIKE "%Y%";

-- EXIIR OS NOMES ONDE A SEGUNDA LETRA É "E"
SELECT nome FROM aluno WHERE nome LIKE '_E%'; -- Esse underline ele conta o caractere, e a porcentaem ta dizendo que não importa o que vem depois do E

-- EXIBIR OS NOMES ONDE A PENULTIMA LETRA É release savepoint
SELECT nome FROM aluno WHERE nome LIKE '%r_'; -- mesma coisa só que com a penultima letra

SELECT * FROM ALUNO;

-- EXIBIR OS DADOS ORDENADOS EM ODEM CRESCENTE DO NOME 
SELECT * FROM aluno ORDER BY nome asc; -- Asc é ordem crescente e desc é decrecente (POR PADRÃO É ASCENDENTE )
SELECT * FROM aluno ORDER BY nome desc;

-- EXIBIR OS DADOS DOS ALUNOS QUE COMEÇAM COM "H" ORDENADOS PELO BAIRRO

SELECT * FROM aluno WHERE nome LIKE 'H%' ORDER BY bairro; -- UMA JUNÇÃO DO SELECT COM O LIKE E O ORDER BY;

-- EXIBIR OS NOMES QUE TEM 2 NOMES 
SELECT * FROM aluno WHERE nome  LIKE '% %';

-- DESAFIO -- 
-- EXIBIR O BAIRRO ONDEO TERCEIRO NOME COMEÇA COM m
SELECT * FROM aluno WHERE bairro LIKE '% % M%';

-- DROP TABLE aluno;


