# MySQL-RealEstate-Analysis
A comprehensive MySQL database project analyzing the Nashville housing market. Includes normalized tables, stored procedures, dynamic views, and role-based access to uncover sales trends, ownership patterns, and value changes. Integrated with Python and Tableau for data import, visualization, and advanced insights for real estate analysis
![image](https://github.com/user-attachments/assets/042f6200-a264-4a5c-8ea9-0dba24d962bf)
Relationships:
One-to-One: properties ↔ propertytax, properties ↔ taxdistricts
One-to-Many: properties ↔ ownerships, owners ↔ ownerships, properties ↔ sales
Many-to-One: ownerships ↔ owners, sales ↔ properties


*Business Rules*
Owners: 
 Each owner has a unique OwnerID
Each owner must have a name and address
Ownership: 
Each ownership has a unique OwnershipID
Each owner can have one or many ownerships
Each ownership has a ParcelID and OwnerID
Property: 
A property can have one or many ownerships
A property can be located in one or many districts
A property can have one or many sales
Each property has a ParcelID
Each property has land use, an address, sale date, and sale price
Property Tax: 
Each property tax has a unique TaxID
Each property tax is associated with one and only one parcel
Each property tax is associated with a unique ParcelID 
Each property tax has land value, building value, total value, and year built
Sales: 
Each sale has a unique SaleID
Each sale is associated with a unique ParcelID
Each sale has a sale date and price 
Tax District:
Each tax district has a unique DistrictID.
Each property is associated with one tax district.
Each tax district has a name.








*5 Key Objectives*

1.	Consolidate and Organize Real Estate Data: The primary objective of the database is to provide a centralized system that consolidates property, owner, sales, tax, and district information. This ensures a structured and organized approach to storing Nashville's real estate data, improving accessibility and accuracy for data management.

2.	Support Historical and Market Trend Analysis: The database enables tracking of historical property values and sales trends over time, which supports analysis of property appreciation, market fluctuations, and investment potential. This historical data is valuable for market analysts and investors seeking to understand long-term property performance.

3.	Enable Ownership and Property Management: By establishing relationships between owners and their properties, the database facilitates effective management of ownership records, including cases of multi-property ownership. This feature aids in understanding property distribution among owners and identifying significant property holders.

4.	Incorporate Tax and District Information for Financial Insights: Integrating tax district information and property valuations allows users to evaluate properties within specific tax jurisdictions. This feature is essential for financial analysis, as it provides insights into the impact of local tax rates and district characteristics on property values.

5.	Provide Analytical Tools for Informed Decision-Making: With built-in functions, stored procedures, and views, the database supports complex analyses, such as identifying undervalued properties, ranking owners by earnings, and tracking recent high-value sales. These tools empower users to make data-driven decisions on property investments, pricing, and market strategies.

