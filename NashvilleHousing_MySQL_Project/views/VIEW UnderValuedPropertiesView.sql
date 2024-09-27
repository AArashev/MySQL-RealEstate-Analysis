#PropertyPriceDifference(s.ParcelID): Calls the function to calculate the percentage difference for each property.
#UnderValued: Flags the property as 'Yes' if the percentage difference is 30% or more, 'No' otherwise.
#You can modify the 30 in the CASE statement if you want to change the threshold.

#View (UnderValuedPropertiesView): This view uses the function and flags properties as under-valued based on a 30% threshold (or any custom threshold you choose).


CREATE VIEW UnderValuedPropertiesView AS
SELECT 
    s.ParcelID,
    s.SalePrice,
    t.TotalValue,
    PropertyPriceDifference(s.ParcelID) AS PriceDifference,
    CASE 
        WHEN PropertyPriceDifference(s.ParcelID) >= 30 THEN 'Yes'
        ELSE 'No'
    END AS UnderValued
FROM sales s
JOIN propertytax t ON s.ParcelID = t.ParcelID;
