-- Quantos produtos temos cadastrados?

SELECT count(*)
FROM Production.Product

-- Quantos tamanhos de produtos temos cadastrados?
SELECT count(size)
FROM Production.Product