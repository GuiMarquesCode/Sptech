CREATE DATABASE sprint2;
USE sprint2;

-- Exercicio 1

CREATE TABLE Funcionario(
	idFuncionario INT PRIMARY KEY auto_increment,
    nome varchar(45),
    setor varchar(45),
    FkSupervisor int,
    constraint fkSuperFunc foreign key (FkSupervisor) references Funcionario(idFuncionario)

);

insert into Funcionario (nome, setor, FkSupervisor) values 
("Guilherme" , "T.I" , null),
("Joana" , "Marketing", null),
("Ana", "T.I", 1),
("Theo" , "T.I" , 1),
("Maria", "Marketing", 2),
("Lucas" ,"Marketing" , 2)
;

SELECT func.nome as Nome_funcionario, 
		Supervisor.nome as Nome_Supervisor 
        From Funcionario as func JOIN Funcionario as Supervisor on func.fkSupervisor = Supervisor.idFuncionario;
        
SELECT func.nome as Nome_Funcionario, 
	Supervisor.nome as Nome_supervisor
    from Funcionario as func JOIN Funcionario as Supervisor on func.fkSupervisor = Supervisor.idFuncionario where Supervisor.nome = "Guilherme";
    
    SELECT func.nome as Nome_Funcionario, 
	Supervisor.nome as Nome_supervisor , case When Supervisor.nome = "Guilherme" then "Gostei" else "Ruim" end as Avaliação
    from funcionario as func JOIN funcionario as Supervisor on func.fkSupervisor = Supervisor.idFuncionario ;
    
-- Exercicio 2

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fkGerente int,
    FkEmail  int,
	constraint fkUserGerente foreign key (fkGerente) references usuario(idUsuario)
);

CREATE TABLE Email (
	idEmail INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(45),
    FkUsuario int,
    constraint fkUserEmail foreign key (FkUsuario) references usuario(idUsuario)
);

ALTER TABLE usuario ADD CONSTRAINT fkUserEmail2 foreign key (FkEmail) references Email(idEmail);

INSERT INTO usuario (nome, fkGerente, FkEmail) VALUES 
('Carlos Silva', NULL, NULL), 
('Mariana Souza', 1, NULL),   
('Pedro Almeida', 1, NULL),   
('Ana Santos', 2, NULL);       

-- Inserindo emails e associando aos usuários
INSERT INTO Email (Email, FkUsuario) VALUES
('carlos@email.com', 1),
('mariana@email.com', 2),
('pedro@email.com', 3),
('ana@email.com', 4);

UPDATE usuario SET FkEmail = 1 WHERE idUsuario = 1;
UPDATE usuario SET FkEmail = 2 WHERE idUsuario = 2;
UPDATE usuario SET FkEmail = 3 WHERE idUsuario = 3;
UPDATE usuario SET FkEmail = 4 WHERE idUsuario = 4;

SELECT Func.nome as Nome_func, gerente.nome as Nome_gerente , EmailUser.Email as Email_do_usuario 
FROM usuario as Func 
JOIN usuario as gerente on Func.fkGerente = gerente.idUsuario 
join Email as EmailUser on Func.FkEmail = EmailUser.idEmail;

SELECT Func.nome as Nome_func, gerente.nome as Nome_gerente , EmailUser.Email as Email_do_usuario 
FROM usuario as Func 
JOIN usuario as gerente on Func.fkGerente = gerente.idUsuario 
join Email as EmailUser on Func.FkEmail = EmailUser.idEmail where gerente.nome = "Carlos Silva" ;

SELECT Func.nome as Nome_func, gerente.nome as Nome_gerente , EmailUser.Email as Email_do_usuario , case when gerente.nome = "Carlos Silva" then "muito bom" else "Mais ou menos" end as "Avaliação Gerencia"
FROM usuario as Func 
JOIN usuario as gerente on Func.fkGerente = gerente.idUsuario 
join Email as EmailUser on Func.FkEmail = EmailUser.idEmail;
