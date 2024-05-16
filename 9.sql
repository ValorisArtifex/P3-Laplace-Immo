-- 9 - Liste des communes ayant eu au moins 50 ventes au 1er trimestre

SELECT
    commune.com_nom_maj_court,
    count(*) as nb_ventes
FROM vente
         JOIN bien ON vente.fk_bien = bien.pk_bien
         JOIN commune ON bien.fk_com_code = commune.pk_com_code
WHERE vente.valeur_fonciere IS NOT NULL
  AND date_mutation BETWEEN '2020-01-01' AND '2020-03-31'
GROUP BY commune.dep_code, com_nom_maj_court
HAVING COUNT(*) >= 50