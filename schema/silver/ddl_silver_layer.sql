IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');
GO
-- Cơ sở dữ liệu tích hợp  
IF OBJECT_ID ('silver.dbi_representative_office', 'U') IS NOT NULL
	DROP TABLE silver.dbi_representative_office;
CREATE TABLE silver.dbi_representative_office (
	city_code VARCHAR(20) PRIMARY KEY,
	city_name NVARCHAR(50),
	office_address NVARCHAR(50),
	state_of_city NVARCHAR(50),
	establishment_time DATE 
);
GO

IF OBJECT_ID ('silver.dbi_store', 'U') IS NOT NULL 
	DROP TABLE silver.dbi_store;
CREATE TABLE silver.dbi_store (
	store_code VARCHAR(20) PRIMARY KEY,
	city_code VARCHAR(20) NOT NULL,
	phone_number VARCHAR(20),
	establishment_time DATE,
	FOREIGN KEY (city_code) REFERENCES silver.dbi_representative_office (city_code)
);
GO

IF OBJECT_ID ('silver.dbi_customer' , 'U') IS NOT NULL
	DROP TABLE silver.dbi_customer;
CREATE TABLE silver.dbi_customer (
	customer_code VARCHAR(20) PRIMARY KEY,
	customer_name NVARCHAR(50),
	city_code VARCHAR(20),
	first_order_date DATE,
	FOREIGN KEY (city_code) REFERENCES silver.dbi_representative_office (city_code)
);
GO

IF OBJECT_ID ('silver.dbi_tourist_customer' , 'U') IS NOT NULL
	DROP TABLE silver.dbi_tourist_customer;
CREATE TABLE silver.dbi_tourist_customer (
	customer_code VARCHAR(20) PRIMARY KEY,
	tour_guide NVARCHAR(50),
	regis_time DATE,
	FOREIGN KEY (customer_code) REFERENCES silver.dbi_customer (customer_code)
);
GO

IF OBJECT_ID ('silver.dbi_postal_customer' , 'U') IS NOT NULL
	DROP TABLE silver.dbi_postal_customer;
CREATE TABLE silver.dbi_postal_customer (
	customer_code VARCHAR(20) PRIMARY KEY,
	postal_address NVARCHAR(50),
	regis_time DATE,
	FOREIGN KEY (customer_code) REFERENCES silver.dbi_customer (customer_code)
);
GO

IF OBJECT_ID ('silver.dbi_item', 'U') IS NOT NULL
	DROP TABLE silver.dbi_item;
CREATE TABLE silver.dbi_item (
	item_code VARCHAR(20) PRIMARY KEY,
	item_desc NVARCHAR(50),
	item_size VARCHAR(10),
	item_weight DECIMAL(10,2),
	item_price INT,
	item_time DATE
);
GO

IF OBJECT_ID ('silver.dbi_order', 'U') IS NOT NULL
	DROP TABLE silver.dbi_order;
CREATE TABLE silver.dbi_order (
	order_code VARCHAR(20) PRIMARY KEY,
	customer_code VARCHAR(20),
	order_date DATE,
	FOREIGN KEY (customer_code) REFERENCES silver.dbi_customer (customer_code)
);
GO

IF OBJECT_ID ('silver.dbi_inventory_item', 'U') IS NOT NULL
	DROP TABLE silver.dbi_inventory_item;
CREATE TABLE silver.dbi_inventory_item (
	store_code VARCHAR(20),
	item_code VARCHAR(20),
	quantity INT,
	storage_time DATE,
	PRIMARY KEY (store_code, item_code),
	FOREIGN KEY (store_code) REFERENCES silver.dbi_store (store_code),
	FOREIGN KEY (item_code) REFERENCES silver.dbi_item (item_code)
);
GO

IF OBJECT_ID ('silver.dbi_order_item', 'U') IS NOT NULL
	DROP TABLE silver.dbi_order_item;
CREATE TABLE silver.dbi_order_item (
	order_code VARCHAR(20),
	item_code VARCHAR(20),
	quantity INT,
	price INT,
	order_time DATE,
	PRIMARY KEY (order_code, item_code),
	FOREIGN KEY (order_code) REFERENCES silver.dbi_order (order_code),
	FOREIGN KEY (item_code) REFERENCES silver.dbi_item (item_code)
);
GO
