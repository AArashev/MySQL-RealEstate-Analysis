DELIMITER $$

CREATE PROCEDURE RankOwnersByEarningsAndProperties()
BEGIN
    SELECT 
        o.OwnerName,
        COUNT(DISTINCT ow.ParcelID) AS PropertyCount,  -- Count unique properties owned
        SUM(DISTINCT t.TotalValue) AS TotalCurrentValue, -- Total current market value of properties
        SUM(DISTINCT s.SalePrice) AS TotalPurchasePrice, -- Total purchase price of properties
        SUM(DISTINCT t.TotalValue - s.SalePrice) AS TotalValueIncrease -- Total increase in value
    FROM owners o
    JOIN ownerships ow ON o.OwnerID = ow.OwnerID
    JOIN properties p ON ow.ParcelID = p.ParcelID
    JOIN propertytax t ON p.ParcelID = t.ParcelID
    LEFT JOIN sales s ON p.ParcelID = s.ParcelID
    WHERE s.SaleDate IS NOT NULL -- Only consider sold properties
    GROUP BY o.OwnerID, o.OwnerName
    HAVING PropertyCount > 0 -- Ensure only owners with properties are included
    ORDER BY TotalValueIncrease DESC, PropertyCount DESC; -- First by earnings, then by property count
END $$

DELIMITER ;
