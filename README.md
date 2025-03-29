# Kho Dữ Liệu Hệ Thống Xử Lý Đặt Hàng

## **Giới thiệu:**

Repository này chứa mã nguồn và tài liệu cho dự án thiết kế và cài đặt kho dữ liệu (Data Warehouse) phục vụ hệ thống xử lý đặt hàng của khách hàng. Hệ thống kho dữ liệu được xây dựng để tích hợp dữ liệu từ nhiều nguồn khác nhau, cung cấp khả năng phân tích trực tuyến (OLAP) và hỗ trợ ra quyết định kinh doanh.

## **Thông tin kỹ thuật:**

- **Công nghệ sử dụng:** MS SQL Server
- **Loại dự án:** Kho dữ liệu (Data Warehouse)
- **Phương pháp thiết kế:** Lược đồ hình sao (Star Schema)
- **Nguồn dữ liệu:** CSDL Văn phòng đại diện và CSDL Bán hàng (tự sinh dữ liệu)

## **Cấu trúc repository:**

```
├── docs/                       # Tài liệu dự án
│   ├── requirements/           # Yêu cầu nghiệp vụ và đặc tả chức năng
│   ├── design/                 # Thiết kế kho dữ liệu
│   ├── reports/                # Báo cáo và tài liệu thuyết trình
│   └── images/                 # Hình ảnh và sơ đồ
│
├── src/                        # Mã nguồn
│   ├── ddl/                    # Data Definition Language scripts
│   │   ├── mssql/              # Scripts cho MS SQL Server
│   │   └── oracle/             # Scripts cho Oracle
│   │
│   ├── etl/                    # Extract-Transform-Load scripts
│   │   ├── extract/            # Scripts trích xuất dữ liệu
│   │   ├── transform/          # Scripts biến đổi dữ liệu
│   │   └── load/               # Scripts nạp dữ liệu
│   │
│   ├── olap/                   # OLAP queries và reports
│   │   ├── cubes/              # Định nghĩa các khối dữ liệu
│   │   └── queries/            # Các truy vấn phân tích
│   │
│   └── test/                   # Scripts kiểm thử
│
├── data/                       # Dữ liệu mẫu
│   ├── sample/                 # Dữ liệu mẫu cho kiểm thử
│   └── production/             # Dữ liệu thực tế (nếu có)
│
├── tools/                      # Công cụ và tiện ích
│   ├── data_generator/         # Scripts tạo dữ liệu mẫu
│   └── validation/             # Scripts kiểm tra tính đúng đắn
│
├── schema/                     # Lược đồ cơ sở dữ liệu
│   ├── source/                 # Lược đồ nguồn
│   └── warehouse/              # Lược đồ kho dữ liệu
│
└── README.md                   # Tài liệu chính
```

## **Tổng quan dữ liệu:**

### **Nguồn dữ liệu:**

1. **CSDL Văn phòng đại diện:**
   - Khách hàng (Mã KH, Tên KH, Mã Thành phố, Ngày đặt hàng đầu tiên)
   - Khách hàng du lịch (Mã KH, Hướng dẫn viên du lịch, Thời gian)
   - Khách hàng bưu điện (Mã KH, Địa chỉ bưu điện, Thời gian)

2. **CSDL Bán hàng:**
   - Văn phòng đại diện (Mã Thành phố, Tên Thành phố, Địa chỉ VP, Bang, Thời gian)
   - Cửa hàng (Mã cửa hàng, Mã Thành phố, Số điện thoại, Thời gian)
   - Mặt hàng (Mã MH, Mô tả, Kích cỡ, Trọng lượng, Giá, Thời gian)
   - Mặt hàng_được lưu trữ (Mã cửa hàng, Mã mặt hàng, Số lượng trong kho, Thời gian)
   - Đơn đặt hàng (Mã đơn, Ngày đặt hàng, Mã Khách hàng)
   - Mặt hàng được đặt (Mã đơn, Mã mặt hàng, Số lượng đặt, Giá đặt, Thời gian)

## **Yêu cầu nghiệp vụ:**

Hệ thống kho dữ liệu cần hỗ trợ các truy vấn phân tích sau:

1. Tìm thông tin cửa hàng và mặt hàng được bán
2. Truy vấn đơn đặt hàng theo khách hàng
3. Tìm cửa hàng bán mặt hàng được đặt bởi một khách hàng cụ thể
4. Tìm văn phòng đại diện của cửa hàng lưu kho mặt hàng với số lượng trên mức cụ thể
5. Liệt kê chi tiết mặt hàng trong đơn hàng và cửa hàng bán
6. Tìm thành phố và bang của khách hàng
7. Kiểm tra tồn kho của mặt hàng tại cửa hàng trong thành phố
8. Truy vấn chi tiết đơn đặt hàng
9. Phân tích phân loại khách hàng


## **Quy trình phát triển:**

1. **Thiết kế kho dữ liệu:** Sử dụng lược đồ hình sao phù hợp với yêu cầu nghiệp vụ
2. **Cài đặt cấu trúc:** Tạo bảng fact và dimension trong MS SQL Server/Oracle
3. **Phát triển ETL:** Xây dựng quy trình trích xuất, biến đổi và nạp dữ liệu
4. **Xây dựng báo cáo OLAP:** Tạo các truy vấn phân tích theo yêu cầu
5. **Kiểm thử và xác thực:** Đảm bảo tính chính xác của dữ liệu và báo cáo

## **Thông tin liên hệ:**

Nếu có bất kỳ câu hỏi hoặc đề xuất nào, vui lòng tạo issue trong repository này hoặc liên hệ trực tiếp.
