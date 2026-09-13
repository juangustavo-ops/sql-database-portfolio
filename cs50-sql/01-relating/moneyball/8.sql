SELECT "salaries"."salary"
FROM "salaries"
JOIN "players"
    ON "players"."id" = "salaries"."player_id"
JOIN "performances"
    ON "performances"."player_id" = "players"."id"
WHERE "salaries"."year" = 2001
AND "performances"."HR" = (
    SELECT MAX("HR")
    FROM "performances"
    WHERE "performances"."year" = 2001
);
