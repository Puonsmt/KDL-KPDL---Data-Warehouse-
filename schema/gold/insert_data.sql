-- Thêm dữ liệu vào bảng dim_city
INSERT INTO gold.dim_city (city_key, city_name, state_name) VALUES
('CITY001', N'Hà Nội', N'Thủ đô'),
('CITY002', N'Hồ Chí Minh', N'Miền Nam'),
('CITY003', N'Đà Nẵng', N'Miền Trung'),
('CITY004', N'Hải Phòng', N'Miền Bắc'),
('CITY005', N'Cần Thơ', N'Miền Tây'),
('CITY006', N'Nha Trang', N'Khánh Hòa'),
('CITY007', N'Huế', N'Thừa Thiên Huế'),
('CITY008', N'Vũng Tàu', N'Bà Rịa - Vũng Tàu'),
('CITY009', N'Đà Lạt', N'Lâm Đồng'),
('CITY010', N'Hạ Long', N'Quảng Ninh');

GO
-- Thêm dữ liệu vào bảng dim_customer
INSERT INTO gold.dim_customer (customer_key, customer_name, city_key, customer_type) VALUES
('CUST001', N'Nguyễn Văn An', 'CITY001', N'Cá nhân'),
('CUST002', N'Trần Thị Bình', 'CITY002', N'Cá nhân'),
('CUST003', N'Công ty XYZ', 'CITY001', N'Doanh nghiệp'),
('CUST004', N'Phạm Hải Đăng', 'CITY003', N'Cá nhân'),
('CUST005', N'Tập đoàn ABC', 'CITY002', N'Doanh nghiệp'),
('CUST006', N'Lê Thị Mai', 'CITY004', N'Cá nhân'),
('CUST007', N'Công ty DEF', 'CITY005', N'Doanh nghiệp'),
('CUST008', N'Nguyễn Minh Tuấn', 'CITY006', N'Cá nhân'),
('CUST009', N'Vũ Thành Công', 'CITY007', N'Cá nhân'),
('CUST010', N'Tập đoàn GHI', 'CITY001', N'Doanh nghiệp'),
('CUST011', N'Hoàng Thị Hạnh', 'CITY008', N'Cá nhân'),
('CUST012', N'Công ty JKL', 'CITY002', N'Doanh nghiệp'),
('CUST013', N'Trương Văn Nam', 'CITY009', N'Cá nhân'),
('CUST014', N'Đỗ Thị Quỳnh', 'CITY010', N'Cá nhân'),
('CUST015', N'Công ty MNO', 'CITY003', N'Doanh nghiệp');

GO
-- Thêm dữ liệu vào bảng dim_item
INSERT INTO gold.dim_item (item_key, item_desc, item_size, item_weight) VALUES
('ITEM001', N'Điện thoại Samsung Galaxy S21', N'Medium', 0.17),
('ITEM002', N'Laptop Dell XPS 13', N'Large', 1.27),
('ITEM003', N'Tai nghe AirPods Pro', N'Small', 0.05),
('ITEM004', N'Tivi Sony 55 inch', N'Extra Large', 18.70),
('ITEM005', N'Máy giặt LG 8kg', N'Extra Large', 65.00),
('ITEM006', N'Tủ lạnh Panasonic 200L', N'Extra Large', 55.30),
('ITEM007', N'Đồng hồ thông minh Apple Watch', N'Small', 0.03),
('ITEM008', N'Bàn làm việc gỗ', N'Large', 25.00),
('ITEM009', N'Ghế văn phòng', N'Medium', 8.50),
('ITEM010', N'Máy ảnh Canon EOS', N'Medium', 0.75),
('ITEM011', N'Máy tính bảng iPad Pro', N'Medium', 0.47),
('ITEM012', N'Bộ nồi inox', N'Medium', 3.20),
('ITEM013', N'Máy lọc không khí', N'Medium', 5.80),
('ITEM014', N'Quạt điều hòa', N'Large', 7.50),
('ITEM015', N'Bàn phím cơ', N'Small', 0.95);

GO
-- Thêm dữ liệu vào bảng dim_store
INSERT INTO gold.dim_store (store_key, city_key) VALUES
('STORE001', 'CITY001'),
('STORE002', 'CITY002'),
('STORE003', 'CITY003'),
('STORE004', 'CITY001'),
('STORE005', 'CITY002'),
('STORE006', 'CITY004'),
('STORE007', 'CITY005'),
('STORE008', 'CITY006'),
('STORE009', 'CITY007'),
('STORE010', 'CITY008');

GO
-- Thêm dữ liệu vào bảng dim_time
INSERT INTO gold.dim_time (time_year, time_quarter, time_month) VALUES
(2023, 1, 1),
(2023, 1, 2),
(2023, 1, 3),
(2023, 2, 4),
(2023, 2, 5),
(2023, 2, 6),
(2023, 3, 7),
(2023, 3, 8),
(2023, 3, 9),
(2023, 4, 10),
(2023, 4, 11),
(2023, 4, 12),
(2024, 1, 1),
(2024, 1, 2),
(2024, 1, 3),
(2024, 2, 4);

