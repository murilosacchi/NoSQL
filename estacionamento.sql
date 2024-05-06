-- Nome: Murilo Sucupira Sacchi RA: 23.10260-8

drop database if exists dbpatio;
create database dbpatio;
use dbpatio;

create table cliente (
idCliente int not null primary key,
CPF char(14) not null unique,
nomeCliente varchar(60) not null,
dataNascimento date not null);

insert into cliente (idCliente, CPF, nomeCliente, dataNascimento)
values
(100, '298.876.123.23', 'Paulo Souza', '2001-10-30'),
(200, '333.657.480.78', 'Ana Catarina', '1999-02-03'),
(300, '123.125.824.12', 'Joel Silva', '1950-01-20'),
(400, '879.982.013.90', 'Pedro de Paula', '1964-01-03'),
(500, '268.811.861.06', 'Beatriz Carvalho', '1978-03-04'),
(600, '631.938.066.48', 'Vitória Sandos', '1985-08-10'),
(700, '345.987.009-12', 'Antonio da Silva Alves', '2001-01-10'),
(800, '123.876.654-16', 'Pedro Luz', '2000-05-05');
select * from cliente;

create table patio (
idPatio integer unique not null primary key,
enderecoPatio varchar(80) not null,
capacidadePatio integer not null );

insert into patio (idPatio, enderecoPatio, capacidadePatio) values
(1, 'São Paulo - Vila Mariana', 200),
(2, 'São Paulo - Av. Paulista', 250),
(3, 'São Caetano do Sul - Av. Goiás', 180);
select * from patio;

create table veiculo (
idVeiculo int not null unique primary key, 
placa char(10) not null, modelo varchar(45) not null, cor varchar(45) not null,
idcliente integer,
foreign key(idcliente) references cliente(idcliente) on delete no action
on update no action);

insert into veiculo (idVeiculo, placa, modelo, cor, idCliente) values
(1001, 'BEE4R22', 'FOX', 'Preto', 100) ,
(1011, 'DKD5Y34', 'TOYOTA', 'Vermelho', null) ,
(1021, 'KIU8Y44', 'GOL', 'Branco', null) ,
(1032, 'BTT9KIU', 'FIAT PULSE', 'Preto', 200) ,
(1033, 'XTT6H77', 'VW NIVUS', 'Vermelho', 200) ,
(1034, 'INH7J81', 'ONIX', 'Branco', null) ,
(1041, 'JUI3S88', 'FIAT ARGO', 'Preto', 300) ,
(1043, 'MIU8542', 'FOX', 'Branco', 400) ,
(1045, 'ZRE4YH7', 'GOL', 'Branco', 500) ,
(1046, 'AII8J866', 'GOL', 'Prata', 600) ,
(1048, 'ZYT4WR55', 'VW NIVUS', 'Prata', null) ,
(1051, 'ZU78JU49', 'JETTA', 'Vermelho', 100) ,
(1055, 'CYW9I775', 'PASSAT', 'Preto', 100) ;
select * from veiculo;

create table estaciona (
idPatio integer not null,
idVeiculo integer not null,
dataEntrada date, dataSaida date,
horaEntrada time, horaSaida time,
primary key (idPatio, idVeiculo),
foreign key(idPatio) references patio(idPatio)
on delete no action on update no action,
foreign key(idVeiculo) references veiculo(idVeiculo)
on delete no action on update no action);

insert into estaciona (idPatio, idVeiculo, dataEntrada, dataSaida,
horaEntrada, horaSaida) values
(1, 1001, '2022-01-03', '2022-01-05', '10:00:00', '12:10:00'),
(1, 1011, '2022-04-10', '2022-04-15', '08:15:00', '14:30:00'),
(1, 1021, '2022-02-03', '2022-02-07', '15:00:00', '09:14:00'),
(2, 1033, '2021-01-10', '2022-01-15', '17:00:00', '18:14:00'),
(2, 1041, '2021-10-10', '2022-10-15', '14:35:00', '08:37:00'),
(2, 1043, '2022-02-02', '2022-02-15', '17:57:00', '06:56:00'),
(3, 1046, '2022-03-10', '2022-03-11', '19:38:00', '19:39:00'),
(3, 1048, '2022-04-12', '2022-04-19', '13:34:00', '05:55:00');
select * from estaciona;

-- 4. Escrever a query SQL para listar o nome dos proprietários de todos os veículos e suas
-- respectivas placas, ordenados pelo nome do cliente.
select nomeCliente, placa
from veiculo as V join cliente as C
on v.idCliente = c.idCliente
order by nomeCliente;

-- 5. Escrever a query SQL para listar o nome dos proprietários de todos os veículos e suas
-- respectivas placas, ordenados pelo nome do cliente, incluindo na listagem os clientes
-- que não possuem veículos.
select nomeCliente, placa
from veiculo as V right join cliente as C
on v.idCliente = c.idCliente
order by nomeCliente;

-- 6. Escrever a query SQL para listar o nome dos proprietários de todos os veículos e suas
-- respectivas placas, ordenados pelo nome do cliente, incluindo na listagem os veículos
-- que não têm clientes à eles associados.
select nomeCliente, placa
from veiculo as V left join cliente as C
on v.idCliente = c.idCliente
order by nomeCliente;

-- 7. Escrever a query SQL para exibir o CPF e o nome do cliente que possui o veículo de placa
-- ZU78JU49.
select cpf, nomeCliente
from cliente as C join veiculo as V 
on c.idCliente = v.idCliente
where v.placa = 'ZU78JU49';

-- 8. Escrever a query SQL para exibir o modelo, a placa e a cor dos veículos estacionados no
-- pátio de código 1.
select modelo, placa, cor
from veiculo as V join estaciona as E
on v.idVeiculo = e.idVeiculo
where idPatio = 1;

-- 9. Escrever a query SQL para exibir o modelo, a placa e a cor dos veículos estacionados no
-- pátio de código 2.
select modelo, placa, cor
from veiculo as V join estaciona as E
on v.idVeiculo = e.idVeiculo
where idPatio = 2;

-- 10. Escrever a query SQL para exibir o modelo, a placa e cor dos veículos estacionados em
-- qualquer um dos pátios da empresa.
select modelo, placa, cor
from veiculo as V join estaciona as E
on v.idVeiculo = e.idVeiculo;

-- 11. Escrever a query SQL para exibir o modelo, a placa dos veículos estacionados em
-- qualquer um dos pátios da empresa e que tenham a cor Prata.
select modelo, placa
from veiculo as V join estaciona as E 
on v.idVeiculo = e.idVeiculo
where cor = 'Prata';

-- 12. Escrever a query SQL para exibir o modelo, a placa dos veículos estacionados em
-- qualquer um dos pátios da empresa e que não tenham a cor Vermelho.
select modelo, placa
from veiculo as V join estaciona as E 
on v.idVeiculo = e.idVeiculo
where cor = 'Vermelho';

-- 13. Escrever a query SQL para exibir o modelo, a placa dos veículos e a data de entrada no
-- estacionamento em qualquer um dos pátios da empresa
select modelo, placa, dataEntrada
from estaciona as e join veiculo as V 
on e.idVeiculo = v.idVeiculo;

-- 14. Escrever a query SQL para exibir o modelo, a placa dos veículos e a data de entrada no
-- estacionamento em qualquer um dos pátios da empresa e que foram estacionados no
-- ano de 2021.
select modelo, placa, dataEntrada
from estaciona as e join veiculo as V 
on e.idVeiculo = v.idVeiculo
where year(dataEntrada) = 2021;



