USE master;
GO

-- Kiem tra xem da co csdl 'btl_dw' hay chua 
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'btl_dw')
BEGIN
	ALTER DATABASE btl_dw SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
END;
GO 

-- Tao csdl ten la DataWarehouse
CREATE DATABASE btl_dw; 
GO

USE btl_dw; 
GO

-- Tao ra cac schema 
CREATE SCHEMA bronze; 
GO
  
CREATE SCHEMA silver; 
GO
  
CREATE SCHEMA gold; 
GO
