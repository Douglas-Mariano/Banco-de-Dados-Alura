-- Retornando mais de um valor
-- Para retornar a soma e a multiplicação
-- exemplo com 2 parâmetros de entrada e 2 parâmetros de saída (OUT)

CREATE FUNCTION soma_multiplicacao (
	num_1 INTEGER, num_2 INTEGER, 
	OUT soma INTEGER, OUT multiplicacao INTEGER) AS $$
		SELECT num_1 + num_2 AS soma, num_1 * num_2 AS multiplicacao;
$$ LANGUAGE SQL;

-- Outra forma de fazer essa função
-- Essa segunda maneria é a melhor forma de fazer, mais legível (Boas Práticas).

CREATE TYPE dois_valores AS (soma INTEGER, multiplicacao INTEGER);

CREATE FUNCTION soma_multiplicacao (
	num_1 INTEGER, num_2 INTEGER) RETURNS dois_valores AS $$
		SELECT num_1 + num_2 AS soma, num_1 * num_2 AS multiplicacao;
$$ LANGUAGE SQL;

SELECT * FROM soma_multiplicacao(3, 3);

-- exemplo utilizando tabela do banco

CREATE FUNCTION maiores_salarios(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
	SELECT * FROM instrutor WHERE salario > valor_salario;
$$ LANGUAGE SQL;

-- Forma com 2 parâmetros
-- Podemos utilizar parâmetros de saída e o tipo especial record. 
-- Mas, conforme as boas práticas, o ideal é criar especificamente um tipo, construindo um código mais legível.

CREATE FUNCTION maiores_salarios_2(
	valor_salario DECIMAL, 
	OUT nome VARCHAR, OUT salario DECIMAL) RETURNS SETOF record AS $$
		SELECT nome, salario FROM instrutor WHERE salario > valor_salario;
$$ LANGUAGE SQL;


SELECT * FROM maiores_salarios(120);

