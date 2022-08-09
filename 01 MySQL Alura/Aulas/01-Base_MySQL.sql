-- Usar com o Banco SUCOS_VENDAS --

-- Imprimir Embalagem e Produto --
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

-- DISTINCT -- Imprimir Embalagem e Produto sem repetições --
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;
-- DISTINCT com filtro --
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos
WHERE SABOR = 'Laranja';
-- Pode adionar mais campos ao DISTINCT --
SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM tabela_de_produtos;

-- LIMIT -  limitar o número de linhas exibidas na saída --
SELECT * FROM tabela_de_produtos LIMIT 5;
-- LIMIT com intervalos de linha --
SELECT * FROM tabela_de_produtos LIMIT 2,3;

-- ORDER BY - Ordena a saída do SELECT -- 
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;
-- Pode-se mudar esta ordem com DESC (decrescente) --
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;
-- Com campos texto, os valores são ordenados alfabeticamente --
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO;
-- Pode-se mudar esta ordem com DESC para exibir de Z até A --
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO DESC;
-- O critério de ordenação pode ser diferente para cada tipo --
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;

-- GROUP BY - Agrupa os dados. Para campos numéricos deve-se usar critérios como SUM, AVG, MAX, MIN, e outros --
SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;
-- Note que temos várias linhas para RJ e SP. Para somar todos os limites de crédito para RJ e SP:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY ESTADO;
-- MAX - Valor máximo --
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_Produtos GROUP BY EMBALAGEM;
-- COUNT - conta o número de ocorrências na tabela --
SELECT EMBALAGEM, COUNT(*) AS CONTADOR FROM tabela_de_produtos GROUP BY EMBALAGEM;
-- Pode-se aplicar qualquer filtro normalmente --
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;
-- O agrupamento pode ser feito por mais de um campo --
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
GROUP BY ESTADO, BAIRRO;
-- Pode-se mesclar com ordenação --
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
WHERE CIDADE = 'Rio de Janeiro'
GROUP BY ESTADO, BAIRRO
ORDER BY BAIRRO;

-- HAVING - Filtra a saída do SELECT --
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) > 900000;
-- O critério usado no HAVING não precisa ser o mesmo usado no filtro --
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;
-- Ele usa o MIN para agrupamento -- 
-- Na consulta abaixo, o critério do HAVING pede a soma --
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80;
-- Pode-se usar mais de um critério usando AND ou OR -- 
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80 AND MAX(PRECO_DE_LISTA) >= 5;

-- CASE - classificação de cada registro da tabela --
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO'
END AS STATUS_PRECO
FROM tabela_de_produtos;
-- Case como critério de agrupamento --
SELECT EMBALAGEM,
CASE
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO'
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
WHERE sabor = 'Manga'
GROUP BY EMBALAGEM,
CASE
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO'
END
ORDER BY EMBALAGEM;