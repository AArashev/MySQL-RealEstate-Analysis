##This view provides an overview of recently sold high-value properties (properties sold for more than $300,000)
##ParcelID & PropertyAddress: The unique ID and address of the property.
#SalePrice: The price the property was sold for.
#MarketValue: The current market value of the property from the propertytax table.
#ValueDifference: The difference between the current market value and the sale price, showing how much the property's value has changed.
#GrowthSinceSale: The percentage increase (or decrease) in property value since the sale.

CREATE VIEW RecentHighValueSales AS
SELECT 
    p.ParcelID,
    p.PropertyAddress,
    s.SalePrice,
    t.TotalValue AS MarketValue,
    s.SaleDate,
    (t.TotalValue - s.SalePrice) AS ValueDifference,
    ((t.TotalValue - s.SalePrice) / s.SalePrice) * 100 AS GrowthSinceSale
FROM properties p
JOIN sales s ON p.ParcelID = s.ParcelID
JOIN propertytax t ON p.ParcelID = t.ParcelID
WHERE s.SalePrice > 300000 -- You can adjust this threshold for high-value sales
ORDER BY s.SaleDate DESC;



