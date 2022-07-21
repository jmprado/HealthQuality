-- REQUESTED QUERY USING T-SQL
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
