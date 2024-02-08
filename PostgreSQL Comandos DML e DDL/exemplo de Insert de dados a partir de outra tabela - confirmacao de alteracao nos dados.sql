CREATE TEMPORARY TABLE curso_programacao (
	id_curso INTEGER PRIMARY KEY,
	nome_curso VARCHAR(255) NOT NULL
);

-- Inserindo os dados na tabela temporária através de um SELECT
-- Obs. os dados podem ser inseridos em tabelas permanentes também

INSERT INTO curso_programacao
SELECT academico.curso.id, academico.curso.nome
	FROM academico.curso
	JOIN academico.categoria ON academico.categoria.id = academico.curso.categoria_id
	WHERE categoria_id = 1;
	
SELECT * FROM curso_programacao;

-- Para atualizar uma tabela a partir dos dados de outra tabela, utilizando o UPDATE FROM
-- exemplo

UPDATE teste.cursos_programacao SET nome_curso = nome
    FROM academico.curso WHERE testes.cursos_programacao.id_curso = academico.curso.id
        AND academico.curso.id < 10;

-- Para evitar fazer alterações indevidas no banco, podemos utilizar o comando START TRANSACTION
-- em Postgre é mais comum utilizarmos somente o BEGIN;
-- exemplo
BEGIN
-- em seguida
SELECT * FROM academico.cursos_programacao;

-- Para desfazer a alteração basta rodar um ROLLBACK
ROLLBACK

-- Para confirmar a alteração utilizamos o comando COMMIT
COMMIT

-- Se for desconectado do banco o Postgres poderá devolver um status de erro para nos avisar de problemas, mas também fará automaticamente o ROLLBACK dessa transação.
-- Documentação de Transactions https://www.postgresql.org/docs/current/tutorial-transactions.html

