-- Step 1: Foreign key between ownerships and owners
ALTER TABLE ownerships
ADD CONSTRAINT fk_ownership_owner
FOREIGN KEY (OwnerID) REFERENCES owners(OwnerID);

-- Step 2: Foreign key between ownerships and properties
ALTER TABLE ownerships
ADD CONSTRAINT fk_ownership_property
FOREIGN KEY (ParcelID) REFERENCES properties(ParcelID);

-- Step 3: Foreign key between propertytax and properties
ALTER TABLE propertytax
ADD CONSTRAINT fk_propertytax_property
FOREIGN KEY (ParcelID) REFERENCES properties(ParcelID);

-- Step 4: Foreign key between sales and properties
ALTER TABLE sales
ADD CONSTRAINT fk_sales_property
FOREIGN KEY (ParcelID) REFERENCES properties(ParcelID);

-- Step 5: Foreign key between taxdistricts and properties
ALTER TABLE taxdistricts
ADD CONSTRAINT fk_taxdistricts_property
FOREIGN KEY (ParcelID) REFERENCES properties(ParcelID);
