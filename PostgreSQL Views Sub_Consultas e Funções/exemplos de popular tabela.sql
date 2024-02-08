-- Inserir alunos
INSERT INTO academico.aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES
    ('João', 'Silva', '1990-05-15'),
    ('Maria', 'Santos', '1988-09-22'),
    ('Carlos', 'Oliveira', '1995-03-10'),
    ('Larissa', 'Lima', '1997-08-08');

-- Inserir categorias de cursos
INSERT INTO academico.categoria (nome) VALUES
    ('Desenvolvimento'),
    ('Design'),
    ('Negócios'),
    ('Idiomas'),
    ('Esportes');

-- Inserir cursos
INSERT INTO academico.curso (nome, categoria_id) VALUES
    ('Programação em C#', 1),
    ('Web Design Basico', 2),
    ('Programação Mobile', 1),
    ('Inglês Basico', 4),
    ('PMA', 3),
    ('Volei', 5),
    ('Matematica Financeira 1', 3),
    ('Matematica Financeira 2', 3),
    ('Java', 1),
    ('Surf', 5);

-- Associar alunos aos cursos
INSERT INTO academico.aluno_curso (aluno_id, curso_id) VALUES
    (1, 10),
    (2, 5),
    (3, 3),
    (4, 2),
    (4, 9),
    (4, 1),
    (3, 4),
    (2, 3),
    (1, 1),
    (4, 7);
