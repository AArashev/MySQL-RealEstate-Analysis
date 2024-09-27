#Process:
#Retrieves the original sale price from the sales table and the current total value from the propertytax table.
#Calculates the appreciation rate based on the difference between the original sale price and the current total value.
#Output: The function returns the appreciation rate as a percentage (DECIMAL(10, 2)).





DELIMITER $$

CREATE FUNCTION CalculateAppreciationRate(ParcelID VARCHAR(50))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE original_price DECIMAL(15, 2);
    DECLARE current_value DECIMAL(15, 2);
    DECLARE appreciation_rate DECIMAL(10, 2);

    -- Get the original sale price and current property value
    SELECT s.SalePrice, t.TotalValue 
    INTO original_price, current_value
    FROM sales s
    JOIN propertytax t ON s.ParcelID = t.ParcelID
    WHERE s.ParcelID = ParcelID
    LIMIT 1;

    -- Calculate the appreciation rate
    SET appreciation_rate = ((current_value - original_price) / original_price) * 100;

    RETURN appreciation_rate;
END $$

DELIMITER ;

SELECT CalculateAppreciationRate('007 00 0 125.00') AS AppreciationRate;
