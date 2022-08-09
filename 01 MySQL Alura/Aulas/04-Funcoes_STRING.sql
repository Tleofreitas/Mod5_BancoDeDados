-- FUNÇÕES DE STRINGS - https://www.w3schools.com/mySQl/mysql_ref_functions.asp --

-- LTRIM - remover espaços da ESQUERDA --
SELECT LTRIM('    OLÁ') AS RESULTADO;
-- RTRIM - remover espaços da DIREITA --
SELECT RTRIM('OLÁ     ') AS RESULTADO;
-- TRIM - remover espaços da ESQUERDA e DIREITA --
SELECT TRIM('    OLÁ    ') AS RESULTADO;

-- CONCAT - Concatena Strings --
SELECT CONCAT('OLÁ', ' ', 'TUDO BEM','?') AS RESULTADO;

-- UPPER - transforma em MAIÚSCULAS --
SELECT UPPER('olá, tudo bem?') AS RESULTADO;

-- LOWER - transforma em MINÚSCULAS --
SELECT LOWER('OLÁ, TUDO BEM?') AS RESULTADO;

-- SUBSTRING - coletar um pedaço de uma string --
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6) AS RESULTADO;
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6, 4) AS RESULTADO;

-- Usando em tabelas --
SELECT CONCAT(NOME, ' (', CPF, ') ') AS RESULTADO FROM TABELA_DE_CLIENTES;

-- Exercício: Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado). --
SELECT NOME, CONCAT(ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO) AS COMPLETO
FROM tabela_de_clientes