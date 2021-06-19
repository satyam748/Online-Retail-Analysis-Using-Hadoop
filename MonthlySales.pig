CleanSales = LOAD '/user/USERNAME/retail/cleansales/CleanSales.txt' using PigStorage('\t') AS (InvoiceNo: int, StockCode: chararray, Description: chararray, Quantity: int, InvoiceDate: chararray, UnitPrice: float,TotalPrice: float, CustomerID: int, Country: chararray);  

z0 = foreach CleanData generate InvoiceNo as invno:int , SUBSTRING(InvoiceDate,0,10) as days:chararray , TotalPrice as sale:double;
z1 = DISTINCT(foreach z0 generate days,invno);
z2 = group z1 by days;
z3 = foreach z2 generate group as day,COUNT(x1.invno) as trans:int;
z4 = group z0 by days;
z5 = foreach z4 generate group as day,SUM(x0.sale) as sale:float;
z6 = JOIN z5 by day,z3 by day;
z7 = FOREACH z6 GENERATE group AS Customer, SUM(CleanSales.TotalPrice) AS amount;
z8 = ORDER z7 BY amount DESC;
z9 = LIMIT z8 30;
STORE z9 INTO '/user/gabbar/retail/MonthlySales' USING PigStorage ('\t');
