-- Quantas pessoas tem o mesmo MiddleName e agrupar por MiddleName
SELECT MiddleName, COUNT (firstname) as "Quantidade"
FROM Person.Person
GROUP BY MiddleName

-- Media de quantidade que cada produto é vendido
SELECT ProductID, AVG (OrderQty) "Media"
FROM Sales.SalesOrderDetail
GROUP BY ProductID

-- Quais foram as 10 vendas que tiveram os maiores valores de vendas (line total), por produto, do maior para o menor
SELECT TOP 10 productid, SUM (linetotal) "Maiores Vendas"
FROM sales.SalesOrderDetail
GROUP BY productid
ORDER BY SUM (LineTotal) DESC;

-- Quantos produtos e qual a media de produtos cadastrador na ordem de serviço (WorkOrder), agrupado por ID
SELECT productId, COUNT (productId) "contagem",
AVG (orderqty) "media"
FROM Production.WorkOrder
GROUP BY ProductID