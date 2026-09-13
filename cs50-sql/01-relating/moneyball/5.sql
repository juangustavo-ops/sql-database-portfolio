SELECT DISTINCT "teams"."name"
FROM "teams"
JOIN "performances"
    ON "performances"."team_id" = "teams"."id"
JOIN "players"
    ON "players"."id" = "performances"."player_id"
WHERE "last_name" = 'Paige'
    AND "first_name" = 'Satchel';
