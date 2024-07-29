-- Supprimer les tables dans l'ordre inverse de leur création
-- Assurer que les tables enfants sont supprimées avant les tables parentes

-- Supprimer la table OrderDetails
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE OrderDetails';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Supprimer la table Orders
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Orders';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Supprimer la table Products
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Products';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Supprimer la table Categories
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Categories';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Supprimer la table Employees
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Employees';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Supprimer la table Shippers
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Shippers';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Supprimer la table Customers
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Customers';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Supprimer la table Suppliers
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Suppliers';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/


-- Création de la table Suppliers
CREATE TABLE Suppliers (
    SupplierID VARCHAR2(10) PRIMARY KEY,
    CompanyName VARCHAR2(50),
    ContactName VARCHAR2(50),
    ContactTitle VARCHAR2(30),
    Address VARCHAR2(100),
    City VARCHAR2(50),
    Region VARCHAR2(50),
    PostalCode VARCHAR2(20),
    Country VARCHAR2(50),
    Phone VARCHAR2(20)
);
=
CREATE TABLE Customers (
    CustomerID VARCHAR2(10) PRIMARY KEY,
    CompanyName VARCHAR2(50),
    ContactName VARCHAR2(50),
    ContactTitle VARCHAR2(30),
    Address VARCHAR2(100),
    City VARCHAR2(50),
    Region VARCHAR2(50),
    PostalCode VARCHAR2(20),
    Country VARCHAR2(50),
    Phone VARCHAR2(20),
    Fax VARCHAR2(20)
);

CREATE TABLE Shippers (
    ShipperID VARCHAR2(10) PRIMARY KEY,
    CompanyName VARCHAR2(50),
    Phone VARCHAR2(20)
);

CREATE TABLE Employees (
    EmployeeID VARCHAR2(10) PRIMARY KEY,
    LastName VARCHAR2(50),
    FirstName VARCHAR2(50),
    Title VARCHAR2(30),
    TitleOfCourtesy VARCHAR2(25),
    BirthDate DATE,
    HireDate DATE,
    Address VARCHAR2(100),
    City VARCHAR2(50),
    Region VARCHAR2(50),
    PostalCode VARCHAR2(20),
    Country VARCHAR2(50),
    HomePhone VARCHAR2(20),
    Extension VARCHAR2(10),
    Photo BLOB,
    Notes CLOB,
    ReportsTo VARCHAR2(10),
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Categories (
    CategoryID NUMBER PRIMARY KEY,
    CategoryName VARCHAR2(50),
    Description VARCHAR2(255),
    Picture BLOB
);

CREATE TABLE Products (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(50),
    SupplierID VARCHAR2(10),
    CategoryID NUMBER,
    QuantityPerUnit VARCHAR2(20),
    UnitPrice NUMBER,
    UnitsInStock NUMBER,
    UnitsOnOrder NUMBER,
    ReorderLevel NUMBER,
    Discontinued NUMBER,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID VARCHAR2(10) PRIMARY KEY,
    CustomerID VARCHAR2(10),
    EmployeeID VARCHAR2(10),
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia VARCHAR2(10),
    Freight NUMBER,
    ShipName VARCHAR2(50),
    ShipAddress VARCHAR2(100),
    ShipCity VARCHAR2(50),
    ShipRegion VARCHAR2(50),
    ShipPostalCode VARCHAR2(20),
    ShipCountry VARCHAR2(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID)
);

-- Création de la table OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID VARCHAR2(10) PRIMARY KEY,
    OrderID VARCHAR2(10),
    ProductID NUMBER,
    UnitPrice NUMBER,
    Quantity NUMBER,
    Discount NUMBER,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
