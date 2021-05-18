--Add column named 'Activity' to the customers and check who is active, not active and extinct depending on the transactions' dates

SELECT t.TransactionID, c.CustomerID, c.FirstName, c.LastName, t.Transaction, t.TransactionDate,
CASE
	WHEN DATEDIFF(year,t.TransactionDate,GETDATE()) <=1 THEN 'Active'
	WHEN DATEDIFF(year,t.TransactionDate,GETDATE()) BETWEEN 1 AND 2 THEN 'Not Active'
	ELSE 'Extinct'
END AS 'Activity'
FROM dbo.Transactions AS t
INNER JOIN dbo.Customers as c
ON c.CustomerID=t.CustomerID