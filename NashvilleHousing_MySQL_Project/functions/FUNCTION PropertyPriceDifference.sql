#Take ParcelID as input.
#Compare the current sale price (from the sales table) 
#with the market value (from the propertytax table).
#Flag the property if the sale price is significantly 
#lower (by 30%) than the estimated market value.
#This function will return a percentage indicating how much below market value the property is priced.
#Function (PropertyPriceDifference): This function returns the percentage difference between a property’s sale price and market value.
DELIMITER $$

CREATE FUNCTION PropertyPriceDifference(ParcelID VARCHAR(50))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE sale_price DECIMAL(15, 2);
    DECLARE market_value DECIMAL(15, 2);
    DECLARE price_difference DECIMAL(10, 2);

    -- Get the current sale price and market value
    SELECT s.SalePrice, t.TotalValue 
    INTO sale_price, market_value
    FROM sales s
    JOIN propertytax t ON s.ParcelID = t.ParcelID
    WHERE s.ParcelID = ParcelID
    LIMIT 1;

    -- Calculate the percentage difference between sale price and market value
    SET price_difference = ((market_value - sale_price) / market_value) * 100;

    RETURN price_difference;
END $$

DELIMITER ;
SELECT PropertyPriceDifference('007 00 0 125.00') AS PriceDifference;
