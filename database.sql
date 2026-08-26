CREATE DATABASE ServletCRUDMVC;
GO

USE ServletCRUDMVC;
GO

CREATE TABLE Category
(
    cate_id INT IDENTITY(1,1) PRIMARY KEY,
    cate_name NVARCHAR(255) NOT NULL,
    icons NVARCHAR(255) NULL
);
GO

INSERT INTO Category(cate_name, icons)
VALUES
(N'Quần Áo Nam', NULL),
(N'Quần Áo Nữ', NULL),
(N'Giày Dép', NULL);

SELECT * FROM Category;