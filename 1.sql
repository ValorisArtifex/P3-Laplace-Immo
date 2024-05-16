-- 1 - Nombre total d’appartements vendus au 1er semestre 2020.
SELECT count(*) FROM vente
                JOIN bien ON vente.fk_bien = bien.pk_bien
                WHERE date_mutation BETWEEN '2020-01-01' AND '2020-06-30'
                AND type_local = 'Appartement'
                GROUP BY type_local

