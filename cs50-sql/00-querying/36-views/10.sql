SELECT "artist", "brightness"
FROM "views"
WHERE "brightness" > (
    SELECT AVG("brightness")
    FROM "views"
)
ORDER BY "brightness" DESC;
