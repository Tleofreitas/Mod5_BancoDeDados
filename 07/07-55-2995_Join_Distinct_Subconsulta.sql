--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2995

CREATE TABLE records (
id integer PRIMARY KEY,
temperature integer,
mark integer
);

GRANT SELECT ON records TO sql_user;

insert into records (id,temperature,mark) values
(1,30,1),
(2,30,1),
(3,30,1),
(4,32,2),
(5,32,2),
(6,32,2),
(7,32,2),
(8,30,3),
(9,30,3),
(10,30,3),
(11,31,4),
(12,31,4),
(13,33,5),
(14,33,5),
(15,33,5);

/*  Execute this query to drop the tables */
-- DROP TABLE records;

/* Um sensor captura a temperatura ambiente a cada minuto. Os registros também possuem um marcador, que toda vez que a temperatura muda,
esse marcador é aumentado em relação à última captura. Quando o sensor armazena 15 registros, ele prepara uma mensagem para enviá-la ao computador
central. Para reduzir o tamanho da mensagem, o sensor compacta os registros de temperatura próxima e adiciona o número de registros que foram compactados.
Construa uma consulta para resolver este problema, mostrando a temperatura e o número de registros correspondentes.
*/

SELECT * FROM records

SELECT temperature, count(mark)
from records
group by mark, temperature
order by mark
