CREATE VIEW SeqViewOrders AS
SELECT * FROM AdventureWorks.Sales.SalesOrderHeader
WHERE MONTH(OrderDate) NOT IN (2,3,5,7,11)
