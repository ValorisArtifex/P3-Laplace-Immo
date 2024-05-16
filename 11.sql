-- 11 -   Les moyennes de valeurs foncières pour le top 3 des communes des
-- départements 6, 13, 33, 59 et 69.
WITH
    vente_communes as (
        SELECT
            dep_code,
            pk_com_code,
            com_nom_maj_court,
            avg(valeur_fonciere) as prix_moyen
        FROM vente
                 JOIN bien ON vente.fk_bien = bien.pk_bien
                 JOIN commune ON bien.fk_com_code = commune.pk_com_code
        WHERE vente.valeur_fonciere IS NOT NULL
          AND dep_code IN ('6', '13', '33', '59', '69')
        GROUP BY dep_code, pk_com_code, com_nom_maj_court),
    ranked         AS (
        SELECT
            dep_code,
            com_nom_maj_court,
            prix_moyen,
            rank() OVER (PARTITION BY dep_code ORDER BY prix_moyen DESC) as rank
        FROM vente_communes)
SELECT
    dep_code,
    com_nom_maj_court,
    round(prix_moyen)
FROM ranked
WHERE rank <= 3
ORDER BY dep_code, prix_moyen DESC