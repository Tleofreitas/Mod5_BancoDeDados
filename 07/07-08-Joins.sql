-- BD em: https://github.com/devsuperior/scripts-sql-cap7/blob/main/joins.sql

-- LEFT JOIN
SELECT * 
FROM tb_empregado
JOIN tb_departamento ON tb_empregado.dept_id = tb_departamento.id;

-- LEFT JOIN
SELECT * 
FROM tb_empregado
LEFT JOIN tb_departamento ON tb_empregado.dept_id = tb_departamento.id;

-- RIGHT JOIN
SELECT * 
FROM tb_empregado
RIGHT JOIN tb_departamento ON tb_empregado.dept_id = tb_departamento.id;

-- FULL JOIN
SELECT * 
FROM tb_empregado
FULL JOIN tb_departamento ON tb_empregado.dept_id = tb_departamento.id;
