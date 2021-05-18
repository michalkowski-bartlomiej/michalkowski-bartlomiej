--show ID and position with the highest order amount
SELECT TOP 1
D.SalesOrderID AS 'IDorder', count(D.SalesOrderID) AS 'order amount'
FROM Adventureworks.Sales.SalesOrderDetail as D
GROUP BY SalesOrderID
ORDER BY COUNT(*) DESC

--show first 10 employees with surname "Anderson"
SELECT TOP 10
	PP.FirstName,
	PP.LastName
FROM Person.Person AS PP
WHERE 
	LastName='Anderson'

--show all employees
SELECT BusinessEntityID,FirstName, LastName
FROM Person.Person
WHERE
PersonType='EM' OR PersonType='SP'

--Show all work stations
SELECT DISTINCT
Emp.JobTitle AS WorkStation
FROM HumanResoureces.Employee AS Emp


--Show all female employees
SELECT p.BusinessEntityID, p.FirstName, p.LastName, e.Gender, p.PersonType
FROM Adventureworks.Person.Person as P
INNER JOIN Adventureworks.HumanResources.Employee AS e
ON p.BusinessEntityID=e.BusinessEntityID
WHERE (p.PersonType='EM' or p.PersonType='SP') AND e.Gender='F'
ORDER BY p.BusinessEntityID

--Show all employees who are over 50 years old
SELECT Person.FirstName +' '+ Person.LastName AS 'Employee', Employee.Gender AS 'Gender', Employee.Birthdate AS 'Date of birth',
Employee.HireDate as 'seniority', DATEDIFF(YEAR,Employee.BirthDate, GETDATE()) AS 'Age'
FROM Person.Person AS Person
JOIN HumanResources.Employee AS Employee
ON Person.BusinessEntityID=Employee.BusinessEntityID
WHERE DATEDIFF(YEAR,Employee.BirthDate,GETDATE()) >50
ORDER BY Age DESC

--Show information of Order (IDorder, order value) with the highest value
SELECT TOP 1
D.SalesOrderID, SUM(D.OrderQty * D.UnitPrice) AS 'Order Value'
FROM Adventureworks.Sales.SalesOrderDetail AS D
GROUP BY D.SalesOrderID
ORDER BY 'Order Value' DESC

--Show the last order for every customer
SELECT O.CustomerID AS 'CustomerID', O.SalesOrderID AS 'OrderID', MAX(CAST(O.OrderDate AS date)) AS 'OrderDate'
FROM Adventureworks.Sales.SalesOrderHeader as O
GROUP BY O.CustomerID, O.SalesOrderID
ORDER BY O.CustomerID
