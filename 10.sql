-- 10 - Différence en pourcentage du prix au mètre carré entre un appartement de 2 pièces et un appartement de 3 pièces.

WITH
    stats AS (
        SELECT
                    avg(valeur_fonciere / surface_carrez_du_1er_lot) FILTER (WHERE nombre_pieces_principales = 2) as p2,
                    avg(valeur_fonciere / surface_carrez_du_1er_lot) FILTER (WHERE nombre_pieces_principales = 3) as p3
        FROM vente
                 JOIN bien ON bien.pk_bien = vente.fk_bien)
SELECT
    round(p2),
    round(p3),
    round(((p3::float - p2::float) / (p3::float) * 100):: numeric , 2 )   as evolution
FROM stats;
