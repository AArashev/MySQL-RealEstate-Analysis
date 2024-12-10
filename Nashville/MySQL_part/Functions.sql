#3. CalculatePropertyTax
#This function calculates the property tax based on the total value and a tax rate.


DELIMITER $$

CREATE FUNCTION CalculatePropertyTax(propertyID INT, taxRate DECIMAL(5, 2))
RETURNS DECIMAL(15, 2)
DETERMINISTIC
BEGIN
    DECLARE totalValue DECIMAL(15, 2);
    DECLARE taxAmount DECIMAL(15, 2);

    -- Get the total value of the property
    SELECT total_value
    INTO totalValue
    FROM valuation
    WHERE property_id = propertyID;

    -- Calculate tax
    IF totalValue IS NOT NULL THEN
        SET taxAmount = totalValue * (taxRate / 100);
    ELSE
        SET taxAmount = NULL;
    END IF;

    RETURN taxAmount;
END $$

DELIMITER ;









#Function: CalculatePotentialROI
#This function estimates the ROI based on the improvement cost and the projected increase in property value.
#Inputs:
#propertyID: The ID of the property being evaluated.
#improvementCost: The cost of the improvement or renovation.
#Logic:
#Fetches the current total value of the property from the valuation table.
#Assumes a 20% increase in value due to improvements (you can adjust this).
DELIMITER $$

CREATE FUNCTION CalculatePotentialROI(
    propertyID INT,
    improvementCost DECIMAL(15, 2)
)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE currentTotalValue DECIMAL(15, 2);
    DECLARE projectedIncrease DECIMAL(15, 2);
    DECLARE roi DECIMAL(10, 2);

    -- Fetch the current total value of the property
    SELECT total_value
    INTO currentTotalValue
    FROM valuation
    WHERE property_id = propertyID;

    -- Calculate the projected increase in value (assume 20% increase)
    SET projectedIncrease = currentTotalValue * 0.2;

    -- Calculate ROI
    IF currentTotalValue IS NOT NULL THEN
        SET roi = (projectedIncrease - improvementCost) / improvementCost * 100;
    ELSE
        SET roi = NULL;
    END IF;

    RETURN roi;
END $$

DELIMITER ;
