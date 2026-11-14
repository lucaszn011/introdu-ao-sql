-- Banco de dados para praticar criação de tabelas e relacionamentos.
-- Execute CREATE DATABASE uma vez. Depois conecte-se a db_studio
-- no pgAdmin e execute o restante do arquivo.

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
    fd_art INT NOT NULL,
    fd_gen INT NOT NULL,
    valor_gra NUMERIC(7,2) NOT NULL CHECK (valor_gra >= 0),
    CONSTRAINT pk_gravacoes PRIMARY KEY (fd_gra),
    CONSTRAINT fk_gravacoes_artistas FOREIGN KEY (fd_art)
        REFERENCES artistas (id),
    CONSTRAINT fk_gravacoes_genero FOREIGN KEY (fd_gen)
        REFERENCES genero (fd_gen)
);

-- Dados fictícios para praticar as consultas.
INSERT INTO artistas (id, nome_art, telefone_art, email_art, cpf_art) VALUES
(100, 'Artista Exemplo', '11999998888', 'artista@example.invalid', '00000000000'),
(101, 'Banda Modelo', '11988887777', 'banda@example.invalid', '11111111111'),
(102, 'Cantora Teste', '11977776666', 'cantora@example.invalid', '22222222222');

INSERT INTO genero (fd_gen, nome_gen) VALUES
(1000, 'Sertanejo'),
(1001, 'Rock');

INSERT INTO gravacoes (fd_gra, fd_art, fd_gen, valor_gra) VALUES
(1, 100, 1000, 100.99),
(2, 100, 1001, 150.00),
(3, 101, 1001, 200.00),
(4, 102, 1000, 120.00);

-- 1. Lista as gravações com o nome do artista e o gênero musical.
SELECT
    g.fd_gra AS gravacao,
    a.nome_art AS artista,
    ge.nome_gen AS genero,
    g.valor_gra
FROM gravacoes g
JOIN artistas a ON g.fd_art = a.id
JOIN genero ge ON g.fd_gen = ge.fd_gen
ORDER BY a.nome_art;

-- 2. Conta quantas gravações cada artista possui.
SELECT
    a.nome_art AS artista,
    COUNT(g.fd_gra) AS total_gravacoes
FROM artistas a
LEFT JOIN gravacoes g ON g.fd_art = a.id
GROUP BY a.id, a.nome_art
ORDER BY total_gravacoes DESC, a.nome_art;

-- 3. Mostra gêneros com pelo menos duas gravações.
SELECT
    ge.nome_gen AS genero,
    COUNT(g.fd_gra) AS total_gravacoes
FROM genero ge
JOIN gravacoes g ON g.fd_gen = ge.fd_gen
GROUP BY ge.fd_gen, ge.nome_gen
HAVING COUNT(g.fd_gra) >= 2
ORDER BY total_gravacoes DESC;

-- 4. Ordena as gravações do maior para o menor valor.
SELECT
    a.nome_art AS artista,
    ge.nome_gen AS genero,
    g.valor_gra
FROM gravacoes g
JOIN artistas a ON g.fd_art = a.id
JOIN genero ge ON g.fd_gen = ge.fd_gen
ORDER BY g.valor_gra DESC;