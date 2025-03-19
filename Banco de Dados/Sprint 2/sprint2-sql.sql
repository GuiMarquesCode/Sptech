CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE Pais(
	idPais INT PRIMARY KEY auto_increment,
    nome varchar(30),
    capital varchar(40)
);

CREATE TABLE Atleta(
	idAtleta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int,
	fkPais int
);

-- Inserindo dados na tabela País
INSERT INTO Pais ( nome, capital) VALUES
( 'Brasil', 'Brasília'),
( 'Estados Unidos', 'Washington, D.C.'),
( 'França', 'Paris'),
( 'Japão', 'Tóquio');

ALTER TABLE Atleta ADD constraint  fkAtletaPais foreign key (fkPais) references Pais(idPais);

-- Inserindo dados na tabela Atleta
INSERT INTO Atleta (nome, modalidade, qtdMedalha, fkPais) VALUES
( 'João Silva', 'Natação', 5, 1),
( 'Carlos Souza', 'Natação', 3, 1),
( 'Michael Johnson', 'Atletismo', 6, 2),
( 'Usain Bolt', 'Atletismo', 8, 2),
( 'Marie Curie', 'Judô', 4, 3),
( 'Jean Dupont', 'Judô', 2, 3),
( 'Yuki Tanaka', 'Ginástica', 7, 4),
( 'Hiroshi Sato', 'Ginástica', 5, 4);


UPDATE Atleta SET fkPais = 2 WHERE idAtleta = 1 or idAtleta = 2;
UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 3 or idAtleta = 4;
UPDATE Atleta SET fkPais = 3 WHERE idAtleta = 5 or idAtleta = 6;
UPDATE Atleta SET fkPais = 4 WHERE idAtleta = 7 or idAtleta = 8;
SELECT * FROM atleta JOIN Pais ON idPais = fkPais;
SELECT Atleta.nome , Pais.nome FROM atleta JOIN Pais ON idPais = fkPais;
SELECT Atleta.* , Pais.nome , Pais.capital FROM atleta JOIN Pais ON idPais = fkPais WHERE capital = 'Paris';





-- Exercicio 3

CREATE TABLE Pessoa(
	idPessoa int primary key auto_increment,
    nome varchar(45),
    cpf char(11)
);

CREATE TABLE Reserva(
	idReserva int primary key auto_increment,
    dtReserva DATETIME,
    dtRetira DATETIME,
    dtDevolucao DATETIME,
    fkPessoa int
);

ALTER TABLE Reserva ADD CONSTRAINT fkPessoaReserva FOREIGN KEY (fkPessoa) references Pessoa(idPessoa);

-- Inserindo dados na tabela pessoa
INSERT INTO pessoa ( nome, cpf) VALUES
( 'João Silva', '12345678901'),
( 'Maria Oliveira', '23456789012'),
( 'Carlos Souza', '34567890123'),
( 'Ana Pereira', '45678901234'),
( 'Lucas Fernandes', '56789012345');

-- Inserindo dados na tabela reserva
INSERT INTO reserva (dtReserva, dtRetira, dtDevolucao, fkPessoa) VALUES
( '2024-03-17 10:00:00', '2024-03-18 08:00:00', '2024-03-20 18:00:00', 1),
( '2024-03-17 11:30:00', '2024-03-19 09:00:00', '2024-03-22 15:00:00', 2),
( '2024-03-17 14:00:00', '2024-03-20 10:00:00', '2024-03-23 20:00:00', 3),
( '2024-03-17 16:00:00', '2024-03-21 11:00:00', '2024-03-24 16:00:00', 4),
( '2024-03-17 18:30:00', '2024-03-22 14:00:00', '2024-03-25 12:00:00', 5);
-- SELECT Atleta.* , Pais.nome , Pais.capital FROM atleta JOIN Pais ON idPais = fkPais WHERE capital = 'Paris';

SELECT * FROM Reserva JOIN pessoa ON idPessoa = FkPessoa;
SELECT pessoa.nome AS Nome, pessoa.cpf AS Documento, reserva.dtReserva AS "Data Reserva", reserva.dtRetira AS "Data Retira", reserva.dtDevolucao AS Devolução FROM Reserva JOIN pessoa ON idPessoa = FkPessoa;
