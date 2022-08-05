-- Obter o Product Id dos 10 produtos mais caros, listando do mais caro para o mais barato
SELECT TOP 10 productId
FROM Production.Product
ORDER BY ListPrice desc

-- Obter nome e número dos produtos com ID entre 1 e 4
SELECT TOP 4 name, productnumber
FROM Production.Product
ORDER BY ProductID asc