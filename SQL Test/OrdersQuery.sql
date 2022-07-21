-- TEST DATA
INSERT INTO Customer values(1, 'Joao', 'Prado', 46, 'System Engineer', 'Married') 
INSERT INTO Customer values(2, 'Isabel', 'Cristina', 46, 'HR Manager', 'Married') 

INSERT INTO Orders VALUES (1, 1, GETDATE(), 'Credit Card')
INSERT INTO Orders VALUES (2, 2, GETDATE(), 'Credit Card')
INSERT INTO Orders VALUES (3, 2, GETDATE(), 'Credit Card')

INSERT INTO OrderDetail VALUES(5, 1, 3, 1112222333, 'Brazil')
INSERT INTO OrderDetail VALUES(6, 3, 3, 1112222333, 'Brazil')
INSERT INTO OrderDetail VALUES(4, 1, 4, 1112222334, 'US')


-- REQUESTED QUERY
SELECT 
	(c.FirstName + ' ' + c.LastName) AS 'Full Name', 
	c.Age, o.OrderId, 
	o.DateCreated, 
	o.MethodOfPurchase AS 'Purchase Method',
	od.ProductNumber, 
	od.ProductOrigin 
FROM 
	OrderDetail od INNER JOIN Orders o ON od.OrderId = o.OrderId
	INNER JOIN Customer c ON c.PersonId = o.PersonId
WHERE od.ProductId = 1112222333
