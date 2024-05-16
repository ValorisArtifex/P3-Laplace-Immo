-- 8 - Le classement des régions par rapport au prix au mètre carré des appartement de plus de 4 pièces.
SELECT
    r.region,
    round(AVG(vente.valeur_fonciere / bien.surface_carrez_du_1er_lot)) as prix_moyen
FROM vente
         JOIN bien ON vente.fk_bien = bien.pk_bien
         JOIN commune ON bien.fk_com_code = commune.pk_com_code
         JOIN region r on commune.fk_region = r.pk_region
WHERE bien.type_local = 'Appartement'
  AND vente.valeur_fonciere IS NOT NULL
  AND bien.nombre_pieces_principales > 4
GROUP BY r.region
ORDER BY prix_moyen DESC
LIMIT 10