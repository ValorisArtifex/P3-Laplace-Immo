-- 12 - Les 20 communes avec le plus de transactions pour 1000 habitants pour les communes qui dépassent les 10 000 habitants.

SELECT
    com_nom_maj_court,
    COUNT(*)                               as nb_ventes,
    population                             as nb_habitants,
    round(COUNT(*) / population * 1000, 2) as nb_vente_1000_habitants
FROM vente
         JOIN bien ON vente.fk_bien = bien.pk_bien
         JOIN commune ON bien.fk_com_code = commune.pk_com_code
WHERE vente.valeur_fonciere IS NOT NULL
  AND population > 10000
GROUP BY com_nom_maj_court, population
ORDER BY nb_vente_1000_habitants DESC
LIMIT 20