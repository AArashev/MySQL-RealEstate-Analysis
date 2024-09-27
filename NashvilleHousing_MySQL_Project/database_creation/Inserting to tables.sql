-- Insert distinct owners and addresses into the owners table
INSERT INTO owners (OwnerName, OwnerAddress)
SELECT DISTINCT OwnerName, OwnerAddress
FROM nashvillehousing;

-- Insert data into ownerships table by matching OwnerID
INSERT INTO ownerships (ParcelID, OwnerID)
SELECT nh.ParcelID, o.OwnerID
FROM nashvillehousing nh
JOIN owners o
  ON nh.OwnerName = o.OwnerName AND nh.OwnerAddress = o.OwnerAddress;


-- Insert data into properties table
INSERT INTO properties (ParcelID, LandUse, PropertyAddress, SaleDate, SalePrice)
SELECT ParcelID, LandUse, PropertyAddress, SaleDate, SalePrice
FROM nashvillehousing;


-- Insert data into propertytax table
INSERT INTO propertytax (ParcelID, LandValue, BuildingValue, TotalValue, YearBuilt)
SELECT ParcelID, LandValue, BuildingValue, TotalValue, YearBuilt
FROM nashvillehousing;


-- Insert data into sales table
INSERT INTO sales (ParcelID, SalePrice, SaleDate)
SELECT ParcelID, SalePrice, SaleDate
FROM nashvillehousing;

-- Insert data into taxdistricts table (using placeholder for DistrictName)
INSERT INTO taxdistricts (ParcelID, DistrictName)
SELECT DISTINCT ParcelID, 'Unknown'  -- Placeholder for DistrictName
FROM nashvillehousing;


DROP TABLE nashvillehousing;
