CREATE VIEW RecentSales AS
SELECT 
    s.ParcelID,
    p.PropertyAddress,
    s.SalePrice,
    s.SaleDate,
    o.OwnerName AS Buyer
FROM sales s
JOIN properties p ON s.ParcelID = p.ParcelID
JOIN ownerships os ON p.ParcelID = os.ParcelID
JOIN owners o ON os.OwnerID = o.OwnerID
ORDER BY s.SaleDate DESC
LIMIT 50;

