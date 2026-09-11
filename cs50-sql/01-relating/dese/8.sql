SELECT "name", "pupils"
FROM "districts"
JOIN "expenditures"
    ON "districts"."id" = "expenditures"."district_id"
WHERE "name" NOT LIKE '%(non-op)';
