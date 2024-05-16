-- 4 - Liste des 10 départements où le prix du mètre carré est le plus élevé.

SELECT
    commune.dep_code,
    round(AVG(valeur_fonciere / surface_carrez_du_1er_lot)::numeric ,2 ) as prix
FROM vente
         JOIN bien ON vente.fk_bien = bien.pk_bien
         JOIN commune ON bien.fk_com_code = commune.pk_com_code
WHERE date_mutation BETWEEN '2020-01-01' AND '2020-06-30'
AND valeur_fonciere IS NOT NULL
GROUP BY commune.dep_code
ORDER BY prix DESC
LIMIT 10