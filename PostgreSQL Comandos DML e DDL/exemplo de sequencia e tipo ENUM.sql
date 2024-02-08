CREATE TEMPORARY TABLE auto (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(30) NOT NULL
);

INSERT INTO auto (nome) VALUES ('Douglas Mariano');

-- Se inserir um valor manual para o id que está como SERIAL, quando tentar inserir outro valor 
-- deixando o Postegre adicionar automático retornarar um erro pois não acessa os dados que forem inseridos manuais
-- a sequencia segue a do próprio banco
-- exemplo

INSERT INTO auto (id, nome) VALUES (2, 'Douglas Mariano');
INSERT INTO auto (nome) VALUES ('Douglas Mariano');

SELECT * FROM auto;

-- Podemos criar nossas sequências para trabalhar no lugar do SERIAL utilizando o CREATE SEQUENCE
-- Documentação https://www.postgresql.org/docs/15/sql-createsequence.html

-- exemplo
CREATE SEQUENCE minha_sequencia;

-- Documentação de como manipular a sequência https://www.postgresql.org/docs/15/functions-sequence.html
-- exemplo de utilização da sequência criada
CREATE TEMPORARY TABLE auto (
        id INTEGER PRIMARY KEY DEFAULT NEXTVAL ('minha_sequencia'),
        nome VARCHAR(30) NOT NULL
);

-- TYPES
-- Ao utilizar o tipo ENUM, podemos garantir que os valores de uma coluna estejam dentro do conjunto permitido de opções, proporcionando maior controle e segurança aos dados.
-- Documentação de criação do ENUM https://www.postgresql.org/docs/current/datatype-enum.html

-- exemplo de criação e utilização de ENUM

CREATE TYPE CLASSIFICACAO AS ENUM ('LIVRE', '12_ANOS','14_ANOS', '16_ANOS', '18_ANOS');

CREATE TEMPORARY TABLE filme (
        id SERIAL PRIMARY KEY,
        nome VARCHAR (255) NOT NULL,
        classificacao CLASSIFICACAO
);

-- Documentação de outros tipos https://www.postgresql.org/docs/current/sql-createtype.html

