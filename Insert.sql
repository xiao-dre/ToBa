USE ToBa

INSERT INTO Customer VALUES
('CU001', 'John Doe', 'JohnDoe@yahoo.com', '089912345678', 'WhyPok Street No.6'),
('CU002', 'Kevin Cibui', 'KepinC@gmail.com', '036122781413', 'Borgir Street No.8'),
('CU003', 'Jonathan Wijaya', 'JohnDoe@mail.com', '082163861754', 'Berlion Street No.15'),
('CU004', 'Pamela Nairobi', 'PamelaNairobi@gmail.com', '083143732551', 'WhyPok Street No.6'),
('CU005', 'Adeliene de Carpentier', 'Adeliene@mail.com', '082146820792', 'Baguette Street No.9')

INSERT INTO StaffRole VALUES
(1, 'Manager'),
(2, 'CEO'),
(3, 'Developer'),
(4, 'Administrator'),
(5, 'Operator')

INSERT INTO Staff VALUES
('ST001', 'Andre Bishop', 1, '087713896228', 'Caingkaring Street No. 4', 10000000),
('ST002', 'Kurt Ramsey', 3, '087799197117', 'Kemangguisan Street No. 4', 5000000),
('ST003', 'Daniel Danish', 2, '087711708630', 'Alam Suterai Street No. 4', 5000000),
('ST004', 'Johanna Vanessa', 5, '087798917076', 'Florid Street No. 4', 4500000),
('ST005', 'Emily Higgins', 4, '087766366486', 'Sukiman Street No. 4', 5000000)

INSERT INTO ProductType VALUES
(1, 'Shirt'),
(2, 'Pants'),
(3, 'Dress'),
(4, 'Skirt'),
(5, 'Jacket')

INSERT INTO Product VALUES
('PR001', 3, 'Dress Batik', 500000, 30),
('PR002', 2, 'Suit Pants', 200000, 20),
('PR003', 5, 'Archipelago motive Hoodie', 350000, 11),
('PR004', 1, 'Solo Batik Shirt', 300000, 46),
('PR005', 4, 'Archipelago motive Skirt', 450000, 10)

INSERT INTO PaymentType VALUES
(1, 'Credit Card'),
(2, 'Paypal'),
(3, 'Cash On Delivery'),
(4, 'Toba Credits'),
(5, 'Other')

INSERT INTO PaymentStatus VALUES
(1, 'Waiting for Payment'),
(2, 'Paid')

INSERT INTO DeliveryStatus VALUES
(1, 'Packing Progress'),
(2, 'Shipped'),
(3, 'Arrived'),
(4, 'Waiting for payment')

INSERT INTO TransactionHeader VALUES
('TR001', 'CU001', 1,  3, 2, '05/30/2020'),
('TR002', 'CU005', 1, 2, 2, '06/06/2021'),
('TR003', 'CU003', 2, 3, 2, '01/12/2021'),
('TR004', 'CU001', 3, 4, 2, '04/25/2021'),
('TR005', 'CU002', 5, 2, 2, '09/10/2020'),
('TR006', 'CU004', 4, 4, 1, '11/09/2020'),
('TR007', 'CU002', 2, 2, 2, '11/13/2021'),
('TR008', 'CU003', 1, 3, 2, '07/21/2021'),
('TR009', 'CU001', 3, 1, 2, '11/11/2020'),
('TR010', 'CU004', 3, 3, 2, '05/26/2021')

INSERT INTO TransactionDetails VALUES
('TR001', 'PR003', 1),
('TR001', 'PR004', 1),
('TR001', 'PR002', 1),
('TR002', 'PR003', 1),
('TR002', 'PR001', 1),
('TR003', 'PR005', 1),
('TR004', 'PR004', 1),
('TR005', 'PR004', 1),
('TR006', 'PR002', 1),
('TR007', 'PR001', 1),
('TR008', 'PR003', 1),
('TR009', 'PR002', 1),
('TR010', 'PR003', 1),
('TR003', 'PR002', 1),
('TR003', 'PR003', 1),
('TR002', 'PR004', 1),
('TR007', 'PR004', 1),
('TR006', 'PR001', 1),
('TR008', 'PR001', 1),
('TR003', 'PR010', 1)

INSERT INTO StockUpdateReport VALUES
('PR001', '05/03/2021', 'ST001', 13, 30)

SELECT * FROM Customer
SELECT * FROM StaffRole
SELECT * FROM Staff
SELECT * FROM ProductType
SELECT * FROM Product
SELECT * FROM PaymentType
SELECT * FROM PaymentStatus
SELECT * FROM DeliveryStatus
SELECT * FROM TransactionHeader
SELECT * FROM StockUpdateReport