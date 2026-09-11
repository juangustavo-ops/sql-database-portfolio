SELECT "city", COUNT("city") AS 'Number_of_public_schools'
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city" HAVING "Number_of_public_schools" <= 3
ORDER BY "Number_of_public_schools" DESC, "city" ASC;
