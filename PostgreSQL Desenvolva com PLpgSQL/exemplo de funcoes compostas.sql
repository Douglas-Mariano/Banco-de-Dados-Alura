-- Além de utilizar o SELECT, em SQL utilizando PostgreSQL é também possível recuperar dados após inserir ou atualizar um registro.
-- Isso se dá através da instrução RETURNING: 
-- Documentação https://www.postgresql.org/docs/current/dml-returning.html

CREATE TABLE instrutor (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	salario DECIMAL(10, 2)
);

INSERT INTO instrutor (nome, salario) VALUES ('Douglas Mariano', 100);
INSERT INTO instrutor (nome, salario) VALUES ('Lucas Silva', 150);
INSERT INTO instrutor (nome, salario) VALUES ('Carolina Souza', 100);
INSERT INTO instrutor (nome, salario) VALUES ('Roberto Santos', 120);
INSERT INTO instrutor (nome, salario) VALUES ('Fernanda Oliveira', 100);
INSERT INTO instrutor (nome, salario) VALUES ('Pedro Mendes', 150);


-- Função onde se envia todos os campos de uma tabela (Parâmetros Compostos)
-- exemplo para retornar o dobro do salario dos integrantes da tabela instrutor

CREATE FUNCTION dobro_salario(instrutor) RETURNS DECIMAL AS $$
	SELECT $1.salario * 2 AS dobro
	
$$ LANGUAGE SQL;

SELECT nome, dobro_salario(instrutor.*) FROM instrutor;

-- Função onde se tem retorno composto
-- exemplo retorno composto

CREATE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$
	SELECT 22, 'Nome falso', 200::DECIMAL;
$$ LANGUAGE SQL;

SELECT * FROM cria_instrutor_falso();

-- Função para retornar conjuntos
-- Para retornar com um conjunto de instrutores, utilizamos SETOF
-- exemplo

CREATE FUNCTION maiores_salarios(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
	SELECT * FROM instrutor WHERE salario > valor_salario;
$$ LANGUAGE SQL;

SELECT * FROM maiores_salarios(120);


