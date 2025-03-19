-- Exercicio 1

CREATE DATABASE game_store;
USE game_store;

CREATE TABLE jogo(
	id int primary key auto_increment,
    nome varchar(30),
    diretor varchar(30),
    genero varchar(30),
    lancamento date,
    nota int,
    CONSTRAINT chkNota CHECK (nota between 0 and 10),
    quantidade int
);
INSERT INTO jogo (nome, diretor, genero, lancamento, nota, quantidade) VALUES
('Fortnite', 'Sr. Epic Games', 'Tiro', '2018-12-20', 10, 1),
('PayDay2', 'Torcida Corinthians', 'Tiro', '2012-12-20', 7, 40),
('Minecraft', 'Mojang', 'Aventura', '2017-12-20', 10, 50),
('Left4dead', 'Valve', 'Sobrevivencia', '2012-12-20', 8, 50),
('Lego Marvel SuperHeroes ', 'LegoCompani', 'Aventura', '2020-12-20', 5,300);

select * from jogo;

ALTER TABLE jogo ADD COLUMN midia varchar(30) ;
ALTER TABLE jogo ADD constraint chkMidia check (midia in ('Fisica', 'Digital'));
UPDATE jogo SET midia = 'Fisica' WHERE id= 1;
UPDATE jogo SET midia = 'Digital' WHERE id= 2;
UPDATE jogo SET midia = 'Fisica' WHERE id= 3;
UPDATE jogo SET midia = 'Digital' WHERE id= 4;
UPDATE jogo SET midia = 'Fisica' WHERE id= 5;

Select * from jogo where lancamento > '2015-01-01';
SELECT * from jogo where nome like '%a%' and midia = 'Fisica';
SELECT * from jogo where diretor not like '%e%';
-- 7 ja foi feito na hora da criação da tabela
SELECT * from jogo where genero = 'Tiro' and quantidade > 0;
DELETE from jogo WHERE quantidade = 0;
ALTER TABLE jogo RENAME COLUMN diretor to criador;
desc jogo;

-- Exercicio 2
CREATE DATABASE olimpiadas;
use olimpiadas;

CREATE TABLE esporte (
	id int primary key auto_increment,
    nome varchar(40),
    categoria varchar(20),
    numJogadores int,
	estreia date,
    paisOrigem varchar(30),
    CONSTRAINT chkCategoria CHECK (categoria in ('Individual', 'coletivo'))
);

INSERT INTO esporte (nome, categoria, numJogadores, estreia, paisOrigem) VALUES
('Futebol', 'coletivo', 11, '1963-10-26', 'Inglaterra'),
('Tênis', 'Individual', 1, '1974-01-01', 'Reino Unido'),
('Basquete', 'coletivo', 5, '1991-12-21', 'Estados Unidos'),
('Vôlei', 'coletivo', 6, '1995-04-10', 'Estados Unidos'),
('Atletismo', 'Individual', 1, '2016-01-01', 'Grécia');

ALTER TABLE esporte ADD COLUMN popularidade int;
ALTER TABLE esporte ADD CONSTRAINT chkPopularidade check (popularidade between 0 and 10);
UPDATE esporte SET popularidade = '10' WHERE id = 1;
UPDATE esporte SET popularidade = '7' WHERE id = 2;
UPDATE esporte SET popularidade = '9' WHERE id = 3;
UPDATE esporte SET popularidade = '8' WHERE id = 4;
UPDATE esporte SET popularidade = '6' WHERE id = 5;
SELECT * FROM esporte ORDER BY popularidade asc;
SELECT * FROM esporte WHERE estreia > '2000-01-01';
ALTER TABLE esporte ADD constraint chkEstreia CHECK(estreia between '1896-04-06' and '2025-02-17');
ALTER TABLE esporte DROP CONSTRAINT chkCategoria;
SELECT * FROM esporte WHERE paisOrigem like '_a%';
SELECT * FROM esporte WHERE numJogadores between 4 and 11;
DELETE FROM esporte WHERE id = 1;
DELETE FROM esporte WHERE id = 3;
DELETE FROM esporte WHERE id = 5;
Select * from esporte;

-- Exercicio 3
CREATE DATABASE desenho;
USE desenho;

CREATE TABLE desenhos(
	id int primary key auto_increment  ,
	titulo varchar(50),
    dataLancamento date,
    emissora varchar(50),
    classificacao int,
    StatusDesenho varchar(15),
    nota int, 
    constraint chkNota check (nota between 1 and 5)

)auto_increment = 10;

INSERT INTO desenhos (titulo, dataLancamento, emissora, classificacao, StatusDesenho, nota) 
VALUES 
('Scooby-Doo', '1969-09-13', 'CBS', 0, 'Em exibição', 4),
('Tom e Jerry', '1940-02-10', 'MGM', 0, 'Finalizado', 5),
('Avatar: A Lenda de Aang', '2005-02-21', 'Nickelodeon', 10, 'Finalizado', 5),
('Os Flintstones', '1960-09-30', 'ABC', 0, 'Finalizado', 4),
('Peppa Pig', '2004-05-31', 'Nick Jr.', 0 , 'Em exibição', 3),
('Rick and Morty', '2013-12-02', 'Adult Swim', 16, 'Em exibição', 4),
('O Incrível Mundo de Gumball', '2011-05-03', 'Cartoon Network', 10, 'Finalizado', 4),
('Dora, a Aventureira', '2000-08-14', 'Nickelodeon',  0 , 'Em exibição', 3);

 SELECT * FROM desenhos;
 SELECT * FROM desenhos WHERE classificacao <= 14;
 SELECT * FROM desenhos WHERE emissora = 'nickelodeon';
 ALTER TABLE desenhos ADD constraint chkSituacao CHECK (StatusDesenho in('Finalizado','Em exibição','Cancelado'));
 INSERT INTO desenhos (titulo, dataLancamento, emissora, classificacao, StatusDesenho, nota)Values
 ('Hora de aventura', '2013-01-03', 'Cartoon Network', 14, 'Não sei', 5);
 -- Errooo!!
 UPDATE desenhos SET StatusDesenho = 'finalizado' WHERE id = 11;
 UPDATE desenhos SET StatusDesenho = 'finalizado' WHERE id = 18;
 DELETE FROM desenhos WHERE id = 12;
 SELECT * FROM 
 