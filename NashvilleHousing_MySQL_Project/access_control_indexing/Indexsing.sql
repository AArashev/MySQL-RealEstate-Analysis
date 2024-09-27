#Summary of Indexes Added:
#owners: Index on OwnerName, OwnerAddress.
#ownerships: Index on OwnerID, ParcelID.
#properties: Index on ParcelID, SaleDate, SalePrice.
#propertytax: Index on ParcelID, YearBuilt.
#sales: Index on ParcelID, SaleDate.
#taxdistricts: Index on ParcelID, DistrictName.
#Important Note:
#Too many indexes: While indexes improve read/query performance, they can slow down INSERT, UPDATE, and DELETE operations. Indexes should be added based on how frequently a column is used in querying.
#Unique indexes: Consider adding unique indexes if a column or combination of columns must hold unique values.










-- Index on OwnerName
CREATE INDEX idx_owner_name ON owners (OwnerName);

-- Index on OwnerAddress
CREATE INDEX idx_owner_address ON owners (OwnerAddress);


-- Index on OwnerID
CREATE INDEX idx_ownership_ownerid ON ownerships (OwnerID);

-- Index on ParcelID
CREATE INDEX idx_ownership_parcelid ON ownerships (ParcelID);


-- Index on ParcelID
CREATE INDEX idx_properties_parcelid ON properties (ParcelID);

-- Index on SaleDate
CREATE INDEX idx_properties_saledate ON properties (SaleDate);

-- Index on SalePrice
CREATE INDEX idx_properties_saleprice ON properties (SalePrice);


-- Index on ParcelID
CREATE INDEX idx_sales_parcelid ON sales (ParcelID);

-- Index on SaleDate
CREATE INDEX idx_sales_saledate ON sales (SaleDate);


-- Index on ParcelID
CREATE INDEX idx_taxdistricts_parcelid ON taxdistricts (ParcelID);

-- Index on DistrictName
CREATE INDEX idx_taxdistricts_districtname ON taxdistricts (DistrictName);
