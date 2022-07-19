create database maternidade;

create table mae(
	id int primary key identity,
	nome varchar(45) not null
);

create table bebe(
	id int primary key identity,
	nome varchar(45) not null,
	[data de nascimento] date not null,
	[hora de nascimento] time not null,
	bebe_mae_id int ,
	constraint fk_bebe_mae 
	foreign key (bebe_mae_id) references mae (id)
);




insert into mae
	values
	('Helena'),
	('Alice'),
	('Laura'),
	('Manoela'),
	('Valentina'),
	('Sophia'),
	('Isabella'),
	('Heloísa'),
	('Luiza'),
	('Júlia'),
	('Lorena'),
	('Lívia'),
	('Maria Luiza'),
	('Cecília'),
	('Eloá'),
	('Giovanna'),
	('Maria Clara'),
	('Mariana'),
	('Lara'),
	('Beatriz'),
	('Antonella'),
	('Maria Júlia'),
	('Emanuelly'),
	('Isadora'),
	('Ana Clara'),
	('Melissa'),
	('Ana Luiza'),
	('Maria Eduarda'),
	('Maria Alice'),
	('Rosanea'),	('Eliane'),	('Vanusa'),	('Eduarda'),	('Monique');




insert into bebe
	values 
	('Miguel', '2022-03-01', '14:00',1),
	('Arthur', '2022-03-27', '01:00',2),
	('Théo', '2022-03-29', '05:47',3),
	('Heitor', '2022-04-05', '02:00',4),
	('Gael', '2022-04-05', '02:00',5),
	('Davi', '2022-04-05', '02:00',6),
	('Bernardo', '2022-05-06', '08:00',7),
	('Gabriel', '2022-05-15','09:00',8), 
	('Ravi', '2022-07-12', '12:00',9),
	('Noah', '2022-07-24', '16:00',10),
	('Samuel', '2022-07-25', '16:00',11),
	('Pedro', '2022-07-26', '10:00',12),
	('Benício', '2022-07-29', '17:42',13),
	('Benjamin', '2022-07-29', '18:11',14),
	('Matheus', '2022-08-01', '11:11',15),
	('Isaac', '2022-08-01', '11:11',16),
	('Anthony', '2022-08-05', '11:12',17),
	('Joaquim', '2022-08-12', '05:22',18),
	('Lucas', '2022-08-12', '08:29',19),
	('Lorenzo', '2022-08-27', '08:31',20),
	('Rafael', '2022-08-27', '13:14',21),
	('Nicolas', '2022-09-28', '13:16',22),
	('Henrique', '2022-08-30', '19:01',23),
	('Murilo', '2022-08-30', '23:59',24),
	('João Miguel', '2022-08-31', '23:40',25),
	('Lucca', '2022-08-31', '23:12',26),
	('Guilherme', '2022-08-31', '10:12',27),
	('Henry', '2022-08-31', '13:19',28),
	('Bryan', '2022-08-31', '12:57',29),
	('Caroline', '2022-09-08', '14:00',null),	('Iasmin', '2022-09-27', '01:00',null),	('Maíra', '2022-09-29', '05:47',null),	('Eloar', '2022-10-05', '02:00',null),	('Patrícia', '2022-11-05', '02:00',null);

select *from bebe


select *from mae m right join bebe b on m.id = b.bebe_mae_id WHERE b.bebe_mae_id is null and b.[data de nascimento] between '2022-05-01' and '2022-10-30'

select b.nome "Nome do bebê", m.nome "Nome da Mãe", b.[data de nascimento], b.[hora de nascimento], b.bebe_mae_id 
	from bebe b, mae m
		where b.bebe_mae_id = m.id 
				order by b.nome asc
select * from bebe b where b.[hora de nascimento] in (
    select bebe.[hora de nascimento] from bebe
    group by bebe.[hora de nascimento] having count(*) > 1	
)

select *from mae m right join bebe b on m.id = b.bebe_mae_id WHERE b.bebe_mae_id is null and 
	(b.[hora de nascimento] between '22:00:00' and '23:59:00') or
	(b.[hora de nascimento] between '00:00:01' and '05:00:00') 

select  b.nome "Nome do bebê", b.[hora de nascimento], b.[data de nascimento] 
	from mae m right join bebe b on m.id = b.bebe_mae_id
		where b.bebe_mae_id is null and b.[hora de nascimento] between '22:00' and '05:00' 
					order by b.nome asc

select m.nome "Nome da mãe", b.nome "Nome do bebê", CONCAT(b.[data de nascimento],' ', b.[hora de nascimento]) "Data + Hora"  
	from mae m left join bebe b on m.id = b.bebe_mae_id 
		WHERE b.[data de nascimento] between '2022-05-01' and '2022-07-30'








					
drop table mae		
drop table bebe