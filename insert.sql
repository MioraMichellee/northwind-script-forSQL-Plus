-- Supprimer les détails de commandes en premier (clé étrangère sur commandes)
DELETE FROM OrderDetails;

-- Supprimer les commandes ensuite (clé étrangère sur clients et transporteurs)
DELETE FROM Orders;

-- Supprimer les produits (clé étrangère sur fournisseurs et catégories)
DELETE FROM Products;

-- Supprimer les fournisseurs
DELETE FROM Suppliers;

-- Supprimer les clients
DELETE FROM Customers;

-- Supprimer les transporteurs
DELETE FROM Shippers;

-- Supprimer les catégories
DELETE FROM Categories;

-- Supprimer les employés
DELETE FROM Employees;

-- Insérer des fournisseurs
INSERT INTO Suppliers (SupplierID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone) VALUES
('S001', 'Exotic Liquid', 'Charlotte Cooper', 'Sales Manager', '49 Gilbert St.', 'London', 'England', 'EC1 4SD', 'UK', '(171) 555-2222'),
('S002', 'New Orleans Cajun Delights', 'Shelley Burke', 'Marketing Manager', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822');

-- Insérer des clients
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax) VALUES
('C001', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', 'Berlin', '12209', 'Germany', '(030) 0076545', '(030) 0076546'),
('C002', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', 'DF', '5021', 'Mexico', '(5) 555-5938', '(5) 555-1234');

-- Insérer des expéditeurs
INSERT INTO Shippers (ShipperID, CompanyName, Phone) VALUES
('SH01', 'Speedy Express', '(503) 555-9831'),
('SH02', 'United Package', '(503) 555-3199');

-- Insérer des employés
INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo) VALUES
('E001', 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', TO_DATE('1948-12-08', 'YYYY-MM-DD'), TO_DATE('1992-05-01', 'YYYY-MM-DD'), '507 - 20th Ave. E.', 'Seattle', 'WA', '98102', 'USA', '(206) 555-9857', '123', NULL, NULL, NULL),
('E002', 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', TO_DATE('1952-02-20', 'YYYY-MM-DD'), TO_DATE('1992-08-14', 'YYYY-MM-DD'), '5th Ave', 'New York', 'NY', '10001', 'USA', '(212) 555-9999', '124', NULL, NULL, 'E001');

-- Insérer des catégories
INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Deli foods, sauces, spreads, and seasonings');

-- Insérer des produits
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES
(1, 'Chai', 'S001', 1, '10 boxes x 20 bags', 18.00, 39, 10, 5, 0),
(2, 'Chang', 'S001', 1, '24 - 12 oz bottles', 19.00, 17, 5, 2, 0),
(3, 'Aniseed Syrup', 'S002', 2, '12 - 550 ml bottles', 10.00, 13, 10, 7, 0);

-- Insérer des commandes
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) VALUES
('O001', 'C001', 'E001', TO_DATE('1997-07-04', 'YYYY-MM-DD'), TO_DATE('1997-08-01', 'YYYY-MM-DD'), TO_DATE('1997-07-08', 'YYYY-MM-DD'), 'SH01', 32.38, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Berlin', '12209', 'Germany'),
('O002', 'C002', 'E002', TO_DATE('1997-07-15', 'YYYY-MM-DD'), TO_DATE('1997-08-15', 'YYYY-MM-DD'), NULL, 'SH02', 11.61, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'DF', '5021', 'Mexico');


-- Insérer les détails de commandes
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES
('OD001', 'O001', 1, 18.00, 10, 0),
('OD002', 'O001', 2, 19.00, 5, 0),
('OD003', 'O002', 3, 10.00, 3, 0);
