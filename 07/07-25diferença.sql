-- Banco em: https://github.com/devsuperior/scripts-sql-cap7/blob/main/sales_diff.sql --
/* Exemplo: id, data, e quantidade de todas vendas que não sejam nos mesmos dias em que o vendedor "Ivan Reis" vendeu. */

SELECT * FROM tb_sale
JOIN tb_seller ON tb_seller.id = tb_sale.seller_id

-- Diferença -- 

SELECT tb_sale.id, tb_sale.date, tb_sale.quantity
FROM tb_sale
WHERE date NOT IN (
    SELECT date FROM tb_sale
    JOIN tb_seller ON tb_seller.id = tb_sale.seller_id
    WHERE name = 'Ivan Reis'
)