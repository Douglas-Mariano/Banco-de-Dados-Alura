CREATE FUNCTION soma_dois_numeros() RETURNS INTEGER AS'
   SELECT numero_1 + numero2
'LANGUAGE SQL;

SELECT soma_dos_numeros(2, 2);

CREATE FUNCTION soma_dois_numeros(numero_1 INTEGER, numero_2 INTEGER) RETURNS INTEGER AS'
   SELECT numero_1 + numero2
'LANGUAGE SQL;

SELECT soma_dos_numeros(2, 2);

SELECT soma_dos_numeros(3, 17);

CREATE FUNCTION soma_dois_numeros(qualquer INTEGER, coisa INTEGER) RETURNS INTEGER AS'
   SELECT numero_1 + numero2
'LANGUAGE SQL;

DROP FUNCTION soma_dos_numeros;
CREATE FUNCTION soma_dois_numeros( INTEGER, INTEGER) RETURNS INTEGER AS'
   SELECT $1 + $2
'LANGUAGE SQL;

SELECT soma_dos_numeros(3, 17);