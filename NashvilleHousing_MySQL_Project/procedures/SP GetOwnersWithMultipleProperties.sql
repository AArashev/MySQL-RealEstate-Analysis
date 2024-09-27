DELIMITER $$

CREATE PROCEDURE GetOwnersWithMultipleProperties()
BEGIN
    SELECT 
        o.OwnerName,
        COUNT(ow.ParcelID) AS PropertyCount
    FROM owners o
    JOIN ownerships ow ON o.OwnerID = ow.OwnerID
    GROUP BY o.OwnerID, o.OwnerName
    HAVING PropertyCount > 1
    ORDER BY PropertyCount DESC;
END $$

DELIMITER ;