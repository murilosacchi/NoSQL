drop database if exists dbemployee; 
create database dbemployee;
use dbemployee;

create table funcionarios(
idFuncionario int not null auto_increment,
nomeFuncionario varchar(255) not null,
dataAdmissaoFuncionario date,
salarioFuncionario decimal(10, 2),
funcaoFuncionario varchar(255),
idSupervisor int,
primary key(idFuncionario),
foreign key (idSupervisor) references funcionarios(idFuncionario)
);

create table automoveis(
idAutomovel int not null auto_increment,
fabricanteAutomovel varchar(255),
anoAutomovel int, 
modeloAutomovel varchar(255) not null,
chassiAutomovel varchar(255) unique,
idFuncionario int,
primary key(idAutomovel),
foreign key (idFuncionario) references funcionarios(idFuncionario)
);

create table reservaAutomoveis(
	idReserva int not null auto_increment,
    idFuncionario int not null,
    idAutomovel int not null,
	dataInicioReserva date not null,
    dataFimReserva date,
    primary key(idReserva),
    foreign key (idFuncionario) references funcionarios(idFuncionario),
    foreign key (idAutomovel) references automoveis(idAutomovel)
);

insert into funcionarios (idFuncionario, nomeFuncionario,
dataAdmissaoFuncionario, salarioFuncionario, funcaoFuncionario,
idSupervisor) values
(1, 'Pedro Paulo', '2001-10-31', 25000.00, 'Gerente de Sistemas de
Software', null) ,
(2, 'Ana da Silva', '2009-01-30', 15000.00,'Programadora de Sistemas',
1),
(3, 'André de Souza', '2020-04-29', 16000.00, 'Engenheiro de
Software', 1),
(4, 'Carlos Macedo', '1988-09-27', 23000.00,'Gerente de Suporte
Técnico', null),
(5, 'Benededito da Silva', '1995-09-28',16500.00, 'Analista de
Sistemas', 4),
(6, 'Carlos Aguiar Souza', '2012-11-28',9500.00, 'Analista Front
End',4),
(7, 'Sandra de Souza Freitas', '2015-07-30',11500.00,'Analista Back
End',4),
(8, 'Saulo André Magalhães', '2016-10-10', 12000.00,'Analista de
Suporte Técnico', 1),
(9, 'Pio de Souza Xavier', '2017-05-25', 14500.00,'Programador Java
Senior',4),
(10, 'Pedro Paulo Andrade', '2018-01-27',6500.00, 'Programador Java
Junior', 4),
(11, 'Beatriz Silveira', '2015-01-21', 9500.00, 'Gerente de Vendas',
null),
(12, 'Carlos Bitencourt', '2018-08-26', 3800.00, 'Analista de Vendas',
11),
(13, 'José Alencar Brito', '2001-07-16', 7800.00, 'Analista de
Vendas', 11),
(14, 'Emerson Godoy', '2013-01-23', 11500.00, 'Gerente de Marketing',
null),
(15, 'Kemelly Andrade', '2021-02-24', 7900.00, 'Analista de
Marketing', 14),
(16, 'Armando Queiroz', '2022-02-01', 5900.00, 'Analista de
Marketing', 14),
(17, 'Fernando Marins', '1997-01-23', 31500.00, 'Gerente de Produção',
null),
(18, 'Fernando Marins', '2001-01-29', 18500.00, 'Engenheiro de
Produção', 17),
(19, 'Sandro Xavier', '2003-01-13', 19500.00, 'Engenheiro de
Produção', 17),
(20, 'Camila de Souza Rocha Xavier', '2006-01-18', 19500.00,
'Engenheira de Produção', 17);

insert into automoveis (idAutomovel, fabricanteAutomovel, anoAutomovel,
modeloAutomovel, chassiAutomovel, idFuncionario) values
(100, 'Volkswagen', 2010, 'Fox', 'BW5987654W0001', null),
(200, 'GM', 2011, 'Celta', 'BF4398373770003', 20),
(300, 'Fiat', 2020, 'Toro', 'WBY9998770885', 17),
(400, 'Volkswagen', 2021, 'Passat', 'BWW234871349871239', 12),
(500, 'Volkswagen', 2005, 'Gol', 'BWW3248917398471', 10),
(600, 'Fiat', 2015, 'Mile', 'BWW3249081340981', 9),
(700, 'Toyota', 2020, 'Corolla', 'BWW1239041234890', 6),
(800, 'Toyota', 2022, 'Camry', 'BWW14238901234890', 5),
(900, 'GM', 2009, 'Corsa', 'BWW790-79034563465', null);

-- a) Listar todos os automóveis cadastrados no banco de dados.
select * from automoveis;

-- b) Listar todos os automóveis cadastrados no banco de dados em ordem alfabética crescente de ano.
select * from automoveis
order by anoAutomovel;

-- c) Listar todos os automóveis fabricados pela Volkswagen e ordem crescente de ano de Fabricação.
select * from automoveis
where fabricanteAutomovel = 'Volkswagen'
order by anoAutomovel;

-- d) Listar todos os automóveis que estão reservados para algum funcionário, ordenados em ordem decrescente do ano de Fabricação.
select * from automoveis
where idFuncionario is not null
order by anoAutomovel desc;

-- e) Listar todos os automóveis que estão sem reservas para funcionários, ordenados em ordem crescente do ano de Fabricação.
select * from automoveis
where idFuncionario is null
order by anoAutomovel;

-- ) Listar o fabricante, o ano e o modelo dos automóveis cadastrados no banco de dados, ordenados em ordem crescente do ano de Fabricação.
select fabricanteAutomovel, anoAutomovel, modeloAutomovel from automoveis
order by anoAutomovel;

-- g) Listar os automóveis dos anos 2005, 2010 e 2020, ordenados pelo ano de fabricação
select * from automoveis
where anoAutomovel = 2005 or anoAutomovel = 2010 or anoAutomovel = 2020
order by anoAutomovel;

-- h) Lista o fabricante e ano do automóvel reservado para o funcionário 10.
select fabricanteAutomovel,anoAutomovel from automoveis
where idFuncionario = 10;

-- i) Listar os automóveis que estão reservados para algum funcionário e que tenhamano de fabricação superior a 2005, ordenados pelo ano de fabricação.
select * from automoveis
where idFuncionario is not null and anoAutomovel >2005
order by anoAutomovel;

-- j) Listar os fabricantes de automóveis cadastrados no banco de dados ordenados pelo nome do fabricante.
select fabricanteAutomovel from automoveis
order by fabricanteAutomovel;

-- k) Listar os fabricantes de automóveis cadastrados no banco de dados, sem duplicados, ordenados pelo nome do fabricante.
select fabricanteAutomovel from automoveis
group by fabricanteAutomovel
order by fabricanteAutomovel;

-- l) Listar os automóveis entre 2010 e 2020, ordenados pelo ano de fabricação.
select * from automoveis
where anoAutomovel between 2010 and 2020
order by anoAutomovel;

-- m) Listar os automóveis com reserva para algum funcionário entre 2010 e 2020, ordenados pelo ano de fabricação.
select * from automoveis
where idFuncionario is not null and anoAutomovel between 2010 and 2020
order by anoAutomovel;

-- n) Listar os funcionários que ganham mais de 10000.00, ordenados pelo nome do Funcionário.
select nomeFuncionario from funcionarios
where salarioFuncionario > 10000.00
order by nomeFuncionario;

