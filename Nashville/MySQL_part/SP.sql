#Stored Procedure: FindPropertiesByOwner
#This procedure retrieves all properties owned by a specific owner.
DELIMITER $$

CREATE PROCEDURE FindPropertiesByOwner(IN partialName VARCHAR(255))
BEGIN
    SELECT 
        o.owner_name AS OwnerName,
        p.property_id AS PropertyID,
        p.address AS PropertyAddress,
        p.land_use_code AS LandUseCode,
        p.city_id AS CityID
    FROM 
        ownerships ow
    JOIN 
        properties p ON ow.property_id = p.property_id
    JOIN 
        owners o ON ow.owner_id = o.owner_id
    WHERE 
        o.owner_name LIKE CONCAT('%', partialName, '%');
END $$

DELIMITER ;


#GetOwnersWithMultipleProperties
#This procedure retrieves owners who own more than one property.
DELIMITER $$

CREATE PROCEDURE GetOwnersWithMultipleProperties()
BEGIN
    SELECT 
        o.owner_name AS OwnerName,
        COUNT(ow.property_id) AS NumberOfProperties
    FROM 
        owners o
    JOIN 
        ownerships ow ON o.owner_id = ow.owner_id
    GROUP BY 
        o.owner_id
    HAVING 
        COUNT(ow.property_id) > 1
    ORDER BY 
        NumberOfProperties DESC;
END $$

DELIMITER ;

#RankOwnersByEarningsAndProperties
#This procedure ranks property owners by their total earnings and number of properties.
DELIMITER $$

CREATE PROCEDURE RankOwnersByEarningsAndProperties()
BEGIN
    SELECT 
        o.owner_name AS OwnerName,
        COUNT(DISTINCT ow.property_id) AS TotalPropertiesOwned,
        SUM(s.sale_price) AS TotalEarnings
    FROM 
        owners o
    JOIN 
        ownerships ow ON o.owner_id = ow.owner_id
    JOIN 
        sales s ON ow.property_id = s.property_id
    GROUP BY 
        o.owner_id
    ORDER BY 
        TotalEarnings DESC, TotalPropertiesOwned DESC;
END $$

DELIMITER ;




DELIMITER $$

CREATE PROCEDURE GetPropertiesByCity(IN cityName VARCHAR(255))
BEGIN
    SELECT 
        p.property_id AS PropertyID,
        p.address AS PropertyAddress,
        lum.description AS LandUse,
        c.city_name AS City,
        s.sale_price AS SalePrice,
        s.sale_date AS SaleDate
    FROM 
        properties p
    JOIN 
        cities c ON p.city_id = c.city_id
    JOIN 
        land_use_mapping lum ON p.land_use_code = lum.land_use_code
    LEFT JOIN 
        sales s ON p.property_id = s.property_id
    WHERE 
        c.city_name = cityName
    ORDER BY 
        s.sale_date DESC;
END $$

DELIMITER ;

#High ROI: Properties with low sale prices but high appreciation potential.
#Undervalued: Properties sold significantly below market value.
#Strategic locations: Properties in growing or high-demand cities.
DELIMITER $$

CREATE PROCEDURE RecommendPropertiesForInvestment(
    IN minROI DECIMAL(5, 2),
    IN maxSalePrice DECIMAL(15, 2)
)
BEGIN
    SELECT 
        p.property_id AS PropertyID,
        p.address AS PropertyAddress,
        s.sale_price AS SalePrice,
        ((v.total_value - s.sale_price) / s.sale_price) * 100 AS ROI
    FROM 
        properties p
    JOIN 
        sales s ON p.property_id = s.property_id
    JOIN 
        valuation v ON p.property_id = v.property_id
    WHERE 
        ((v.total_value - s.sale_price) / s.sale_price) * 100 >= minROI
        AND s.sale_price <= maxSalePrice
    ORDER BY 
        ROI DESC;
END $$

DELIMITER ;


















