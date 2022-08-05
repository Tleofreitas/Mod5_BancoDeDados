-- nome de todas as peças que pesam mais que 500kg e até 700kg
-- coluna weight

SELECT Name
FROM Production.Product
WHERE Weight > 500 and Weight < 700

-- nome de todos os funcionários casados e assalariados
SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' AND SalariedFlag = 1 -- TRUE

-- encontrar o e-mail do usuário Peter Krebs
SELECT *
FROM Person.Person
WHERE FirstName = 'peter' AND LastName = 'Krebs'

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityId = 26