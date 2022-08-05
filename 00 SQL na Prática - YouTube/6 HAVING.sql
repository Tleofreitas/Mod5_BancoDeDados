-- Quais as Provincias (stateProvinceId) est�o registradas mais de 1000 vezes
SELECT * FROM Person.Address

SELECT StateProvinceId, COUNT (StateProvinceId) "Contagem"
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT (StateProvinceID) > 1000

-- Quais produtos (ProductId) n�o est�o trazendo em m�dia 1 milh�o em total de vendas (lineTotal)

SELECT * FROM Sales.SalesOrderDetail

SELECT ProductId, AVG (LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG (LineTotal) < 1000000
