-- Quais as Provincias (stateProvinceId) estão registradas mais de 1000 vezes
SELECT * FROM Person.Address

SELECT StateProvinceId, COUNT (StateProvinceId) "Contagem"
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT (StateProvinceID) > 1000

-- Quais produtos (ProductId) não estão trazendo em média 1 milhão em total de vendas (lineTotal)

SELECT * FROM Sales.SalesOrderDetail

SELECT ProductId, AVG (LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG (LineTotal) < 1000000
