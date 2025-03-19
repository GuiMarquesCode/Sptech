create database sprint1;
use sprint1;

-- Aula 3 
-- check
-- Alias 
-- Case 
-- Ifnull
-- Not null
-- Unique
-- Default

CREATE TABLE sensor(
	idSensor int primary key auto_increment,
    tipo varchar(30) not null,
    dtManutencao datetime,
    statusSensor varchar(40),
    -- Constraint = Restrição, ou seja, restringindo tudo que não for igual ao conteudo dentro 
    constraint chkStatus -- Nome da constrair (restrição)
    check (statusSensor in ('Ativo', 'Inativo', 'Manutenção'))
);

INSERT INTO sensor (tipo, dtManutencao, statusSensor)VALUES 
	('LM35', '25-02-17 13:14:00', 'Inativo');
    
 -- Data corrente do meu servidor

ALTER TABLE sensor MODIFY COLUMN dtManutencao datetime default current_timestamp;

INSERT INTO sensor (tipo , statusSensor) values 
('XLR8', 'Manutenção');


-- Destruir a constraint 
ALTER TABLE sensor DROP CONSTRAINT chkStatus;

/*

Adicionar constraint denovo

ALTER TABLE sensor ADD constraint chkStatus 
    check (statusSensor in ('Ativo', 'Inativo', 'Manutenção'))
*/

-- ADICIONAR UM CAMPO COM O NÚMERO DE SERIE DO SENSOR
ALTER TABLE sensor ADD COLUMN numSerie char (3) unique; -- UNIQUE QUER DIZER QUE O NÚMERO DEVE SER UNICO

UPDATE sensor SET  numSerie = '001' where idSensor = 1;
UPDATE sensor SET  numSerie = '001' where idSensor = 2;
-- Duplicate entry '001' for key 'sensor.numSerie'	0.000 sec


-- Alias = Apelido, ou seja, apelidar tudoooo
SELECT tipo AS 'Tipo de Sensor', dtManutencao AS 'Data de Manutenção' from sensor;

-- IFNULL
SELECT * FROM sensor;
SELECT IFNULL(numSerie, 'Sem número de série') AS numSerie , tipo FROM sensor;

-- CASE 

SELECT tipo , CASE 
WHEN statusSensor = 'Manutenção' THEN 1 
WHEN statusSensor = 'Pendente' THEN 'Joga fora'
	ELSE 0
    END AS 'Manutencao' FROM sensor;

-- DEFAULT 
ALTER TABLE sensor ADD COLUMN nome varchar(20) default 'Sem nome';



    select * from sensor;