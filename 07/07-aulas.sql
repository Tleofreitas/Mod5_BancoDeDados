-- Link do Script para criar o banco de dados ---
-- https://github.com/devsuperior/scripts-sql-cap7/blob/main/empregados.sql ---

-- PROJEÇÃO / RESTRIÇÃO
SELECT id,nome FROM tb_empregado WHERE dept_id=2

-- Produto Cartesiano (cruzamento de dados) ---
SELECT * FROM tb_empregado, tb_departamento

-- JOIN (JUNÇÃO) ---
SELECT * FROM tb_empregado
INNER JOIN tb_departamento ON tb_empregado.dept_id = tb_departamento.id

-- Produto Cartesiano + Restrição ---
SELECT * FROM tb_empregado, tb_departamento
WHERE tb_empregado.dept_id = tb_departamento.id