-- Encontrar First Name e Last Name e renomear para Nome e Sobrenome
SELECT TOP 10 FirstName AS "Nome", LastName AS "Sobrenome"
FROM Person.Person

-- Alterar o nome ProductNumber para N�mero do Produto
SELECT TOP 10 Productnumber AS "N�mero do Produto"
From Production.Product

-- Alterar o nome UnitePrice para Pre�o Unit�rio
SELECT unitPrice AS "Pre�o Unit�rio"
FROM Sales.SalesOrderDetail