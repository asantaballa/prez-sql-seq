SELECT 
  Month = MONTH(svo.OrderDate)
, OrderCount = COUNT(svo.SalesOrderId)
FROM SeqViewOrders svo 
GROUP BY MONTH(svo.OrderDate)
ORDER BY MONTH(svo.OrderDate)

SELECT 
  Month = SeqT.Seq
, OrderCount = COUNT(svo.SalesOrderId)
FROM SeqT	--(1,12) 
LEFT JOIN SeqViewOrders svo ON MONTH(svo.OrderDate) = SeqT.Seq
WHERE SeqT.Seq BETWEEN 1 AND 12
GROUP BY SeqT.Seq
ORDER BY SeqT.Seq
