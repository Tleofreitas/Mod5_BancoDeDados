-- FUNÇÕES MATEMÁTICAS - https://www.w3schools.com/mySQl/mysql_ref_functions.asp --

-- Pode-se usar de forma direta --
SELECT (23+((25-2)/2)*45) AS RESULTADO;

-- ARREDONDAMENTOS --
-- CEILING - traz o próximo número inteiro --
SELECT CEILING(12.33333232323) AS RESULTADO;
-- ROUND - 0 a 4 arredonda para baixo, 5 a 9 arredonda para cima --
SELECT ROUND(12.33333232323) AS RESULTADO; -- para baixo = 12
SELECT ROUND(12.55555232323) AS RESULTADO; -- para cima = 13
-- FLOOR - arredonda para o númer atual independente das casas decimais --
SELECT FLOOR(12.3333232323) AS RESULTADO; -- para 12
SELECT FLOOR(12.7777232323) AS RESULTADO; -- para 12

-- Usando em tabelas --
SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO
FROM ITENS_NOTAS_FISCAIS;

-- Exercício: Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens
-- temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016 
-- arredondando para o menor inteiro. --
SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA)