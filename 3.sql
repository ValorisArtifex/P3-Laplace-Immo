-- 3 - Proportion des ventes d’appartements par le nombre de pièces.
WITH
    appartements AS (
        SELECT *
        FROM vente
                 JOIN bien ON bien.pk_bien = vente.fk_bien
        WHERE type_local = 'Appartement'),
    stats        AS (
        SELECT
            nombre_pieces_principales as nb_pieces,
            count(*)                  as count
        FROM appartements
        GROUP BY nombre_pieces_principales),
    total        AS (
        SELECT
            count(*) as total
        FROM appartements)
SELECT
    nb_pieces,
    count,
    ROUND((count ::float / total * 100) ::numeric , 2) as ratio
FROM stats
         CROSS JOIN total
ORDER BY  nb_pieces