-- *** The Lost Letter ***

-- Finds the destination address and type for the package
SELECT "address", "type"
FROM "addresses"
WHERE "id" = (
    SELECT "to_address_id"
    FROM "packages"
    WHERE "contents" = 'Congratulatory letter'
    AND "id" = (
        SELECT "package_id"
        FROM "scans"
        WHERE "action" = 'Pick'
        AND "address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
    )
);

-- Finds the address where the 'Congratulatory letter' was delivered
SELECT "address", "type"
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "action" = 'Drop'
    AND "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "contents" = 'Congratulatory letter'
        AND "id" = (
            SELECT "package_id"
            FROM "scans"
            WHERE "action" = 'Pick'
            AND "address_id" = (
                SELECT "id"
                FROM "addresses"
                WHERE "address" = '900 Somerville Avenue'
            )
        )
    )
);

-- Retrieves the contents of any packages that do not have a return address or sender
SELECT "contents"
FROM "packages"
WHERE "from_address_id" IS NULL;

-- Finds the address where the package was delivered
SELECT "address", "type"
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "action" = 'Drop'
    AND "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);

-- Retrieves the contents of the package sent from '109 Tileston Street' to '728 Maple Place'
SELECT "contents"
FROM "packages"
WHERE "to_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '728 Maple Place'
)
AND "from_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '109 Tileston Street'
);

-- Finds the names of the drivers and the actions they performed for the package
SELECT "name", "action"
FROM "drivers"
JOIN "scans"
ON "drivers"."id" = "scans"."driver_id"
WHERE "package_id" IN (
    SELECT "id"
    FROM "packages"
    WHERE "to_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" = '728 Maple Place'
    )
AND "from_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '109 Tileston Street'
)
);
