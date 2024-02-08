-- Para criar uma função em SQL utiliza CREATE FUNCTION.
-- exemplo de criação de função

CREATE FUNCTION primeira_funcao() RETURNS INTEGER AS '
    SELECT (5 - 3) * 2
' LANGUAGE SQL;

-- exemplos de busca de retorno de função
SELECT primeira_funcao();

SELECT primeira_funcao() AS numero;

-- Função que recebe valores
-- exemplo

CREATE FUNCTION soma(num_1 INTEGER, num_2 INTEGER) RETURNS INTEGER AS'
	SELECT num_1 + num_2;
' LANGUAGE SQL;

-- exemplo de como utilizar essa função

SELECT soma(1, 50);

-- se precisamos retornar algo, o último comando da função deve ser um comando que entrega um valor. 
-- exemplo para fazer uma função com um INSERT precisamos colocar um SELECT no final se ela tiver um retorno diferente de void

CREATE FUNCTION string(nome VARCHAR) RETURNS VARCHAR AS '
    INSERT INTO a (nome) VALUES(string.nome);
    
    SELECT nome;
' LANGUAGE SQL;

-- Se formos passar o um nome que estiver entre aspas dentro da função, em vez de usar aspas, usamos notação de dólar para delimitar a string: $$.
-- exemplo

CREATE OR REPLACE FUNCTION string(nome VARCHAR) RETURNS void AS $$
    INSERT INTO a (nome) VALUES('Patricia');
$$ LANGUAGE SQL;

-- Uma Procedure no PostgreSQL é exatamente igual a uma função tendo como diferença o fato de que não retorna nenhum valor.
-- Documentação de PROCEDURE https://www.postgresql.org/docs/current/xproc.html