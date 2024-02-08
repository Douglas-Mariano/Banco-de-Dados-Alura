-- A cláusula IN é o comando que aprenderemos agora, porque significa que queremos algo que esteja na lista especificada nos seus ().

SELECT * FROM curso WHERE categoria_id IN (1,2);

-- que é o mesmo que usar o OR só que de maneira mas dinâmica

SELECT * FROM curso WHERE categoria_id = 1 OR categoria_id = 2;

-- Sub Query quando precisamos filtrar uma query dentro de outra
-- Neste exemplo buscamos os cursos dentro de categoria que não tenham espaçamento no nome.

SELECT * FROM curso WHERE categoria_id IN (
	SELECT id FROM categoria WHERE nome NOT LIKE '% %'
)
ORDER BY categoria_id DESC;

-- Utilizando uma query dentro do FROM, quando for preciso
-- Neste exemplo trazemos uma consulta onde a categoria tenha um numero > 4 cursos então trás todos as categorias que tenha mais de 4 cursos

SELECT categoria,
       numero_cursos
    FROM (
            SELECT categoria.nome AS categoria,
                COUNT(curso.id) as numero_cursos
            FROM categoria
            JOIN curso ON curso.categoria_id = categoria.id
        GROUP BY categoria
    ) AS categoria_cursos
  WHERE numero_cursos > 4;
  
-- Simplificando a consulta utilizando o HAVING
-- Com isso temos que verificar qual forma faz mais sentido para a sua consulta
-- Na maioria das ocasiões uma sub-query pode ser substituído pelo uso do HAVING.

SELECT categoria.nome AS categoria, 
    COUNT(curso.id) as numero_cursos 
FROM categoria 
JOIN curso ON curso.categoria_id = categoria.id 
GROUP BY categoria 
HAVING COUNT(curso.id) > 4;