/* Task One - Category names and descriptions */
/* SELECT CategoryName, Description
FROM Categories */

/*Task Two- Contact Name, Customer ID, Company name, city name, of all customers in London*/
/*SELECT ContactName, CustomerID, CompanyName, City
FROM Customers
WHERE City='London';*/

/*Task 3 Return Marketing Managers/Sales Reps with Fax number */
/*SELECT *
FROM Suppliers
WHERE Fax IS NOT NULL AND ContactTitle ='Marketing Manager' OR ContactTitle= 'Sales Representative';*/

/*Task 4 Return List of Customer ID's where Freight <100 and required dates are between 1/1/1997 and dec 31, 1997*/
/*SELECT CustomerID
FROM Orders
WHERE Freight<100 AND RequiredDate BETWEEN '1/1/1997' AND '12/31/1997'*/

/*Task 5 Return list of company names and contact names of all customers from Mexico, Sweden, and Germany*/
/*SELECT CompanyName, ContactName
FROM Customers
WHERE Country='Mexico' OR Country='Sweden' OR Country='Germany'*/

/*Task 6 Find the count of discontinued items*/
/*SELECT COUNT(Discontinued)
FROM Products
WHERE Discontinued>'0';*/

/*Task 7 Return List of Category names and descriptions of all categories beginning with "Co"*/
/*SELECT CategoryName, Description
FROM Categories
WHERE CategoryName LIKE 'Co%';*/

/*Task 8 Write a query to return all company names, city, country, and postal code from the Suppliers tabe with the word "rue" in their address. 
Order the list abc by company name */
/*SELECT CompanyName, City, Country, PostalCode
FROM Suppliers
WHERE Address LIKE '%rue%'
ORDER BY CompanyName;*/

/*Task 9 Write a query to return the product id and quantity ordered for each product labelled
as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order*/
/*SELECT ProductID, Quantity 'Quantity Purchased'
FROM [Order Details]

ORDER BY Quantity DESC;*/

/*Task 10 Write a query to return the company name, address, city, postal code, and country of all customers
with orders that shipped using Speedy Express, along with the date the order was made*/
/*SELECT Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, Orders.ShipPostalCode, Orders.OrderDate
FROM Orders
INNER JOIN Shippers
ON Orders.ShipVia=Shippers.ShipperID
WHERE Shippers.ShipperID=1;*/

/*Task 11 Write a query to return list of Suppliers including company name, contact name, contact title, and region description*/
/*SELECT CompanyName, ContactName, ContactTitle, Region 'Region Description'
FROM Suppliers
WHERE Region IS NOT NULL*/

/*Task 12 Write a query that returns all product names from the Products table that are condiments*/
/*
SELECT Products.ProductName
FROM Products
INNER JOIN Categories
ON Categories.CategoryID=Products.CategoryID
WHERE Categories.CategoryID=2*/

/*Task 13 Write a query to return a list of customer names who have no orders in the Orders table*/
/*SELECT Customers.ContactName
FROM Customers
LEFT JOIN Orders ON Orders.CustomerID=Customers.CustomerID
WHERE Orders.OrderID IS NULL;*/

/*Task 14 Write a query to add a shipper named 'Amazon' to the Shippers table using SQL*/
/*SELECT * FROM Shippers INSERT INTO Shippers (CompanyName)
VALUES ('Amazon')*/

/*Task 15 Write a query to change Amazon to Amazon Prime*/
/*
UPDATE Shippers
SET CompanyName='Amazon Prime'
WHERE ShipperID=4*/

/*Task 16 Write a query to return a complete list of company names from the shipper table. include freight totals rounded to the nearest 
whole number for each shipper from the orders table for those shippers with orders*/
/*SELECT Shippers.CompanyName, CAST(ROUND(SUM(Orders.Freight),0)AS FLOAT) AS NumberOfOrders
FROM Orders
FULL JOIN Shippers
ON Orders.ShipVia=Shippers.ShipperID
GROUP BY CompanyName;*/

/*Task 17 Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased
as 'DisplayName'.. the combined format should be 'LastName, FirstName'.*/
/*SELECT concat(LastName,', ', FirstName) AS DisplayName
FROM Employees*/

/*Task 18 Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
Accidentally added myself in last night with product id-- 
have changed to also add name
SELECT Customers.CustomerID, Customers.ContactName, Customers.ContactTitle, 
Customers.Address, Customers.City, Products.ProductName AS ItemOrdered
FROM Customers
JOIN Orders
ON Orders.CustomerID=Customers.CustomerID
JOIN [Order Details]
ON Orders.OrderID=[Order Details].OrderId
JOIN Products
ON [Order Details].ProductId=Products.ProductId; 
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City)
VALUES ('KATMO', 'FSociety', 'Kate Morrical', 'IMABOSS', '4841 1/2 Cape May', 'San Diego')
INSERT INTO Products (ProductName)
VALUES ('Grandma''s Boysenberry Spread'); */
/*The above was not the exact 'right way' to do this.. First time using SQL.*/

/*Task 19 Write a query to remove yourself and your order from the database*/
/*DELETE FROM Customers
WHERE CustomerID='KATMO'*/

/*Task 20 Write a query to return a list of products from the Products table along with the total units in 
stock for each product. Include only products with TotalUnits greater than 100.*/
/*SELECT ProductName, (UnitsInStock+UnitsOnOrder) AS TotalUnits
FROM Products
WHERE (UnitsInStock+UnitsOnOrder)>100*/