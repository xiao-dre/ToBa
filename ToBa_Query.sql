USE ToBa

-- 1. Select all staff data where staff role is 3
SELECT * 
FROM Staff
WHERE StaffRoleID = 3

-- 2. Add new column called StaffGender to staff table
BEGIN TRAN
ALTER TABLE Staff
ADD StaffGender VARCHAR(MAX) NOT NULL CHECK(StaffGender IN('Male', 'Female')) 
ROLLBACK

-- 3. Delete Customer Where CustomerName is Andreas
BEGIN TRAN
DELETE FROM Customer WHERE CustomerName LIKE 'Andreas'
ROLLBACK

-- 4. Update ProductPrice to 450000 where product type is 'Shirt'
BEGIN TRAN
UPDATE Product
SET ProductPrice = '450000'
FROM Product
WHERE ProductID IN (
    SELECT ProductID
    FROM Product AS p
    JOIN ProductType AS pt ON pt.ProductTypeID = p.ProductTypeID
    WHERE ProductTypeName LIKE 'Shirt'
    )
ROLLBACK

-- 5. Select CustomerName, CustomerAddress, and TransactionDate where the transaction has been done by customer name contains 'John'
SELECT CustomerName,
    CustomerAddress,
    TransactionDate
FROM TransactionHeader AS th
JOIN Customer AS c ON c.CustomerID = th.CustomerID
WHERE CustomerName like '%John%'

-- 6. Select DeliveryStatus and Total Transaction that has been delivered
SELECT DeliveryStatusName, COUNT(TransactionID) AS [Total Transaction]
FROM TransactionHeader AS th
JOIN DeliveryStatus AS ds ON ds.DeliveryStatusID = th.DeliveryStatusID
GROUP BY DeliveryStatusName

-- 7. Select ProductName, ProductTypeName, ProductPrice where the product has price more than average.
SELECT ProductName, ProductTypeName, ProductPrice
FROM Product AS p
JOIN ProductType AS pt ON pt.ProductTypeID = p.ProductTypeID,
(
    SELECT AVG(ProductPrice) AS Average
    FROM Product
) AS [AverageProductPrice]
WHERE ProductPrice > [AverageProductPrice].[Average]

-- 8. Select StaffName, StaffRole, StaffPhone  that update stock in year 2021
SELECT StaffName, StaffRoleName, StaffPhone
FROM Staff AS s
JOIN StaffRole AS sr ON sr.StaffRoleID = s.StaffRoleID
JOIN StockUpdateReport AS stu ON stu.StaffID = s.StaffID
WHERE YEAR([Timestamp]) = 2021

-- 9. SELECT payment type name and amount of transaction that has done in every payment type
SELECT PaymentTypeName,
    COUNT(TransactionID) AS [Amount of Transaction]
FROM PaymentType AS pt
JOIN TransactionHeader AS th ON pt.PaymentTypeID = th.PaymentTypeID
GROUP BY PaymentTypeName

-- 10. Insert into StockUpdateReport
-- Insert rows into table 'StockUpdateReport'
INSERT INTO StockUpdateReport
VALUES
('PR003', GETDATE(), 'ST003', 13, 11)

