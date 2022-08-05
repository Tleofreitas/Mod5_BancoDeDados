-- Quantos produtos temos cadastrados que custam mais de 1500?
SELECT count (ListPrice)
FROM Production.Product
WHERE ListPrice > 1500

-- Quantas pessoas temos com sobrenome que iniciam com a letra P?
SELECT count (lastName)
FROM Person.Person
WHERE LastName like 'p%'

-- Em quantas cidades únidas estão cadastrados nossos clientes?
SELECT count (DISTINCT(city))
FROM Person.Address

-- Quais são as cidades únicas cadastradas no sistema?
SELECT DISTINCT (city)
FROM person.Address

-- Quantos produtos vermelhos tem o preço entre 500 e 1000?
SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'red'
and ListPrice BETWEEN 500 and 1000

-- Quantos produtos possuem a palavra 'road' no nome deles?
SELECT COUNT(*)
FROM Production.Product
WHERE name like '%road%'