-- Usar com o Banco SUCOS_VENDAS --

-- JOIN - Unir informações de tabelas diferentes --
SELECT * FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA;
-- Pode-se aplicar agrupamentos ao resultado da consulta --
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;
-- Exercício: Obtenha o faturamento anual da empresa. Leve em consideração que o 
-- valor financeiro das vendas consiste em multiplicar a quantidade pelo preço. --
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

-- LEFT JOIN - Uni TODAS as informações da tabela da ESQUERDA e os CORRESPONDENTES na tabela da direita --
SELECT DISTINCT A.CPF, A.NOME, B.CPF
FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF;
-- O cliente que possui o CPF vindo da tabela de notas com o valor nulo, é o cliente que nunca emitiu nota fiscal. --
-- Para trazer somente o cliente que nunca emitiu nota: --
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF
WHERE B.CPF IS NULL;
-- RIGHT JOIN - Uni TODAS as informações da tabela da DIREITA e os CORRESPONDENTES na tabela da esquerda --
-- Segue os mesmos parâmetros do LEFT JOIN --

-- UNION - juntar duas ou mais consultas, desde que os campos selecionados sejam os mesmos --
SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT BAIRRO, NOME, 'CLIENTE' AS TIPO FROM tabela_de_clientes
UNION
SELECT BAIRRO, NOME, 'VENDEDOR' AS TIPO FROM tabela_de_vendedores;
-- O UNION ALL não faz a seleção com um DISTINCT. As linhas se repetem se existirem em ambas as tabelas --
SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

-- FULL JOIN não não é suportado pelo MYSQL --
-- Para realizar este tipo de consulta deve-se usar LEFT JOIN e RIGHT JOIN com UNION --
SELECT tabela_de_vendedores.BAIRRO,tabela_de_vendedores.NOME, DE_FERIAS,tabela_de_clientes.BAIRRO,tabela_de_clientes.NOME
FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO,tabela_de_vendedores.NOME, DE_FERIAS,tabela_de_clientes.BAIRRO,tabela_de_clientes.NOME 
FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- SUBCONSULTAS - seleções usando como critérios outras seleções --
SELECT * FROM tabela_de_clientes WHERE BAIRRO 
IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM 
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM) AS X WHERE X.PRECO_MAXIMO >= 10;

SELECT X.CPF, X.CONTADOR FROM 
(SELECT CPF, COUNT(*) AS CONTADOR FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF) X WHERE X.CONTADOR > 2000