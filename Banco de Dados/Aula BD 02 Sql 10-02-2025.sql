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
describe pessoa;
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

-- DROP TABLE alunodo
drop table aluno;

-- Aula do dia 10/02/2025
CREATE TABLE pessoa(
idPessoa int primary key auto_increment,
nome VARCHAR(40),
dtNasc DATE

);

INSERT INTO pessoa VALUES
(default, 'Homem Aranha', '1984-01-10'); -- default é usado para deixar padrão

INSERT INTO pessoa VALUES
(default, 'Super Homem', '1943-03-30');

INSERT INTO pessoa VALUES
(default, 'Mulher Maravilha', '1943-03-30');


INSERT INTO pessoa (nome,dtNasc)VALUES -- Entre esses parenteses passamos apenas a colunas que eu quero inserir
('Batman', '1953-06-08'); -- Data é sempre data mes e dia 

-- Existe também o DATETIME 'AAAA-MM-DD HH:MM:SS' '1983-03-02 14:01:01'

SELECT * FROM pessoa;

/*
CAMPOS NUMÉRICOS:
NUMEROS INTEIROS - 
INT(EM TORNO DE 2MIL CARACHTERES
TINYINT(DO 0 AO 9) DA MAIS OU MENOS 27 CARACHTERES/ USAM MUITO COM NUMEROS BOOLEANOS

NÚMEROS DECIMAIS:
FLOAT - VAI ATÉ 7 CARACTERES: 12345.67
DOUBLE - ACEITA ATÉ 15 CARACTERES: 1234567891010.2
DECIMAL - PREFISA COLOCAR DOIS PARAMETROS (5 , 2) E VAI ATÉ 32 CARACTERES - SENDO 5 O VALOR MAXIMO E O 2 O VALOR MAXIMO DEPOIS DA VIRGULA "12345.21"
*/

-- Adicionar uma coluna, ex: altura
ALTER TABLE pessoa ADD column altura float;

ALTER TABLE pessoa ADD COLUMN salario DECIMAL (10,2);

INSERT INTO pessoa (nome, salario) VALUES 
('HULK', 1.99);

SELECT * FROM pessoa;


-- SE A LINHA JA EXISTE EU VOU ATUALIZAR O DADO
-- ATUALIZAR O SALARIO DO HOMEM ARANHA

UPDATE pessoa SET salario = 50.99 WHERE idPessoa = 1;

-- Não existe update sem where
-- No mysql sempre deve ser a chave primária 

-- EXCLUIR UM CAMPO DA MINHA TABELA

ALTER TABLE pessoa DROP column altura;

-- MODIFICAR O CAMPO NOME PARA VARCHAR(50)
desc pessoa;
ALTER TABLE pessoa MODIFY column nome varchar(50);

-- RENOMEAR UM CAMPO DTNASC DA TABELA 
ALTER TABLE pessoa RENAME COLUMN dtNasc to dataNasc;

-- EXCLUIR UMA LINHA DA TABELA 
SELECT * FROM pessoa;
DELETE FROM pessoa WHERE idPessoa = 2;

-- A PARTIR DE AGORA O AUTO-INCREMET VAI COMEÇAR POR 1000;
ALTER TABLE pessoa AUTO_INCREMENT = 1000;

INSERT INTO pessoa (nome, dataNasc, salario) VALUES
	('Chapolin', '1859-10-02', 0.99);
    
-- LIMPAR DADOS DA TABELA
-- LIMPA INCLUSIVE O AUTO-INCREMENT

TRUNCATE TABLE pessoa;
SELECT * FROM pessoa;