DELIMITER $$

CREATE PROCEDURE GetTotalSalesRevenueByPriceAndDateRange(
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

    -- Retrieve the total sales revenue within the specified price and date range
    SELECT 
        SUM(s.SalePrice) AS TotalSalesRevenue
    FROM sales s
    WHERE s.SalePrice BETWEEN minPrice AND maxPrice
    AND s.SaleDate BETWEEN startDate AND endDate;
END $$

DELIMITER ;
