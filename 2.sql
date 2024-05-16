-- 2 - Le nombre de ventes d’appartement par région pour le 1er semestre 2020
SELECT
    r.region,
    count(*)
FROM vente
         JOIN bien ON vente.fk_bien = bien.pk_bien
         JOIN commune ON bien.fk_com_code = commune.pk_com_code
         JOIN region r on commune.fk_region = r.pk_region
WHERE date_mutation BETWEEN '2020-01-01' AND '2020-06-30'
GROUP BY r.region