drop database if exists dbpessoal;
create database dbpessoal;
use dbpessoal; 

create table departamento(
idDepto int not null auto_increment,
nomeDepto varchar(255) not null,
primary key (idDepto)
);

insert into departamento (idDepto, nomeDepto) values
(10, "Compras"),
(20, "Vendas"),
(30, "Marketing"),
(40, "Engenharia"),
(50, "RH"),
(60, "TI"),
(70, "Almoxarifado"),
(80, "Manutenção"),
(90, "Segurança"),
(100, "Contabilidade"),
(120, "Compras Internacionais"),
(130, "Segurança Internacional");

create table funcionario(
idFunc int not null auto_increment,
nomeFunc varchar(255) not null,
cpf varchar(255) not null,
idDepto int,
primary key (idFunc),
foreign key (idDepto) references departamento(idDepto) 	
);

insert into funcionario (idFunc, nomeFunc, cpf, iddepto) values
(1000, "Paulo de Souza Alves", "234.876.855-10", 10),
(1001, "Ana da Silva", "666.876.855-10", 10),
(1002, "Pedro Candido", "444.876.855-10", 10),
(1010, "Antonio Alves", "269.876.855-45", 20),
(1021, "Henrique Souza Alves", "903.876.855-42", 20),
(1032, "Beatriz Silva Santos", "084.457.123-42", 30),
(1034, "Fernando Xavier Santos", "991.670.120-77", 30),
(1045, "Pedro Diógenes Santos", "042.668.234-22", 40),
(1056, "Sandro Gimenez", "816.803.129-33", 50),
(1067, "Carlos Eduardo Bognar", "775.662.127-33", 60),
(1068, "Mauro Favoretto", "225.662.127-33", 60),
(1078, "Maria Aparecida Flores", "388.800.120-49", 70),
(1081, "Saulo de Souza", "691.389.114-91", 80),
(1098, "Ivo de Alcantara", "892.339.966-66", 90),
(1099, "Carlos Alberto de Macedo", "447.100.590-19", 90),
(1101, "Renato Carioca", "778.124.801-17", 100),
(1110, "Valmir de Souza", "786.761.999-10", null),
(1200, "Pedro Rangel", "983-333-998-12", null),
(1210, "Sandro da Silva", "450-120-666-43", null),
(1250, "Saulo Pedro Souza", "999-129-077-65", null);

-- 1) Escrever a query SQL para listar os nomes dos funcionários e seus respectivos nomes de departamento
select f.nomeFunc, d.nomeDepto from funcionario f
join departamento d on f.idDepto = d.idDepto;

-- 2) Escrever a query SQL para listar os nomes dos funcionários e seus respectivos nomes de departamento, 
-- incluindo os funcionários que não estão vinculados a algum departamento
select f.nomeFunc, d.nomeDepto from funcionario f
left join departamento d on f.idDepto = d.idDepto; 

-- 3) Escrever a query SQL para listar os nomes dos funcionários e seus respectivos nomes de
-- departamento, incluindo os departamentos que não possuem funcionários alocados.
select f.nomeFunc, d.nomeDepto from funcionario f
right join departamento d on f.idDepto = d.idDepto;

-- 4) Escrever a query SQL para listar os nomes dos funcionários que têm o nome iniciando
-- com o caractere ‘A’ e seus respectivos nomes de departamento
select f.nomeFunc, d.nomeDepto from funcionario f
join departamento d on f.idDepto = d.idDepto 
where nomeFunc like 'A%';

-- 5) Escrever a query SQL para listar os nomes dos funcionários que têm o nome finalizando
-- com o caracter ‘s’ e seus respectivos nomes de departamento.
select f.nomeFunc, d.nomeDepto from funcionario f
join departamento d on f.idDepto = d.idDepto 
where nomeFunc like '%s';

-- 6) Escrever a query SQL para listar os nomes dos funcionários e seus respectivos nomes de
-- departamento e que têm código de funcionário superior a 1030.
select f.nomeFunc, d.nomeDepto from funcionario f
join departamento d on f.idDepto = d.idDepto
where idFunc > 1030;


