/********************************
   Создаем Базу Данных (Create a Database)
*********************************/

-- Удалить базу данных TestDB2 если такая уже существует (Delete the TestDB2 database if it already exists) 

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'TestDB2')
BEGIN
    DROP DATABASE [TestDB2];
END
GO

-- Создаем базу данных TestDB2 заново (Create a new TestDB2 database)

CREATE DATABASE [TestDB2];
GO

-- Переключаем контекст подключения на новую базу данных (Switch connection context to new database)

USE [TestDB2];
GO


/********************************
   Создаем Таблицы и Ограничители (Create Tables & Constraints)
   
*********************************/

CREATE TABLE [Order] (
    OrderId INT NOT NULL PRIMARY KEY,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    Notes NVARCHAR(255) NULL
);

CREATE TABLE [Product] (
    ProductId INT NOT NULL PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Price MONEY NOT NULL,
    [Description] NVARCHAR(4000) NULL
);

CREATE TABLE [OrderDetail] (
    OrderDetailId INT NOT NULL PRIMARY KEY,
    OrderId INT NOT NULL FOREIGN KEY REFERENCES [Order](OrderId),
    ProductId INT NOT NULL FOREIGN KEY REFERENCES [Product](ProductId),
    Quantity SMALLINT NOT NULL
);