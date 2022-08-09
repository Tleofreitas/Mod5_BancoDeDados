/* 
14) Podemos transformar uma consulta numa visão (View) que depois pode ser usada em outras consultas como uma tabela. 
Crie a visão. Para isso, expanda na árvore do canto esquerdo, onde temos o nome do banco, e vá em Views.

15) Botão da direita do mouse sobre Views e crie uma nova visão.

16) Digite o seguinte comando:
CREATE VIEW `VW_MAIORES_EMBALAGENS` AS
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM

17) Clique em Apply e siga os passos até a criação da visão.

18) Podemos manipular a visão como uma tabela. Digite:
SELECT * FROM VW_MAIORES_EMBALAGENS;

19) Logo a consulta:
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM 
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM) X WHERE X.PRECO_MAXIMO >= 10;

Pode ser substituída por:
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM 
VW_MAIORES_EMBALAGENS X WHERE X.PRECO_MAXIMO >= 10;

-- JOIN com View:
SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO
(A.PRECO_DE_LISTA / X.MAIOR_PRECO) *100 AS PERCENTUAL
FROM tabela_de_produtos AS A
JOIN VW_MAIORES_EMBALAGENS AS X ON A.EMBALAGEM = X.EMBALAGEM
*/
