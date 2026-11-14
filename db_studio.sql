-- Banco de dados para praticar criação de tabelas e relacionamentos.
-- Execute a criação do banco uma vez e depois conecte-se a db_studio
-- antes de executar os comandos de criação das tabelas.

CREATE DATABASE db_studio
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

-- Tabela de artistas
CREATE TABLE artistas (
    id INT NOT NULL,
    nome_art VARCHAR(50) NOT NULL,
    telefone_art VARCHAR(20),
    email_art VARCHAR(100),
    cpf_art VARCHAR(11),
    CONSTRAINT pk_artistas PRIMARY KEY (id),
    CONSTRAINT uk_cpf_art UNIQUE (cpf_art)
);

-- Tabela de gêneros musicais
CREATE TABLE genero (
    fd_gen INT NOT NULL,
    nome_gen VARCHAR(50) NOT NULL,
    CONSTRAINT pk_genero PRIMARY KEY (fd_gen)
);

-- Tabela que relaciona gravações, artistas e gêneros
CREATE TABLE gravacoes (
    fd_gra INT NOT NULL,
    fd_art INT,
    fd_gen INT,
    valor_gra NUMERIC(7,2),
    CONSTRAINT pk_gravacoes PRIMARY KEY (fd_gra),
    CONSTRAINT fk_gravacoes_artistas FOREIGN KEY (fd_art)
        REFERENCES artistas (id),
    CONSTRAINT fk_gravacoes_genero FOREIGN KEY (fd_gen)
        REFERENCES genero (fd_gen)
);

-- Inserção de dados de exemplo
INSERT INTO artistas (id, nome_art, telefone_art, email_art, cpf_art)
VALUES (100, 'Lucas', '99998888', 'lucazinlucas813@gmail.com', '999999999');

INSERT INTO genero (fd_gen, nome_gen)
VALUES (1000, 'sertanejo');

INSERT INTO gravacoes (fd_gra, fd_art, fd_gen, valor_gra)
VALUES (2, 100, 1000, 100.99);

-- Consulta dos registros
SELECT * FROM artistas;
SELECT * FROM genero;
SELECT * FROM gravacoes;
