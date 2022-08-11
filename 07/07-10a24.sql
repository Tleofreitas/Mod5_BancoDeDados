-- BD em: https://github.com/devsuperior/scripts-sql-cap7/blob/main/sales.sql

-- Like
SELECT * FROM tb_seller
WHERE name LIKE 'M%'; -- Qualquer coisa após o 'M'

SELECT * FROM tb_seller
WHERE name LIKE '%Silva%'; -- Qualquer que contenha 'Silva'

-- IN
SELECT * FROM tb_seller
WHERE id IN (2,4);

-- BETWEEN
SELECT * FROM tb_sale
WHERE date BETWEEN '2022-05-07' AND '2022-05-23';

-- UPPER (tudo maiúsculo) e LOWER (tudo minúsculo)
-- Utilizado em comparações
SELECT * FROM tb_seller
WHERE LOWER (name) LIKE 'mar%';

SELECT * FROM tb_seller
WHERE UPPER (name) LIKE 'MAR%';

-- ROUND (Arredondar)
SELECT ROUND(10.4564,3); -- 0 a 4 arredonda para baixo
SELECT ROUND(10.456,2); -- 5 a 9 arredonda para cima
SELECT ROUND(10.456,1); -- 3,2 e 1 são a quantidade de casas decimais

-- CAST (Conversão)
SELECT id, date, ROUND (CAST(price AS NUMERIC),2), quantity
FROM tb_sale

SELECT id, date, ROUND (CAST(price AS numeric),1), quantity
FROM tb_sale

-- Extrair Data
-- Dia
SELECT Date, CAST(EXTRACT(DAY FROM date) AS INTEGER) AS Dia
FROM tb_sale

-- Mês
SELECT Date, CAST(EXTRACT(MONTH FROM date) AS INTEGER) AS Mes
FROM tb_sale

-- Ano
SELECT Date, CAST(EXTRACT(YEAR FROM date) AS INTEGER) AS Ano
FROM tb_sale

SELECT 
Date, CAST(EXTRACT(DAY FROM date) AS INTEGER) AS Dia,
CAST(EXTRACT(MONTH FROM date) AS INTEGER) AS Mes,
CAST(EXTRACT(YEAR FROM date) AS INTEGER) AS Ano
FROM tb_sale

-- Extract na Condição
SELECT 
Date, CAST(EXTRACT(DAY FROM date) AS INTEGER) AS Dia,
CAST(EXTRACT(MONTH FROM date) AS INTEGER) AS Mes,
CAST(EXTRACT(YEAR FROM date) AS INTEGER) AS Ano
FROM tb_sale
WHERE EXTRACT (DAY FROM date) = 18

-- CONCAT (também pode ser usado no where)
SELECT *, CONCAT(EXTRACT (MONTH FROM date), '/', EXTRACT (YEAR FROM date)) AS mes_ano
FROM tb_sale

-- CASE
SELECT id, price,
CASE
    WHEN price < 500 THEN 'Barato'
    ELSE 'Caro'
END AS Classificação
FROM tb_sale

SELECT id, price,
CASE
    WHEN price <= 400 THEN 'Barato'
    WHEN price < 800 THEN 'Medio'
    ELSE 'Caro'
END AS Classificação
FROM tb_sale

-- CONCAT com CASE
SELECT *,
CASE
    WHEN EXTRACT (MONTH FROM date) >= 10 THEN CONCAT(EXTRACT (MONTH FROM date), '/', EXTRACT (YEAR FROM date))
    ELSE CONCAT('0',EXTRACT (MONTH FROM date), '/', EXTRACT (YEAR FROM date))
END AS X
FROM tb_sale

-- REPLACE (Substituição de String)
SELECT id, name, REPLACE (name, 'Silva', 'SILVA')
FROM tb_seller









