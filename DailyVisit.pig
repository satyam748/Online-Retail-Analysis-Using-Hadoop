CleanData = LOAD '/user/USERNAME/retail/cleansales/CleanSales.txt' using PigStorage('\t') AS (InvoiceNo: int, StockCode: chararray, Description: chararray, Quantity: int, InvoiceDate: chararray, UnitPrice: float,TotalPrice: float, CustomerID: int, Country: chararray);   

x0 = foreach CleanData generate InvoiceNo as invno:int , SUBSTRING(InvoiceDate,0,10) as days:chararray , TotalPrice as sale:double;
x1 = DISTINCT(foreach x0 generate days,invno);
x2 = group x1 by days;
x3 = foreach x2 generate group as day,COUNT(x1.invno) as trans:int;
x4 = group x0 by days;
x5 = foreach x4 generate group as day,SUM(x0.sale) as sale:float;
x6 = JOIN x5 by day,x3 by day;
STORE x6 into '/user/gabbar/retail/dailyvisit' USING PigStorage ('\t');

