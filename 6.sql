-- 6 - Liste des 10 appartements les plus chers avec la région et le nombre de mètres carrés
SELECT
    r.region,
    vente.valeur_fonciere,
    bien.surface_carrez_du_1er_lot
FROM vente
         JOIN bien ON vente.fk_bien = bien.pk_bien
         JOIN commune ON bien.fk_com_code = commune.pk_com_code
         JOIN region r on commune.fk_region = r.pk_region
WHERE bien.type_local = 'Appartement'
  AND vente.valeur_fonciere IS NOT NULL
ORDER BY vente.valeur_fonciere DESC
LIMIT 10