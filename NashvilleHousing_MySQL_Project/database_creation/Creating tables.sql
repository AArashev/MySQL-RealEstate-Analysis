

SELECT User, Host FROM mysql.user WHERE User = 'your_user';
CREATE USER 'your_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON nashvillehousingdb.* TO 'your_user'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'your_user'@'localhost';



CREATE DATABASE nashvillehousingdb;
USE nashvillehousingdb;
CREATE TABLE owners (
    OwnerID INT AUTO_INCREMENT PRIMARY KEY,
    OwnerName VARCHAR(255),
    OwnerAddress VARCHAR(255)
);

CREATE TABLE ownerships (
    OwnershipID INT AUTO_INCREMENT PRIMARY KEY,
    ParcelID VARCHAR(50),
    OwnerID INT,
    FOREIGN KEY (OwnerID) REFERENCES owners(OwnerID)
);

CREATE TABLE properties (
    PropertyID INT AUTO_INCREMENT PRIMARY KEY,
    ParcelID VARCHAR(50),
    LandUse VARCHAR(50),
    PropertyAddress VARCHAR(255),
    SaleDate DATE,
    SalePrice DECIMAL(15, 2)
);

CREATE TABLE propertytax (
    TaxID INT AUTO_INCREMENT PRIMARY KEY,
    ParcelID VARCHAR(50),
    LandValue DECIMAL(15, 2),
    BuildingValue DECIMAL(15, 2),
    TotalValue DECIMAL(15, 2),
    YearBuilt YEAR
);

CREATE TABLE sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    ParcelID VARCHAR(50),
    SalePrice DECIMAL(15, 2),
    SaleDate DATE
);

CREATE TABLE taxdistricts (
    DistrictID INT AUTO_INCREMENT PRIMARY KEY,
    ParcelID VARCHAR(50),
    DistrictName VARCHAR(100)
);


GRANT ALL PRIVILEGES ON nashvillehousingdb.* TO 'your_user'@'localhost';
FLUSH PRIVILEGES;
-- Ensure you are using the correct database
USE nashvillehousingdb;




SHOW TABLES;


DESCRIBE owners;
DESCRIBE ownerships;
DESCRIBE properties;
DESCRIBE propertytax;
DESCRIBE sales;
DESCRIBE taxdistricts;



SELECT COUNT(*) FROM nashvillehousing;


USE nashvillehousingdb;

-- Create the nashvillehousing table
CREATE TABLE nashvillehousing (
    UniqueID INT PRIMARY KEY,
    ParcelID VARCHAR(50),
    LandUse VARCHAR(50),
    PropertyAddress VARCHAR(255),
    SaleDate DATE,
    SalePrice DECIMAL(15, 2),
    LegalReference VARCHAR(100),
    SoldAsVacant VARCHAR(10),
    OwnerName VARCHAR(255),
    OwnerAddress VARCHAR(255),
    Acreage DECIMAL(10, 2),
    LandValue DECIMAL(15, 2),
    BuildingValue DECIMAL(15, 2),
    TotalValue DECIMAL(15, 2),
    YearBuilt YEAR,
    Bedrooms INT,
    FullBath INT,
    HalfBath INT
);