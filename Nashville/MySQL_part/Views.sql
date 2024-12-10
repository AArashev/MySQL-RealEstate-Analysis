use nashville_housing;
#1. View: RecentHighValueSales
#This view identifies properties sold above a specified price threshold.
CREATE VIEW RecentHighValueSales AS
SELECT 
    p.property_id, 
    p.address, 
    s.sale_price, 
    s.sale_date
FROM 
    properties p
JOIN 
    sales s ON p.property_id = s.property_id
WHERE 
    s.sale_price > 500000 -- Adjust threshold as needed
ORDER BY 
    s.sale_date DESC;

#2. View: RecentSales
#This view lists the 50 most recent property sales.
CREATE VIEW RecentSales AS
SELECT 
    p.property_id, 
    p.address, 
    s.sale_price, 
    s.sale_date
FROM 
    properties p
JOIN 
    sales s ON p.property_id = s.property_id
ORDER BY 
    s.sale_date DESC
LIMIT 50;


#3. View: SalesTrends
CREATE VIEW SalesTrends AS
SELECT 
    YEAR(s.sale_date) AS sale_year, 
    AVG(s.sale_price) AS avg_sale_price
FROM 
    sales s
GROUP BY 
    YEAR(s.sale_date)
ORDER BY 
    sale_year;
#4. View: UnderValuedPropertiesView
#This view identifies properties sold below their total valuation by at least 30%.

CREATE VIEW UnderValuedPropertiesView AS
SELECT 
    p.property_id, 
    p.address, 
    s.sale_price, 
    v.total_value,
    CASE 
        WHEN s.sale_price < v.total_value * 0.7 THEN 'Yes'
        ELSE 'No'
    END AS undervalued
FROM 
    properties p
JOIN 
    sales s ON p.property_id = s.property_id
JOIN 
    valuation v ON p.property_id = v.property_id
WHERE 
    s.sale_price < v.total_value * 0.7;







#Advanced View: HighValueSalesByDistrict
#This view identifies high-value property sales grouped by
#tax district, including total sales, average sale price, 
#and the number of high-value transactions.
CREATE VIEW HighValueSalesByDistrict AS
SELECT 
    td.district_id AS TaxDistrictID,
    td.district_name AS TaxDistrictName,
    COUNT(s.sale_id) AS HighValueTransactions,
    SUM(s.sale_price) AS TotalHighValueSales,
    AVG(s.sale_price) AS AvgSalePrice
FROM 
    sales s
JOIN 
    properties p ON s.property_id = p.property_id
JOIN 
    taxdistricts td ON p.city_id = td.district_id -- Replace with the correct join column
WHERE 
    s.sale_price > (
        SELECT AVG(sale_price) * 1.5 FROM sales -- High-value threshold: 50% above the average sale price
    )
GROUP BY 
    td.district_id, td.district_name
ORDER BY 
    TotalHighValueSales DESC;

#View: HighValueSalesByPropertyTypeAndCity
#This view identifies high-value property sales grouped by property type (land_use_mapping) and city,
#providing insights into property types and locations contributing to significant transactions.
CREATE VIEW HighValueSalesByPropertyTypeAndCity AS
SELECT 
    c.city_name AS City,
    lum.description AS PropertyType,
    COUNT(s.sale_id) AS HighValueTransactions,
    SUM(s.sale_price) AS TotalHighValueSales,
    AVG(s.sale_price) AS AvgSalePrice
FROM 
    sales s
JOIN 
    properties p ON s.property_id = p.property_id
JOIN 
    land_use_mapping lum ON p.land_use_code = lum.land_use_code
JOIN 
    cities c ON p.city_id = c.city_id
WHERE 
    s.sale_price > (
        SELECT AVG(sale_price) * 1.5 FROM sales -- High-value threshold: 50% above the average sale price
    )
GROUP BY 
    c.city_name, lum.description
ORDER BY 
    TotalHighValueSales DESC;


#Advanced View: YearlyPropertyAppreciation
#This view calculates the yearly appreciation rate for properties by comparing sale prices over different years.
CREATE VIEW YearlyPropertyAppreciation AS
SELECT 
    p.property_id AS PropertyID,
    p.address AS PropertyAddress,
    YEAR(s1.sale_date) AS YearStart,
    YEAR(s2.sale_date) AS YearEnd,
    s1.sale_price AS StartPrice,
    s2.sale_price AS EndPrice,
    ((s2.sale_price - s1.sale_price) / s1.sale_price) * 100 AS AppreciationRate
FROM 
    sales s1
JOIN 
    sales s2 ON s1.property_id = s2.property_id
JOIN 
    properties p ON s1.property_id = p.property_id
WHERE 
    YEAR(s2.sale_date) > YEAR(s1.sale_date)
ORDER BY 
    AppreciationRate DESC;
    
    
    
    
    
    
    