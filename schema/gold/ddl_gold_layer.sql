IF OBJECT_ID ('gold.dim_city' , 'U') IS NOT NULL
	DROP TABLE gold.dim_city;
CREATE TABLE gold.dim_city (
	city_key VARCHAR(20) PRIMARY KEY,
	city_name NVARCHAR(50),
	state_name NVARCHAR(50),
	office_address NVARCHAR(200)
);
GO

IF OBJECT_ID ('gold.dim_customer' , 'U') IS NOT NULL
	DROP TABLE gold.dim_customer;
CREATE TABLE gold.dim_customer (
	customer_key VARCHAR(20) PRIMARY KEY,
	customer_name NVARCHAR(50),
	city_key VARCHAR(20),
	customer_type NVARCHAR(50),
	tour_guide NVARCHAR(50),
	postal_address NVARCHAR(200),
	FOREIGN KEY (city_key) REFERENCES gold.dim_city (city_key)
);
GO

IF OBJECT_ID ('gold.dim_item' , 'U') IS NOT NULL
	DROP TABLE gold.dim_item;
CREATE TABLE gold.dim_item (
	item_key VARCHAR(20) PRIMARY KEY,
	item_desc NVARCHAR(200),
	item_size NVARCHAR(20),
	item_weight DECIMAL(10,2)
);
GO

IF OBJECT_ID ('gold.dim_store' , 'U') IS NOT NULL
	DROP TABLE gold.dim_store;
CREATE TABLE gold.dim_store (
	store_key VARCHAR(20) PRIMARY KEY,
	city_key VARCHAR(20),
	phone_number VARCHAR(20),
	FOREIGN KEY (city_key) REFERENCES gold.dim_city (city_key)
);
GO

IF OBJECT_ID ('gold.dim_time' , 'U') IS NOT NULL
	DROP TABLE gold.dim_time;
CREATE TABLE gold.dim_time (
	time_key INT IDENTITY(1, 1) PRIMARY KEY,
	time_year INT,
	time_quarter INT,
	time_month INT,
	time_day INT
);
GO

--Cac bang fact 
IF OBJECT_ID ('gold.fact_order' , 'U') IS NOT NULL
	DROP TABLE gold.fact_order;
CREATE TABLE gold.fact_order (
	order_key VARCHAR(20) PRIMARY KEY,
	customer_key VARCHAR(20),
	time_key INT,
	total_amount DECIMAL(20,2),
	FOREIGN KEY (customer_key) REFERENCES gold.dim_customer (customer_key),
	FOREIGN KEY (time_key) REFERENCES gold.dim_time (time_key)
);
GO

IF OBJECT_ID ('gold.fact_order_details' , 'U') IS NOT NULL
	DROP TABLE gold.fact_order_details;
CREATE TABLE gold.fact_order_details (
	order_detail_key INT IDENTITY(1, 1) PRIMARY KEY,
	order_key VARCHAR(20),
	item_key VARCHAR(20),
	store_key VARCHAR(20),
	quantity INT,
	unit_price DECIMAL(20,2),
	line_total AS (quantity * unit_price) PERSISTED,
	FOREIGN KEY (order_key) REFERENCES gold.fact_order (order_key),
	FOREIGN KEY (item_key) REFERENCES gold.dim_item (item_key),
	FOREIGN KEY (store_key) REFERENCES gold.dim_store (store_key)
);
GO

IF OBJECT_ID ('gold.fact_inventory' , 'U') IS NOT NULL
	DROP TABLE gold.fact_inventory;
CREATE TABLE gold.fact_inventory (
	inventory_key INT IDENTITY(1, 1) PRIMARY KEY,
	time_key INT,
	item_key VARCHAR(20),
	store_key VARCHAR(20),
	quantity_on_hand INT,
	FOREIGN KEY (time_key) REFERENCES gold.dim_time (time_key),
	FOREIGN KEY (item_key) REFERENCES gold.dim_item (item_key),
	FOREIGN KEY (store_key) REFERENCES gold.dim_store (store_key)
);
GO
