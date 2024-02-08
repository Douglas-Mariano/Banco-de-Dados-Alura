-- Estruturas de Repetição
-- exemplo utilizando o comando RETURN NETX => Essa instrução é utilizada quando precisamos retornar múltiplas linhas de uma função PLpgSQL mas não temos uma query.
-- Documentação https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-STATEMENTS-RETURNING

CREATE FUNCTION tabuada(num INTEGER) RETURNS SETOF INTEGER AS $$
	DECLARE
	BEGIN
		RETURN NEXT numero * 1;
        RETURN NEXT numero * 2;
        RETURN NEXT numero * 3;
        RETURN NEXT numero * 4;
        RETURN NEXT numero * 5;
        RETURN NEXT numero * 6;
        RETURN NEXT numero * 7;
        RETURN NEXT numero * 8;
        RETURN NEXT numero * 9;
	END;
$$ LANGUAGE plpgsql;

-- exemplo com loop

CREATE FUNCTION tabuada_loop(num INTEGER) RETURNS SETOF VARCHAR AS $$
	DECLARE
		multiplicador INTEGER DEFAULT 1;
	BEGIN
		LOOP
			RETURN NEXT num || ' x ' || multiplicador || ' = ' || num * multiplicador;
			
			multiplicador := multiplicador + 1;
			
			EXIT WHEN multiplicador = 10; -- condição de saída
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada_loop(5);


-- exemplo com while loop

CREATE FUNCTION tabuada_while(num INTEGER) RETURNS SETOF VARCHAR AS $$
	DECLARE
		multiplicador INTEGER DEFAULT 1;
	BEGIN
		WHILE multiplicador < 10 LOOP -- condição de saída
			RETURN NEXT num || ' x ' || multiplicador || ' = ' || num * multiplicador;
			
			multiplicador := multiplicador + 1;
			
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada_while(6) AS tabuada;

-- Diferença entre WHILE LOOP e LOOP
-- WHILE LOOP a condição de saída é colocada logo no início.
-- LOOP tradicional, é preciso escrever a condição de saída utilizando a palavra-chave EXIT.


-- exemplo com for

CREATE FUNCTION tabuada_for(num INTEGER) RETURNS SETOF VARCHAR AS $$
	BEGIN
		FOR multiplicador IN 1..9 LOOP
			RETURN NEXT num || ' x ' || multiplicador || ' = ' || num * multiplicador;			
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada_for(7) AS tabuada;

-- exemplo for com query

DROP FUNCTION instrutor_com_salario;
CREATE FUNCTION instrutor_com_salario(OUT nome VARCHAR, OUT salario_ok VARCHAR) RETURNS SETOF record AS $$
    DECLARE
        instrutor instrutor;
    BEGIN
        FOR instrutor IN SELECT * FROM instrutor LOOP
            nome := instrutor.nome;
            salario_ok = salario_ok(instrutor.id); -- utilizando a pl do exemplo de estrutura de controle
            
            RETURN NEXT;
        END LOOP;
    END;
$$ LANGUAGE plpgsql

SELECT * FROM instrutor_com_salario();

-- Documentação sobre loops https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-CONTROL-STRUCTURES-LOOPS

