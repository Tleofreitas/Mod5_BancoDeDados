-- Banco em : https://gist.github.com/acenelio/74fe302c45b28421b7df77c2ed708948#file-escola-sql --

-- QUESTÃO 1 ---
SELECT CURSO.nome Curso, TURMA.numero Turma, TURMA.inicio Inicio
FROM tb_curso CURSO
JOIN tb_turma TURMA ON TURMA.curso_id = CURSO.id

-- QUESTÃO 2 ---
SELECT CURSO.nome Curso, TURMA.numero Turma, ALUNO.nome Aluno, MAT.aluno_id CPF
FROM tb_curso CURSO
JOIN tb_turma TURMA ON TURMA.curso_id = CURSO.id
JOIN tb_matricula MAT ON TURMA.id = MAT.turma_id
JOIN tb_aluno ALUNO ON MAT.aluno_id = ALUNO.cpf

-- Questão 3 ---
SELECT AVA.data, AVA.nota, ALUNO.nome, RES.nota_obtida, ROUND((RES.nota_obtida / AVA.nota * 100),2) Porcentagem
FROM tb_avaliacao AVA
JOIN tb_resultado RES ON AVA.id = RES.avaliacao_id
JOIN tb_aluno ALUNO ON RES.aluno_id = ALUNO.cpf
ORDER BY AVA.data DESC, ALUNO.nome

-- Questão 4 ---
SELECT DISTINCT(ALUNO.cpf), ALUNO.nome, SUM(RES.nota_obtida)
FROM tb_aluno ALUNO
JOIN tb_matricula MAT ON ALUNO.cpf = MAT.aluno_id
JOIN tb_turma TURMA ON MAT.turma_id = TURMA.id
JOIN tb_resultado RES ON ALUNO.cpf = RES.aluno_id
WHERE TURMA.numero=10 AND RES.avaliacao_id IN (3,4)
GROUP BY ALUNO.CPF

-- Questão 4 (Professor) ---
SELECT tb_aluno.nome, sum(tb_resultado.nota_obtida) AS total
FROM tb_avaliacao
INNER JOIN tb_resultado ON tb_resultado.avaliacao_id = tb_avaliacao.id
INNER JOIN tb_aluno ON tb_aluno.cpf = tb_resultado.aluno_id
INNER JOIN tb_turma ON tb_turma.id = tb_avaliacao.turma_id
WHERE tb_turma.numero = 10
GROUP BY tb_aluno.nome







