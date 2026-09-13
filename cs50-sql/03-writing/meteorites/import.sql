.import --csv meteorites.csv "meteorites_temp"

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL CHECK ("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY ("id")
);

UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';
UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" = '';
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '';

UPDATE "meteorites_temp" SET "mass" = ROUND ("mass", 2) WHERE "mass" IS NOT NULL;
UPDATE "meteorites_temp" SET "lat" = ROUND ("lat", 2) WHERE "lat" IS NOT NULL;
UPDATE "meteorites_temp" SET "long" = ROUND ("long", 2) WHERE "long" IS NOT NULL;

DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
ORDER BY "year", "name";

DROP TABLE "meteorites_temp";
