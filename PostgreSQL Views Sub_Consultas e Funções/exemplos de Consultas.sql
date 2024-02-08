--Query para gerar um relatório de Alunos e a Quantidade de Cursos que estão matriculados em ordem dis que tem mais Cursos

	SELECT aluno.primeiro_nome,
			aluno.ultimo_nome,
			COUNT(aluno_curso.curso_id) numero_cursos
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
GROUP BY 1, 2
ORDER BY numero_cursos DESC;

-- Se quiser limitar ao Aluno que pussue mais cursos

SELECT aluno.primeiro_nome,
			aluno.ultimo_nome,
			COUNT(aluno_curso.curso_id) numero_cursos
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
GROUP BY 1, 2
ORDER BY numero_cursos DESC
	LIMIT 1;

--Relatório do curso mais requisitado

SELECT curso.nome,
		COUNT(aluno_curso.aluno_id) numero_alunos
	FROM curso
	JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
ORDER BY numero_alunos DESC
	LIMIT 1;
	
--Relatório de categoria mais requisitada

SELECT categoria.nome,
		COUNT(curso.categoria_id) numero_cursos
	FROM categoria
	JOIN curso ON curso.categoria_id = categoria.id
GROUP BY 1
ORDER BY numero_cursos DESC