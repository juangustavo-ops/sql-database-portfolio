SELECT "first_name", "last_name", "height" AS "players_taller_than_average"
FROM "players"
WHERE "height" > (
    SELECT AVG("height")
    FROM "players"
)
ORDER BY "height" DESC, "first_name", "last_name";
