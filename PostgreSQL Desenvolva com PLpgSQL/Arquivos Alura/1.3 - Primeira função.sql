CREATE FUNCTION clean_emp() RETURNS void AS '
    DELETE FROM emp
        WHERE salary < 0;
' LANGUAGE SQL;


CREATE FUNCTION primeira_funcao() RETURNS INTEGER AS '
    SELECT (5 - 3) * 2
' LANGUAGE SQL;


SELECT primeira_funcao();

SELECT primeira_funcao() AS numero;