CREATE DATABASE Venda;
USE Venda;

CREATE TABLE Cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    endereco VARCHAR(45),
    FkIndicador int,
    CONSTRAINT IndicadorConst FOREIGN KEY (FkIndicador) REFERENCES Cliente(idCliente)
    
);


CREATE TABLE Venda(
	idVenda INT AUTO_INCREMENT, 
    total DECIMAL(10,4),
    DataCompra DATE,
    fkCliente int,
    CONSTRAINT FKCLIENTECONST FOREIGN KEY (fkCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT PKCLIENTE PRIMARY KEY(idVenda, fkCliente)
);

CREATE TABLE Produto (
	idProduto INT PRIMARY KEY AUTO_INCREMENT, 
    Nome VARCHAR(45),
    Descricao VARCHAR(500),
    Preco DECIMAL (6,2)
);

CREATE TABLE DescVenda(
	idDesc INT AUTO_INCREMENT, 
    FkProduto INT,
    FkVenda INT, 
    Desconto DECIMAL(8,2),
    Quantidade int,
    
    CONSTRAINT PKDESC PRIMARY KEY (idDesc, FkProduto, FkVenda),
    CONSTRAINT PRODUTOCONST FOREIGN KEY (FkProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (FkVenda) REFERENCES Venda(idVenda)
);



INSERT INTO Cliente (nome, email, endereco, FkIndicador) VALUES
('João Silva', 'joao@email.com', 'Rua A, 123', NULL),
('Maria Souza', 'maria@email.com', 'Rua B, 456', NULL);


INSERT INTO Cliente (nome, email, endereco, FkIndicador) VALUES
('Pedro Oliveira', 'pedro@email.com', 'Rua C, 789', 1),
('Ana Lima', 'ana@email.com', 'Rua D, 101', 2),
('Lucas Pereira', 'lucas@email.com', 'Rua E, 202', 1); 

INSERT INTO Produto (Nome, Descricao, Preco) VALUES
('Notebook', 'Notebook 15 polegadas', 3500.00),
('Smartphone', 'Celular Android', 1800.00),
('Fone de Ouvido', 'Bluetooth, cancelamento de ruído', 300.00),
('Monitor', 'Monitor 24 polegadas Full HD', 900.00);


INSERT INTO Venda (total, DataCompra, fkCliente) VALUES
(5300.00, '2025-04-01', 1),
(1800.00, '2025-04-15', 1),
(4200.00, '2025-04-05', 2),
(300.00, '2025-04-20', 2),
(1800.00, '2025-04-10', 3),
(900.00, '2025-04-12', 4),
(3800.00, '2025-04-18', 5);


INSERT INTO DescVenda (FkProduto, FkVenda, Desconto, Quantidade) VALUES
(1, 1, 200.00, 1),
(3, 1, 20.00, 1),
(2, 2, 100.00, 1),
(1, 3, 150.00, 1),
(4, 4, 30.00, 1),
(2, 5, 50.00, 1),
(4, 6, 20.00, 1),
(1, 7, 300.00, 1),
(3, 7, 10.00, 2);

SELECT * FROM Cliente;
SELECT * FROM Venda;
SELECT * FROM Produto;
SELECT * FROM DescVenda;


-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.

SELECT Cliente.* , Venda.* FROM Cliente JOIN Venda ON fkCliente = idCliente;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.

SELECT Cliente.* , Venda.* FROM Cliente JOIN Venda ON fkCliente = idCliente WHERE Cliente.nome LIKE '%João%';

-- Exibir os dados dos clientes e de suas respectivas indicações de clientes.

SELECT Cliente.* , ifnull(Indicador.nome , 'Sem indicador') as Indicador FROM Cliente LEFT 
JOIN Cliente as Indicador ON Indicador.idCliente = Cliente.FkIndicador; 

-- Exibir os dados dos clientes indicados e os dados dos respectivos clientes
-- indicadores, porém somente de um determinado cliente indicador (informar o nome
-- do cliente que indicou na consulta).

SELECT Cliente.* , ifnull(Indicador.nome , 'Sem indicador') as Indicador FROM Cliente LEFT 
JOIN Cliente as Indicador ON Indicador.idCliente = Cliente.FkIndicador WHERE Cliente.FkIndicador = 1;

-- Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos. 

SELECT Cliente.nome AS Nome, Indicador.Nome As Indicador, Venda.*, Produto.nome FROM Cliente
JOIN Cliente as Indicador ON Indicador.idCliente = Cliente.FkIndicador
JOIN Venda ON Venda.fkCliente = Cliente.idCliente
JOIN Produto ON DescVenda.FkProduto = DescVenda.FkVenda;
