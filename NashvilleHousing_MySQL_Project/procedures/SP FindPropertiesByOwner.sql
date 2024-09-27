#The procedure now allows you to search for properties owned by someone using a partial or full name.
#Whether you input the first name, last name, or the full name, it will return any records that match that search term.

DELIMITER $$

CREATE PROCEDURE FindPropertiesByOwner(IN ownerName VARCHAR(255))
BEGIN
    SELECT 
        p.ParcelID,
        p.PropertyAddress,
        o.OwnerName
    FROM properties p
    JOIN ownerships ow ON p.ParcelID = ow.ParcelID
    JOIN owners o ON ow.OwnerID = o.OwnerID
    WHERE o.OwnerName LIKE CONCAT('%', ownerName, '%');
END $$

DELIMITER ;