-- o) Listar os funcionários que são supervisionados pelo funcionário cujo idSupervisor = 4, ordenados pelo nome do Funcionário;
select nomeFuncionario from funcionarios
where idSupervisor = 4
order by nomeFuncionario;

-- p) Listar os funcionários que foram admitidos na empresa a partir do ano 2010, ordenados pela data de admissão.
select nomeFuncionario from funcionarios
where dataAdmissaoFuncionario >=2010
order by dataAdmissaoFuncionario;

-- q) Listar os funcionários que tem ‘Souza’ no nome, ordenados pelo idFuncionario.
select nomeFuncionario from funcionarios
where nomeFuncionario like '%Souza%'
order by idFuncionario;

-- r) Listar os funcionários que tem o nome iniciado com a letra ‘P’, ordenados pelo idFuncionario.
select nomeFuncionario from funcionarios
where nomeFuncionario like 'P%'
order by idFuncionario;

-- s) Listar o funcionário com o maior salário.
select nomeFuncionario, salarioFuncionario from funcionarios
where salarioFuncionario = (select max(salarioFuncionario) from funcionarios);

-- t) Listar o funcionário com o menor salário.
select nomeFuncionario, salarioFuncionario from funcionarios
where salarioFuncionario = (select min(salarioFuncionario) from funcionarios);

-- u) Listar a média de salário dos funcionários cadastrados no banco de dados.
select avg(salarioFuncionario) from funcionarios;

-- v) Listar os dois maiores salários dos funcionários cadastrados no banco de dados.
select nomeFuncionario, salarioFuncionario from funcionarios
order by salarioFuncionario desc
limit 2;

-- w) Listar os três maiores salários dos funcionários cadastrados no banco de dados.
select nomeFuncionario, salarioFuncionario from funcionarios
order by salarioFuncionario desc
limit 3;

-- x) Listar os dois menores salários dos funcionários cadastrados no banco de dados.
select nomeFuncionario, salarioFuncionario from funcionarios
order by salarioFuncionario
limit 2;

-- y) Listar os três menores salários dos funcionários cadastrados no banco de dados.
select nomeFuncionario, salarioFuncionario from funcionarios
order by salarioFuncionario
limit 3;

