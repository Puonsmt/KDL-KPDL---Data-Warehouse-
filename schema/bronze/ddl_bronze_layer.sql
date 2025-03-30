IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');
GO
-- Cơ sở dữ liệu văn phòng đại diện 
IF OBJECT_ID ('bronze.dbro_customer' , 'U') IS NOT NULL
	DROP TABLE bronze.dbro_customer;
CREATE TABLE bronze.dbro_customer (
	customer_code VARCHAR(20) PRIMARY KEY,
	customer_name NVARCHAR(50),
	city_code VARCHAR(50),
	first_order_date DATE
);

IF OBJECT_ID ('bronze.dbro_tourist_customer' , 'U') IS NOT NULL
	DROP TABLE bronze.dbro_tourist_customer;
CREATE TABLE bronze.dbro_tourist_customer (
	customer_code VARCHAR(20) PRIMARY KEY,
	tour_guide NVARCHAR(50),
	regis_time DATE,
	FOREIGN KEY (customer_code) REFERENCES bronze.dbro_customer (customer_code)
);

IF OBJECT_ID ('bronze.dbro_postal_customer' , 'U') IS NOT NULL
	DROP TABLE bronze.dbro_postal_customer;
CREATE TABLE bronze.dbro_postal_customer (
	customer_code VARCHAR(20) PRIMARY KEY,
	postal_address NVARCHAR(50),
	regis_time DATE,
	FOREIGN KEY (customer_code) REFERENCES bronze.dbro_customer (customer_code)
);

--Cơ sở dữ liệu bán hàng 
IF OBJECT_ID ('bronze.dbs_representative_office', 'U') IS NOT NULL
	DROP TABLE bronze.dbs_representative_office;
CREATE TABLE bronze.dbs_representative_office (
	city_code VARCHAR(20) PRIMARY KEY,
	city_name NVARCHAR(50),
	office_address NVARCHAR(50),
	state_of_city NVARCHAR(50),
	establishment_time DATE 
);

IF OBJECT_ID ('bronze.dbs_store', 'U') IS NOT NULL 
	DROP TABLE bronze.dbs_store;
CREATE TABLE bronze.dbs_store (
	store_code VARCHAR(20) PRIMARY KEY,
	city_code VARCHAR(20) NOT NULL,
	phone_number VARCHAR(20),
	establishment_time DATE,
	FOREIGN KEY (city_code) REFERENCES bronze.dbs_representative_office (city_code)
);

IF OBJECT_ID ('bronze.dbs_item', 'U') IS NOT NULL
	DROP TABLE bronze.dbs_item;
CREATE TABLE bronze.dbs_item (
	item_code VARCHAR(20) PRIMARY KEY,
	item_desc NVARCHAR(50),
	item_size VARCHAR(10),
	item_weight DECIMAL(10,2),
	item_price INT,
	item_time DATE
);

IF OBJECT_ID ('bronze.dbs_order', 'U') IS NOT NULL
	DROP TABLE bronze.dbs_order;
CREATE TABLE bronze.dbs_order (
	order_code VARCHAR(20) PRIMARY KEY,
	customer_code VARCHAR(20),
	order_date DATE
);

IF OBJECT_ID ('bronze.dbs_inventory_item', 'U') IS NOT NULL
	DROP TABLE bronze.dbs_inventory_item;
CREATE TABLE bronze.dbs_inventory_item (
	store_code VARCHAR(20),
	item_code VARCHAR(20),
	quantity INT,
	storage_time DATE,
	PRIMARY KEY (store_code, item_code),
	FOREIGN KEY (store_code) REFERENCES bronze.dbs_store (store_code),
	FOREIGN KEY (item_code) REFERENCES bronze.dbs_item (item_code)
);

IF OBJECT_ID ('bronze.dbs_order_item', 'U') IS NOT NULL
	DROP TABLE bronze.dbs_order_item;
CREATE TABLE bronze.dbs_order_item (
	order_code VARCHAR(20),
	item_code VARCHAR(20),
	quantity INT,
	price INT,
	order_time DATE,
	PRIMARY KEY (order_code, item_code),
	FOREIGN KEY (order_code) REFERENCES bronze.dbs_order (order_code),
	FOREIGN KEY (item_code) REFERENCES bronze.dbs_item (item_code)
);
