# Introdução ao SQL

Repositório de estudos para praticar a criação de tabelas, relacionamentos e consultas em **PostgreSQL**.

O exemplo utiliza artistas, gêneros musicais e gravações, com dados fictícios para facilitar os testes.

## Tecnologias

- PostgreSQL
- SQL
- pgAdmin

## Conceitos praticados

- Criação de banco de dados e tabelas
- Chaves primárias (`PRIMARY KEY`)
- Chaves estrangeiras (`FOREIGN KEY`)
- Restrições `UNIQUE` e `CHECK`
- Inserção de registros com `INSERT INTO`
- Junção de tabelas com `JOIN`
- Contagem com `COUNT`
- Agrupamento com `GROUP BY`
- Filtro de grupos com `HAVING`
- Ordenação com `ORDER BY`

## Estrutura

- **artistas:** informações básicas dos artistas.
- **genero:** gêneros musicais.
- **gravacoes:** relaciona artistas e gêneros e armazena o valor da gravação.

## Como executar

1. Abra o pgAdmin e conecte-se ao PostgreSQL.
2. Execute a instrução `CREATE DATABASE db_studio` uma única vez.
3. Conecte-se ao banco `db_studio`.
4. Execute o restante do arquivo `db_studio.sql`.

O script foi preparado para um banco de estudos vazio. Evite executar novamente as instruções de criação e inserção sobre tabelas já existentes.

Projeto acadêmico de prática dos fundamentos de SQL.