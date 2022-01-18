CREATE DATABASE ToBa
GO
USE ToBa
GO

-- Master tables
CREATE TABLE Customer (
    CustomerID CHAR(5) NOT NULL,
    CustomerName VARCHAR(MAX) NOT NULL,
    CustomerEmail VARCHAR(MAX) NOT NULL,
    CustomerPhone CHAR(12) NOT NULL,
    CustomerAddress VARCHAR(MAX) NOT NULL,

    CONSTRAINT CustomerID_pk PRIMARY KEY(CustomerID),

    CONSTRAINT CustomerID_check CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
    CONSTRAINT CustomerPhone_check CHECK(ISNUMERIC(CustomerPhone) = 1),
    CONSTRAINT CustomerEmail_check CHECK(CustomerEmail LIKE '%@%.com')

)

-- DROP TABLE Customer

CREATE TABLE StaffRole (
    StaffRoleID INT NOT NULL,
    StaffRoleName VARCHAR(MAX) NOT NULL,

    CONSTRAINT StaffRole_pk PRIMARY KEY (StaffRoleID)
)

CREATE TABLE Staff (
    StaffID CHAR(5) NOT NULL,
    StaffName VARCHAR(MAX) NOT NULL,
    StaffRoleID INT NOT NULL,
    StaffPhone CHAR(12) NOT NULL,
    StaffAddress VARCHAR(MAX) NOT NULL,
    StaffSalary INT NOT NULL

    CONSTRAINT StaffID_pk PRIMARY KEY(StaffID),
    CONSTRAINT StaffRoleID_fk FOREIGN KEY(StaffRoleID) REFERENCES StaffRole(StaffRoleID) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT StaffID_check CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
    CONSTRAINT StaffPhone_check CHECK(ISNUMERIC(StaffPhone) = 1)
)

CREATE TABLE DeliveryStatus (
    DeliveryStatusID INT NOT NULL,
    DeliveryStatusName VARCHAR(20) NOT NULL,

    CONSTRAINT DeliveryStatusID_pk PRIMARY KEY(DeliveryStatusID)
)

CREATE TABLE PaymentType (
    PaymentTypeID INT NOT NULL,
    PaymentTypeName VARCHAR(MAX),

    CONSTRAINT PaymentTypeID_pk PRIMARY KEY(PaymentTypeID)
)

CREATE TABLE ProductType (
    ProductTypeID INT NOT NULL,
    ProductTypeName VARCHAR(MAX) NOT NULL,

    CONSTRAINT ProductTypeID_pk PRIMARY KEY(ProductTypeID)

)


CREATE TABLE Product (
    ProductID CHAR(5) NOT NULL,
    ProductTypeID INT NOT NULL,
    ProductName VARCHAR(MAX) NOT NULL,
    ProductPrice INT NOT NULL,
    ProductStock INT NOT NULL,

    CONSTRAINT ProductID_pk PRIMARY KEY(ProductID),
    CONSTRAINT ProductTypeID_fk FOREIGN KEY(ProductTypeID) REFERENCES ProductType(ProductTypeID) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT ProductID_check CHECK(ProductID LIKE 'PR[0-9][0-9][0-9]'),
    CONSTRAINT ProductPrice_check CHECK(ProductPrice > 0),
    CONSTRAINT ProductStock_check CHECK(ProductStock >= 0)

)

CREATE TABLE PaymentStatus (
    PaymentStatusID INT NOT NULL,
    PaymentStatusName VARCHAR(MAX) NOT NULL,

    CONSTRAINT PaymentStatusID_pk PRIMARY KEY(PaymentStatusID)
)

-- Transaction Tables
CREATE TABLE TransactionHeader (
    TransactionID CHAR(5) NOT NULL,
    CustomerID CHAR(5) NOT NULL,
    PaymentTypeID INT NOT NULL,
    DeliveryStatusID INT NOT NULL,
    PaymentStatusID INT NOT NULL,
    TransactionDate DATE,

    CONSTRAINT TransactionID_pk PRIMARY KEY(TransactionID),
    CONSTRAINT CustomerID_fk FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT DeliveryStatusID_fk FOREIGN KEY(DeliveryStatusID) REFERENCES DeliveryStatus(DeliveryStatusID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT PaymentTypeID_fk FOREIGN KEY(PaymentTypeID) REFERENCES PaymentType(PaymentTypeID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT PaymentStatusID_fk FOREIGN KEY(PaymentStatusID) REFERENCES PaymentStatus(PaymentStatusID) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT TransactionID_check CHECK(TransactionID LIKE 'TR[0-9][0-9][0-9]')
)

CREATE TABLE TransactionDetails (
    TransactionID CHAR(5) NOT NULL,
    ProductID CHAR(5) NOT NULL,
    Quantity INT NOT NULL,

    CONSTRAINT TransactionDetails_pk PRIMARY KEY(TransactionID, ProductID),
    CONSTRAINT TransactionID_fk FOREIGN KEY(TransactionID) REFERENCES TransactionHeader(TransactionID) ON UPDATE cascade ON DELETE CASCADE,
    CONSTRAINT ProductID_fk FOREIGN KEY(ProductID) REFERENCES Product(ProductID) ON UPDATE CASCADE ON DELETE CASCADE
)

-- Stock Update Report
CREATE TABLE StockUpdateReport (
    ProductID CHAR(5) NOT NULL,
    [Timestamp] DATE NOT NULL,
    StaffID CHAR(5) NOT NULL,
    PreviousStock INT NOT NULL,
    NewStock INT NOT NULL

    CONSTRAINT UpdateReport_pk PRIMARY KEY(ProductID, [Timestamp]),
    CONSTRAINT UpdateProductID_fk FOREIGN KEY(ProductID) REFERENCES Product(ProductID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT StaffID_fk FOREIGN KEY(StaffID) REFERENCES staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
)
