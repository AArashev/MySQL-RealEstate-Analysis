CREATE VIEW SalesTrends AS
SELECT YEAR(SaleDate) AS Year, AVG(SalePrice) AS AvgPrice
FROM sales
GROUP BY YEAR(SaleDate)
ORDER BY Year;
