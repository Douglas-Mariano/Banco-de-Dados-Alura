-- Funções no PostegreSQL

-- Para juntar 2 strings em uma tabela utilizamos " || "
-- Nesta consulta juntamos o primeiro nomo com o ultimo nome para trazer o nome completo do aluno do banco de dados
-- Na documentação oficial do PostgreSQL temos uma lista enorme de funções específicas para string.
-- Link da documentação https://www.postgresql.org/docs/current/functions.html

SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo FROM aluno

-- Para manipular datas
-- Para trazer a idade com base na data de nascimento podemos usar o AGE()

SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	AGE(data_nascimento) AS idade
	FROM aluno;

-- Para extrair somente os anos pode usar o EXTRACT(YEAR)
-- exemplo

SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
	FROM aluno;

-- Para realizar calculos matematicos
-- documentação de funções matematicas
-- https://www.postgresql.org/docs/9.5/functions-math.html
-- exemplo de como retornar o numero "pi"

SELECT pi()

-- conversão de dados utilizando funções
-- função para retornar a data de hoje "NOW()" a formatando em string utilizamos o "TO_CHAR()"
-- exemplo

SELECT TO_CHAR(NOW(), 'DD/MM/YYYY');
