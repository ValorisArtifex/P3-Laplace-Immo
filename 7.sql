--7 - Taux d’évolution du nombre de ventes entre le premier et le second trimestre de 2020.

WITH
    stats_2020 AS (
        SELECT
                    count(*) FILTER (WHERE date_mutation BETWEEN '2020-01-01' AND '2020-03-31' ) as t1,
                    count(*) FILTER (WHERE date_mutation BETWEEN '2020-04-01' AND '2020-06-30' ) as t2
        FROM vente)
SELECT
    round((t2::float - t1::float) / (t1::float) * 100) as evolution
FROM stats_2020