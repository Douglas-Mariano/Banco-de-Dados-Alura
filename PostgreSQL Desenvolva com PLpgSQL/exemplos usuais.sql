-- Função para cadastrar cursos, onde se não existir categoria a adiciona

-- Sempre que executamos uma instrução qualquer, seja um SELECT ou um INSERT,
-- logo depois dessa instrução temos uma variável chamada FOUND,
-- responsável por informar se algum resultado foi retornado dessa consulta.
-- documentação https://www.postgresql.org/docs/current/plpgsql-statements.html#PLPGSQL-STATEMENTS-DIAGNOSTICS

CREATE FUNCTION cria_curso(nome_curso VARCHAR, nome_categoria VARCHAR) RETURNS VARCHAR AS $$
	DECLARE
		id_categoria INTEGER;
	BEGIN
		SELECT 	id INTO id_categoria FROM categoria WHERE nome = nome_categoria;
		
		IF NOT FOUND THEN
			INSERT INTO categoria (nome) VALUES (nome_categoria) RETURNING id INTO id_categoria;
		END IF;
			INSERT INTO curso (nome, categoria_id) VALUES (nome_curso, id_categoria);
			RETURN 'curso adicionado com sucesso';
	END;
$$ LANGUAGE plpgsql;

SELECT cria_curso('Auto_Cad 2', 'Designer');

SELECT * FROM curso;

SELECT * FROM categoria;


