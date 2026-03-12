-- Database: db_studio

-- DROP DATABASE IF EXISTS db_studio;

CREATE DATABASE db_studio
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

	--criação de tabela
	Create table artistas 
	(
		id				int not null,
		nome_art		varchar(50)not null,
		telefone_art	numeric(9),
		email_art		varchar(50),
		cpf_art			numeric(11),
		constraint pk_id_art primary key (id_art),
		--restricao nome_restricao tipo_restricao(coluna restricao)
		constraint uk_cpf_art unique (cpf_art)
	);
	--trigramação = 3 letras do objeto pertencente


	Create table genero
	(
	fd_gen 	int not null,
	nome_gen varchar(50) not null
	constraint pk_fd_gen primary key (fd_gen)
	
	);

		create table Gravacoes
	(
		fd_gra int not null,
		fd_art int,
		fd_gen int,
		valor_gra	numeric(7,2),
		constraint pk_fd_gra primary key (fd_gra),
		constraint fk_fd_art foreign key (fd_art) references artistas (fd_art),
		constraint fk_fd_gen foreign key (fd_gen) references genero (fd_gen)
	);

	---Inserção de dados
	insert into artistas values (100,'Lucas', 99998888, 'lucazinlucas813@gmail.com', 999999999);
	insert into genero values (1000, 'sertanejo');
	insert into gravacoes values (2,101,1000, 100.99);

	--Seleção de dados

	select * from artistas;
	
	






	


	