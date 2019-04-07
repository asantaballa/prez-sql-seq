SELECT 
  Month = MONTH(svo.OrderDate)
, OrderCount = COUNT(svo.SalesOrderId)
FROM SeqViewOrders svo 
GROUP BY MONTH(svo.OrderDate)
ORDER BY MONTH(svo.OrderDate)

SELECT 
  Month = Seq.Seq
, OrderCount = COUNT(svo.SalesOrderId)
FROM Seq(1,12) 
LEFT JOIN SeqViewOrders svo ON MONTH(svo.OrderDate) = Seq.Seq
GROUP BY Seq.Seq
ORDER BY Seq.Seq