GO
-- Thêm dữ liệu vào bảng dim_order
INSERT INTO gold.dim_order (order_key) VALUES
('ORDER001'),
('ORDER002'),
('ORDER003'),
('ORDER004'),
('ORDER005'),
('ORDER006'),
('ORDER007'),
('ORDER008'),
('ORDER009'),
('ORDER010'),
('ORDER011'),
('ORDER012'),
('ORDER013'),
('ORDER014'),
('ORDER015'),
('ORDER016'),
('ORDER017'),
('ORDER018'),
('ORDER019'),
('ORDER020');

GO
-- Thêm dữ liệu vào bảng fact_sales
INSERT INTO gold.fact_sales (order_key, customer_key, store_key, item_key, time_key, quantity, total_amount) VALUES
('ORDER001', 'CUST001', 'STORE001', 'ITEM001', 1, 2, 30000000.00),
('ORDER002', 'CUST002', 'STORE002', 'ITEM002', 2, 1, 25000000.00),
('ORDER003', 'CUST003', 'STORE001', 'ITEM003', 3, 5, 5000000.00),
('ORDER004', 'CUST004', 'STORE003', 'ITEM004', 4, 1, 15000000.00),
('ORDER005', 'CUST005', 'STORE002', 'ITEM005', 5, 1, 12000000.00),
('ORDER006', 'CUST006', 'STORE004', 'ITEM006', 6, 1, 10000000.00),
('ORDER007', 'CUST007', 'STORE005', 'ITEM001', 7, 3, 45000000.00),
('ORDER008', 'CUST008', 'STORE006', 'ITEM007', 8, 2, 20000000.00),
('ORDER009', 'CUST009', 'STORE007', 'ITEM008', 9, 1, 5000000.00),
('ORDER010', 'CUST010', 'STORE001', 'ITEM009', 10, 4, 8000000.00),
('ORDER011', 'CUST001', 'STORE001', 'ITEM010', 11, 1, 18000000.00),
('ORDER012', 'CUST003', 'STORE004', 'ITEM011', 12, 1, 22000000.00),
('ORDER013', 'CUST011', 'STORE008', 'ITEM012', 13, 2, 3000000.00),
('ORDER014', 'CUST012', 'STORE002', 'ITEM013', 14, 1, 7000000.00),
('ORDER015', 'CUST013', 'STORE009', 'ITEM014', 15, 2, 4000000.00),
('ORDER016', 'CUST014', 'STORE010', 'ITEM015', 16, 3, 4500000.00),
('ORDER017', 'CUST015', 'STORE003', 'ITEM001', 1, 1, 15000000.00),
('ORDER018', 'CUST007', 'STORE005', 'ITEM005', 5, 1, 12000000.00),
('ORDER019', 'CUST009', 'STORE007', 'ITEM006', 9, 1, 10000000.00),
('ORDER020', 'CUST002', 'STORE002', 'ITEM010', 13, 1, 18000000.00);

GO
-- Thêm dữ liệu vào bảng fact_inventory
INSERT INTO gold.fact_inventory (time_key, item_key, store_key, quantity_on_hand) VALUES
(1, 'ITEM001', 'STORE001', 20),
(1, 'ITEM002', 'STORE001', 10),
(1, 'ITEM003', 'STORE001', 30),
(2, 'ITEM001', 'STORE002', 15),
(2, 'ITEM002', 'STORE002', 8),
(2, 'ITEM003', 'STORE002', 25),
(3, 'ITEM001', 'STORE003', 18),
(3, 'ITEM004', 'STORE003', 5),
(3, 'ITEM005', 'STORE003', 7),
(4, 'ITEM001', 'STORE001', 17),
(4, 'ITEM002', 'STORE001', 9),
(5, 'ITEM003', 'STORE002', 20),
(5, 'ITEM004', 'STORE002', 4),
(6, 'ITEM005', 'STORE003', 6),
(6, 'ITEM006', 'STORE003', 8),
(7, 'ITEM007', 'STORE004', 15),
(7, 'ITEM008', 'STORE004', 10),
(8, 'ITEM009', 'STORE005', 20),
(8, 'ITEM010', 'STORE005', 5),
(9, 'ITEM011', 'STORE006', 12),
(9, 'ITEM012', 'STORE006', 18),
(10, 'ITEM013', 'STORE007', 7),
(10, 'ITEM014', 'STORE007', 9),
(11, 'ITEM015', 'STORE008', 25),
(11, 'ITEM001', 'STORE008', 12),
(12, 'ITEM002', 'STORE009', 8),
(12, 'ITEM003', 'STORE009', 15),
(13, 'ITEM004', 'STORE010', 6),
(13, 'ITEM005', 'STORE010', 4),
(14, 'ITEM006', 'STORE001', 7),
(14, 'ITEM007', 'STORE001', 14),
(15, 'ITEM008', 'STORE002', 9),
(15, 'ITEM009', 'STORE002', 11),
(16, 'ITEM010', 'STORE003', 8),
(16, 'ITEM011', 'STORE003', 7);
