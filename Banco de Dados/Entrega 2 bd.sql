CREATE DATABASE sprint1;
USE sprint1;

-- EXERCICIO 1

CREATE TABLE Atleta (
idAtleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int 
);
INSERT INTO Atleta (nome, modalidade, qtdMedalha)VALUES
('Amir Top', 'corrida',10),
('User Bolt', 'corrida', 3),
('Manti Go', 'futebol', 2),
('Lime Molt','natação', 12),
('Neymar Junior','futebol',4);

SELECT * FROM Atleta;
UPDATE Atleta SET qtdMedalha = 20 WHERE idAtleta = 1;
UPDATE Atleta SET qtdMedalha = 10 WHERE idAtleta = 2 or idAtleta =3;
UPDATE Atleta SET nome = 'Guilherme Insano' WHERE idAtleta = 4;
ALTER TABLE Atleta ADD COLUMN dtNasc date DEFAULT '2000-02-02';
UPDATE Atleta SET dtNasc = '2001-10-20' WHERE idAtleta = 1;
UPDATE Atleta SET dtNasc = '2003-07-12' WHERE idAtleta = 2;
UPDATE Atleta SET dtNasc = '2003-09-21' WHERE idAtleta = 3;
UPDATE Atleta SET dtNasc = '2005-10-10' WHERE idAtleta = 4;
UPDATE Atleta SET dtNasc = '2002-3-15' WHERE idAtleta = 5;
DELETE FROM Atleta WHERE idAtleta = 5;
SELECT * FROM Atleta WHERE modalidade != 'natação';
SELECT * FROM Atleta WHERE qtdMedalha >=3;
ALTER TABLE Atleta MODIFY COLUMN modalidade varchar(60);
DESC atleta;
TRUNCATE TABLE Atleta;

-- Exercicio 2
CREATE TABLE Musica(
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

INSERT INTO Musica (titulo, artista, genero) VALUES 
('Hoje a Noite', 'Calcinha Preta', 'forró'),
('Cobertor', 'Calcinha Preta', 'forró'),
('Infiel',  'Maria Mendonça', 'sertanejo'),
('Piradinha', 'Gustavo Lima', 'sertanejo'),
('Rap god', 'Eminem', 'Rap'),
('Falling Down', 'Lil Peep', 'Rap'),
('Thriller', 'Michael Jackson', 'Pop'),
('Billie Jean', 'Michael Jackson', 'Pop');

SELECT * FROM Musica;
ALTER TABLE Musica ADD COLUMN curtidas INT;
UPDATE Musica SET curtidas = 1000 WHERE idMusica; 
ALTER TABLE Musica MODIFY COLUMN artista VARCHAR(80);
UPDATE Musica SET curtidas = 6400 WHERE idMusica = 1;
UPDATE Musica SET curtidas = 9300 WHERE idMusica = 2 AND idMusica = 3;
UPDATE Musica SET titulo = 'Biro Biro' WHERE idMusica = 5;
DELETE FROM Musica WHERE idMusica = 4;
SELECT * FROM Musica WHERE genero != 'Funk';
SELECT * FROM Musica WHERE curtidas >= 20;
DESC Musica;
TRUNCATE TABLE Musica;

-- Exercicio 3
-- vertigo, interstellar, 2001, alien, sextafeira 13, todo mundo em panico, sherek 
CREATE TABLE filme (
	idFilme INT  PRIMARY KEY auto_increment,
	titulo VARCHAR(50),
	diretor VARCHAR(40),
    genero VARCHAR(40)
);
INSERT INTO filme (titulo, diretor, genero) VALUES
('Vertigo', 'Richard', 'Terror'),
('Interstellar', 'Cristofer Nolan', 'Ficção'),
('2001', 'Gustavo', 'Ficção'),
('Sexta-feira 13', 'All mosso' ,'Terror'),
('Todo mundo em panico', 'TorMan Chop', 'Comédia'),
('Sherek', 'Arthur Cristhias', 'Animação'),
('alien', 'Toby', 'Terror');

SELECT * FROM filme;
ALTER TABLE filme ADD COLUMN protagonista VARCHAR(50);
UPDATE filme SET protagonista = 'john' where idFilme = 1;
UPDATE filme SET protagonista = 'Cooper' where idFilme = 2;
UPDATE filme SET protagonista = 'David' where idFilme = 3;
UPDATE filme SET protagonista = 'Jason' where idFilme = 4;
UPDATE filme SET protagonista = 'Ray' where idFilme = 5;
UPDATE filme SET protagonista = 'Sherek' where idFilme = 6;
UPDATE filme SET protagonista = 'Alien' where idFilme = 7;
ALTER TABLE filme  MODIFY COLUMN diretor varchar(150);
UPDATE filme SET diretor = 'Alpatino' where idFilme = 5;
UPDATe filme SET diretor = 'Gamaia' WHERE idFilme = 2 or idFilme = 7;
UPDATE filme SET  titulo = 'Gato de botas' where idFilme = 6;
DELETE FROM filme WHERE idFilme = 3;
SELECT * FROM filme WHERE genero != 'drama';
SELECT * FROM filme WHERE genero = 'suspense';
desc filme;
TRUNCATE filme;

-- EXERCICIO 4


CREATE TABLE Professor(
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

INSERT INTO Professor (nome, especialidade, dtNasc) VALUES 
('Fernando', 'Matemática', '1967-03-01'),
('Alexandra', 'Matemática', '1999-05-15'),
('Matheus', 'Física', '1979-11-28'),
('Guilherme', 'Física', '2001-02-16'),
('João', 'Artes', '1988-04-03'),
('Lucas', 'Artes', '1993-03-21'),
('Maria', 'Português', '1983-11-19'),
('Maurício', 'Português', '1996-06-23');


SELECT * FROM Professor;

-- b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’
ALTER TABLE professor ADD COLUMN funcao varchar(20) check('monitor'or'assistente'or'titular');

-- c) Atualizar os professores inseridos e suas respectivas funções;

-- d) Inserir um novo professor;
INSERT INTO Professor VALUES 
	(DEFAULT, 'Marcelo', 'Biologia', '2002-05-26');
    
