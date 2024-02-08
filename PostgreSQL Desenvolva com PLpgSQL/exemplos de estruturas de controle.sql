-- PL => função que utiliza uma linguagem PLSQL
-- Estrutura básica da linguagem PL

CREATE FUNCTION primeira_pl() RETURNS INTEGER AS $$
	BEGIN
		-- Vários comandos em SQL
		
		RETURN 1; -- O que os comandos retornam
	END
$$ LANGUAGE plpgsql;

-- Declaração de variáveis
-- Formas de definir o valor padrão de uma variável ao declará-la: " DEFAULT ", " := ", " = "
-- No bloco DECLARE pode-se utilizar qualquer forma para declarar o valor padrão
-- Entre os blocos BEGIN e END nós não podemos utilizar o DEFAULT para atribuir (ou modificar) o valor de uma variável.
-- Documentação https://www.postgresql.org/docs/current/plpgsql-statements.html
-- exemplo

CREATE FUNCTION funcao_com_variavel() RETURNS INTEGER AS $$
	DECLARE
		primeira_variavel INTEGER DEFAULT 3;
	BEGIN
		primeira_variavel := primeira_variavel * 2;
		
		RETURN primeira_variavel;
	END
$$ LANGUAGE plpgsql;

-- exemplo utilizando if - else

DROP FUNCTION salario_ok

-- Solução mais performática

CREATE FUNCTION salario_ok (instrutor instrutor) RETURNS VARCHAR AS $$
  BEGIN
    IF instrutor.salario > 140 THEN
       RETURN 'Salário está ok';
    ELSE
       RETURN 'Salário pode aumentar';
    END IF;
  END;
$$ LANGUAGE plpgsql;


SELECT nome, salario_ok(instrutor) FROM instrutor;

-- exemplo utilizando o DECLARE

CREATE FUNCTION salario_ok (id_instrutor INTEGER) RETURNS VARCHAR AS $$
  DECLARE
  	instrutor instrutor;
  BEGIN
  	SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;
    IF instrutor.salario > 140 THEN
       RETURN 'Salário está ok';
    ELSE
       RETURN 'Salário pode aumentar';
    END IF;
  END;
$$ LANGUAGE plpgsql;

SELECT nome, salario, salario_ok(instrutor.id) FROM instrutor;

-- exemplo com elseif

CREATE FUNCTION tabela_salario (instrutor instrutor) RETURNS VARCHAR AS $$
  BEGIN
    IF instrutor.salario > 140 THEN
		RETURN 'Salário está ok';
    ELSEIF  instrutor.salario = 120 THEN
		RETURN 'Salário pode aumentar';
	ELSE
		RETURN 'Salário está defasado';
    END IF;
  END;
$$ LANGUAGE plpgsql;

SELECT nome, salario, tabela_salario(instrutor) FROM instrutor;

-- exemplo com Case When

DROP FUNCTION tabela_salario;

CREATE FUNCTION tabela_salario (instrutor instrutor) RETURNS VARCHAR AS $$
	BEGIN
		CASE instrutor.salario
			WHEN 100 THEN
				RETURN 'Salário muito baixo';
			WHEN 120 THEN
				RETURN 'Salário baixo';
			WHEN 130 THEN
				RETURN 'Salário Ok';
			ELSE
				RETURN 	'Salário ótimo';
		END CASE;
    END;
$$ LANGUAGE plpgsql;

SELECT nome, salario, tabela_salario(instrutor) FROM instrutor;
