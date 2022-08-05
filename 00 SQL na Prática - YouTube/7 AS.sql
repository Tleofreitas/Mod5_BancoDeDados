-- Encontrar First Name e Last Name e renomear para Nome e Sobrenome
SELECT TOP 10 FirstName AS "Nome", LastName AS "Sobrenome"
FROM Person.Person

-- Alterar o nome ProductNumber para Número do Produto
SELECT TOP 10 Productnumber AS "Número do Produto"
From Production.Product

-- Alterar o nome UnitePrice para Preço Unitário
SELECT unitPrice AS "Preço Unitário"
FROM Sales.SalesOrderDetail