SELECT "schools"."name", "expenditures"."pupils", "expenditures"."per_pupil_expenditure"
FROM "schools"
JOIN "expenditures"
    ON "expenditures"."district_id" = "schools"."district_id"
WHERE "expenditures"."per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
)
    AND "expenditures"."pupils" > (
        SELECT AVG("pupils")
        FROM "expenditures"
    )
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "pupils" DESC, "schools"."name";
