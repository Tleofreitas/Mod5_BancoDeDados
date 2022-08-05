-- BusinessEntityId, Name, PhoneNumberTypeId, PhoneNumber

SELECT TOP 10 * FROM Person.PhoneNumberType

SELECT TOP 10 * FROM Person.PersonPhone

SELECT PP.BusinessEntityId, PP.name, PT.PhoneNumberTypeId, PP.PhoneNumber
FROM Person.PersonPhone AS PP
INNER JOIN Person.PersonPhone PT ON PT.PhoneNumberTypeId = PP.PhoneNumberTypeID

-- Trazer AddressId, City, StateProvinceId, Nome do Stado
SELECT TOP 10 * FROM Person.StateProvince

SELECT TOP 10 * FROM Person.Address

SELECT TOP 10 pa.AddressId, pa.City, PS.StateProvinceID, PS.Name
FROM Person.Address AS PA
INNER JOIN Person.StateProvince	PS ON PS.StateProvinceID = PA.StateProvinceID