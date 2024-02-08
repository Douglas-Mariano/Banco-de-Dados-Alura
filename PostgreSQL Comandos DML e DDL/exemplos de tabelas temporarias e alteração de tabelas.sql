-- Diferença entre Column Constraints e Table Constraints.

-- Column Constraints se referem a restrições ou informações de uma única coluna. 
-- Ex.: Uma chave primária, um campo que deve ser único, um campo que não pode ser nulo, etc.

-- Table Constraints são informações ou restrições de mais de um campo. 
-- Ex.: Chave primária composta, índices compostos, etc.

-- Link para documentação: https://www.postgresql.org/docs/12/sql-createtable.html

-- Para criar tabelas temporárias com exemplos de Constraints

CREATE TEMPORARY TABLE a (
    coluna1 VARCHAR(255) NOT NULL CHECK(coluna1 <> ''),
    coluna2 VARCHAR(255) NOT NULL,
    UNIQUE (coluna1, coluna2)
);

INSERT INTO a VALUES ('a','b');
INSERT INTO a VALUES ('a','c');

-- Para alterar dados da tabela usamos o ALTER TABLE, dessa forma não perdemos os dados contidos na tabela
-- Documentação: https://www.postgresql.org/docs/12/sql-altertable.html

-- Exemplo de alteração do nome da tabela

ALTER TABLE a RENAME TO teste

-- Exemplo de alteração de colunas

ALTER TABLE teste RENAME coluna1 TO primeira_coluna
ALTER TABLE teste RENAME coluna2 TO segunda_coluna


