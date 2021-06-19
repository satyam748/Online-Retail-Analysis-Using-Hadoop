CleanSales = LOAD '/user/USERNAME/retail/cleansales/CleanSales.txt' using PigStorage('\t') AS (InvoiceNo: int, StockCode: chararray, Description: chararray, Quantity: int, InvoiceDate: chararray, UnitPrice: float,TotalPrice: float, CustomerID: int, Country: chararray);  

x0 = GROUP CleanSales BY Country;
x1  = FOREACH x0 GENERATE group, ROUND(SUM(CleanSales.TotalPrice)) AS TotalRevenueByCountry;
x2 = ORDER x1 BY TotalRevenueByCountry DESC;
x3 = LIMIT x2 5;
x4 = FOREACH x0 GENERATE group, COUNT(CleanSales.InvoiceNo) AS TotalCustomerByCountry;
x5 = ORDER x4 BY TotalCustomerByCountry DESC;
x6 = LIMIT x5 5;
STORE x6 INTO '/user/gabbar/retail/top5geocustomer' USING PigStorage ('\t');
