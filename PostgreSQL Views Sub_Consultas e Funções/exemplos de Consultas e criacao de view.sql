-- Views Tabelas virtuais 'sempre dosar entre a facilidade de ter views com a perda de performance'
-- documentação de como criar views https://www.postgresql.org/docs/9.2/sql-createview.html
-- exemplos de criação de views

CREATE VIEW vw_cursos_por_categoria
    AS SELECT categoria.nome AS categoria,
       COUNT(curso.id) as numero_cursos
   FROM categoria
   JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;

SELECT * FROM vw_cursos_por_categoria

CREATE VIEW vw_cursos_de_desenvolvimento AS SELECT nome FROM curso WHERE categoria_id = 1;

SELECT * FROM vw_cursos_de_desenvolvimento

-- Juntando uma view com uma tebela para fazer consulta

SELECT categoria.id AS categoria_id, 
		vw_cursos_por_categoria.*
    FROM vw_cursos_por_categoria
    JOIN categoria ON categoria.nome = vw_cursos_por_categoria.categoria;
	