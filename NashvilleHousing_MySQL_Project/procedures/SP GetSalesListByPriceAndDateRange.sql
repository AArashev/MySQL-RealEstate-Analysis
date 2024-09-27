#Price Range: You can set a minimum and maximum sale price, or leave them empty to include all prices.
#Date Range: You can specify a start and end date to see sales within a certain period. If you only give one date, it will show sales for that specific day



DELIMITER $$

CREATE PROCEDURE GetSalesListByPriceAndDateRange(
    IN minPrice DECIMAL(15, 2), 
    IN maxPrice DECIMAL(15, 2),
    IN startDate DATE, 
    IN endDate DATE
)
BEGIN
    -- Handle missing price range
    IF minPrice IS NULL THEN
        SET minPrice = 0; -- Default minimum price
    END IF;
    IF maxPrice IS NULL THEN
        SET maxPrice = 9999999999; -- Very high value to ensure no upper limit
    END IF;

    -- Handle missing date range
    IF startDate IS NOT NULL AND endDate IS NULL THEN
        SET endDate = startDate;
    ELSEIF startDate IS NULL AND endDate IS NOT NULL THEN
        SET startDate = endDate;
    END IF;

    -- Retrieve a list of sales within the specified price and date range
    SELECT 
        s.ParcelID,
        s.SalePrice,
        s.SaleDate,
        p.PropertyAddress
    FROM sales s
    JOIN properties p ON s.ParcelID = p.ParcelID
    WHERE s.SalePrice BETWEEN minPrice AND maxPrice
    AND s.SaleDate BETWEEN startDate AND endDate
    ORDER BY s.SaleDate ASC;
END $$