-- e) Excluir o professor onde o idProfessor é igual a 5;
DELETE FROM Professor WHERE idProfessor = 5;

-- f) Exibir apenas os nomes dos professores titulares;
SELECT * FROM Professor WHERE funcao = 'titular';

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;

-- h) Atualizar a data de nascimento do idProfessor igual a 3;
UPDATE Professor SET dtNasc = '1999-01-01' WHERE idProfessor = 3;

-- i) Limpar a tabela Professor;
TRUNCATE TABLE Professor;




-- EXERCICIO 5

CREATE TABLE curso (
	idCurso INT PRIMARY KEY auto_increment,
    nome VARCHAR(50),
    sigla char(3),
    cordenador VARCHAR(50)
);

INSERT INTO curso (nome, sigla, cordenador) VALUES 
('Analise e Desenvolvimento de Sistemas', 'ADS','Claudio'),
('Ciências da Computação', 'CCO', 'Amelia'),
('Sistemas da Informação', 'SIS', 'Gesivaldo');

SELECT * FROM curso;
SELECT cordenador FROM curso;
SELECT * FROM curso WHERE sigla = 'sis';
SELECT * FROM curso ORDER BY nome;
SELECT * FROM curso ORDER BY cordenador desc;
SELECT * FROM curso Where nome like 'a%';
SELECT * FROM curso WHERE nome like '%o';
SELECT * FROM curso WHERE nome like '_i%';
SELECT * FROM curso WHERE nome like '%a_';
DROP TABLE curso;

-- EXERCICIO 6

CREATE TABLE Revista(
	idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

INSERT INTO Revista (nome) VALUES 
('Veja'),
('Galileu'),
('Globo'), 
('Turma da Mônica'),
('Avon'),
('Eldora');

-- • Exibir todos os dados da tabela.
SELECT * FROM Revista;

-- • Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.


--  Insira mais 3 registros completos.
INSERT INTO Revista (nome, categoria) VALUES 
('Chico Bento Jovem', 'Gibi'),
('Voke', 'Moda'),
('Mad', 'Comédia');

-- • Exibir novamente os dados da tabela.
SELECT * FROM Revista;

--  Exibir a descrição da estrutura da tabela.
DESC Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
DESC Revista;

--  Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD COLUMN periodicidade VARCHAR(15);

-- • Exibir os dados da tabela.
SELECT * FROM Revista;

-- • Excluir a coluna periodicidade da tabela.
DELETE periodicidade FROM Revista;

-- EXERCICIO 7

CREATE TABLE Carros(
	idCarro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    placa CHAR(7)
);

ALTER TABLE Carros auto_increment = 1000;

INSERT INTO Carros (nome, placa) VALUES
('Celta', 'ABCD123'),
('Fiesta', 'ACDB123'),
('Pálio', 'CABD321'),
('Camaro', 'DBCA231');

--  Exibir todos os dados da tabela.
SELECT * FROM Carros;

-- Insira mais 3 registros sem a placa dos carros.
INSERT INTO Carros (nome) VALUES 
('Ferrari'), 
('Uno'), 
('Toro');

--  Exibir novamente os dados da tabela.
SELECT * FROM Carros;

-- • Exibir a descrição da estrutura da tabela.
DESC Carros;

-- Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.
ALTER TABLE Carros MODIFY COLUMN nome VARCHAR(28);

DESC carros;

ALTER TABLE carros ADD COLUMN ano char(4);
UPDATE carros SET ano = '2010' where idCarro = 1001;
UPDATE carros SET ano = '2011' where idCarro = 1002;
UPDATE carros SET ano = '2012' where idCarro = 1003;
UPDATE carros SET ano = '2013' where idCarro = 1004;
UPDATE carros SET ano = '2014' where idCarro = 1005;
UPDATE carros SET ano = '2015' where idCarro = 1006;
UPDATE carros SET ano = '2016' where idCarro = 1007;


