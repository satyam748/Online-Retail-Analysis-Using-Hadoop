CleanSales = LOAD '/user/USERNAME/retail/cleansales/CleanSales.txt' using PigStorage('\t') AS (InvoiceNo: int, StockCode: chararray, Description: chararray, Quantity: int, InvoiceDate: chararray, UnitPrice: float,TotalPrice: float, CustomerID: int, Country: chararray);  

y0 = GROUP CleanSales BY Country;
y1  = FOREACH y0 GENERATE group, ROUND(SUM(CleanSales.TotalPrice)) AS TotalRevenueByCountry;
y2 = ORDER y1 BY TotalRevenueByCountry DESC;
y3 = LIMIT y2 5;
STORE y3 INTO '/user/gabbar/retail/georevenue' USING PigStorage ('\t');
