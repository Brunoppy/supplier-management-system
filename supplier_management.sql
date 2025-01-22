-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- Create Supplier_Products table
CREATE TABLE Supplier_Products (
    SupplierProductID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierID INT NOT NULL,
    ProductID INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    MinimumOrderQuantity INT DEFAULT 1,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Suppliers
INSERT INTO Suppliers (SupplierName, ContactName, Address, City, Phone, Email) VALUES
('Tech Supplies Inc.', 'John Doe', '123 Tech Street', 'New York', '123-456-7890', 'contact@techsupplies.com'),
('OfficeMart', 'Jane Smith', '456 Office Ave', 'Los Angeles', '987-654-3210', 'support@officemart.com');

-- Insert sample data into Supplier_Products
INSERT INTO Supplier_Products (SupplierID, ProductID, Price, MinimumOrderQuantity) VALUES
(1, 1, 500.00, 10), -- Tech Supplies Inc. provides Product 1 at $500 per unit, min order 10
(2, 2, 45.00, 5);  -- OfficeMart provides Product 2 at $45 per unit, min order 5

-- Query to list all suppliers
SELECT 
    SupplierID, 
    SupplierName, 
    ContactName, 
    Phone, 
    Email 
FROM Suppliers;

-- Query to view products supplied by each supplier
SELECT 
    Suppliers.SupplierName,
    Products.ProductName,
    Supplier_Products.Price,
    Supplier_Products.MinimumOrderQuantity
FROM Supplier_Products
JOIN Suppliers ON Supplier_Products.SupplierID = Suppliers.SupplierID
JOIN Products ON Supplier_Products.ProductID = Products.ProductID;

-- Query to find the cheapest supplier for a specific product
SELECT 
    Products.ProductName,
    Suppliers.SupplierName,
    MIN(Supplier_Products.Price) AS LowestPrice
FROM Supplier_Products
JOIN Products ON Supplier_Products.ProductID = Products.ProductID
JOIN Suppliers ON Supplier_Products.SupplierID = Suppliers.SupplierID
WHERE Products.ProductID = 1
GROUP BY Products.ProductName, Suppliers.SupplierName;

-- Query to calculate total cost of a bulk order from a specific supplier
SELECT 
    Suppliers.SupplierName,
    SUM(Supplier_Products.Price * Supplier_Products.MinimumOrderQuantity) AS TotalCost
FROM Supplier_Products
JOIN Suppliers ON Supplier_Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.SupplierID = 1;
