![Diagram 1](https://github.com/user-attachments/assets/610db20f-abd6-431e-ba4b-016535d7897c)

##Nashville Housing Data Insights and Predictive Analytics Repository

Project Overview
This repository contains a comprehensive data analytics project to provide insights into the Nashville housing market. Using machine learning algorithms, it integrates real estate transaction data, valuation metrics, and predictive modeling. The repository is built to support real estate professionals, investors, and researchers in analyzing market trends, forecasting property prices, and identifying investment opportunities.

Key Features
Data Integration:

Real estate transaction data (sales, valuations, features, ownership).
Geospatial data for city and neighborhood analysis.
Predictive outputs using machine learning models (XGBoost and ANN).
Predictive Modeling:

XGBoost and Artificial Neural Networks (ANN) for price prediction.
SHAP analysis to identify feature importance.
Visualization:

Tableau dashboards to visualize trends, predictions, and neighborhood-level analyses.
Database Design:

A relational database structure was built with MySQL, including normalized tables and metadata fields.
Repository Contents
SQL Scripts:

Database creation and table setup.
Data insertion and queries for analysis.
Machine Learning Models:

Python scripts for data preprocessing, model training, and predictions.
Integrated predictions stored in MySQL tables (xgpredictions and predictions).
Visualization Files:

Tableau dashboards for exploring property trends and market insights.
EER Diagram:

Entity-Relationship Diagram for database schema.
Database Schema
The database includes the following key tables:

properties: Stores property-level data such as address, parcel ID, and state.
sales: Records sale details, including date, price, and price per square foot.
valuation: Includes land, building, and total valuations with valuation-to-sale price ratios.
features: Contains property characteristics like year built, bedrooms, and bathrooms.
ownerships: Tracks ownership information for each property.
predictions: Stores predictions from ANN models.
xgpredictions: Stores predictions from XGBoost models.
Visualizations
This project includes interactive dashboards created with Tableau:

Average Price Per Square Foot by Neighborhood: Displays geographic pricing trends.
Average Sale Price by Neighborhood: Highlights price variations across neighborhoods.
SHAP Feature Importance: Shows the key factors influencing property sale prices.
Price Trends by Year Built: Analyzes price changes based on property age.
How to Use the Repository
Clone the repository:
git clone https://github.com/AArashev/MySQL-RealEstate-Analysis

Set up the MySQL database using the provided SQL scripts.
Use the Python scripts to preprocess data, train models, and update predictions in the database.
Explore insights through the Tableau dashboards or execute SQL queries for custom analyses.
Requirements
Software
MySQL 8.0+
Python 3.8+
Tableau (for visualizations)
Python Libraries
Pandas
NumPy
Scikit-learn
XGBoost
TensorFlow/Keras
PyMySQL
SHAP
Future Enhancements
Develop APIs for real-time data retrieval and predictions.
Expand geospatial clustering for more detailed neighborhood insights.
Incorporate ensemble models to improve prediction accuracy.
Automate metadata updates for new data entries.
Contributors
Atajan Arashev
Email: arashevatajan@gmail.com
GitHub: AArashev
References
Arashev, A. (2024). MySQL Real Estate Analysis Repository. GitHub. Retrieved from https://github.com/AArashev/MySQL-RealEstate-Analysis
Stratify Workflows. (2024, March 20). How to use workflows for collaborative budgeting. Stratify Blog. Retrieved from https://www.stratifytech.com/blog/how-to-use-workflows-for-collaborative-budgeting
