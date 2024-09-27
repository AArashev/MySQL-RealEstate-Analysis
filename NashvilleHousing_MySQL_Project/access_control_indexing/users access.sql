-- Create roles and grant permissions

-- Create a 'sales_agent' user with SELECT privileges
CREATE USER 'sales_agent'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON nashvillehousingdb.* TO 'sales_agent'@'localhost';

-- Create an 'admin' user with full privileges
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON nashvillehousingdb.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

-- Grant full privileges to 'your_user' on the nashvillehousingdb
GRANT ALL PRIVILEGES ON nashvillehousingdb.* TO 'your_user'@'localhost';
FLUSH PRIVILEGES;

-- Verify grants for 'your_user'
SHOW GRANTS FOR 'your_user'@'localhost';

-- Optional: Grant USAGE to 'your_user' (basic connection rights)
GRANT USAGE ON *.* TO 'your_user'@'localhost';
