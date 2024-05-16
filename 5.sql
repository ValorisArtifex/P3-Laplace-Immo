-- 5 - Prix moyen maison IDF

SELECT
    round(avg(valeur_fonciere / surface_carrez_du_1er_lot) ::numeric, 2)
FROM vente
         JOIN bien ON vente.fk_bien = bien.pk_bien
         JOIN commune ON bien.fk_com_code = commune.pk_com_code
         JOIN region r on commune.fk_region = r.pk_region
WHERE bien.type_local = 'Maison'
  AND r.region = 'Ile-de-France'
GROUP BY r.region