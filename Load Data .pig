RawData = LOAD '/user/USERNAME/retail/rawsales/Online-Retail-Data.txt' using PigStorage('\t') AS (InvoiceNo: int, StockCode: chararray, Description: chararray, Quantity: int, InvoiceDate: chararray, UnitPrice: float, CustomerID: int, Country: chararray); 
      
RawSales = FILTER RawData BY NOT (InvoiceDate matches 'InvoiceDate');

CleanSales = FOREACH RawSales GENERATE InvoiceNo, StockCode, Description, Quantity, CONCAT(InvoiceDate,':00') as (InvoiceDate:chararray), UnitPrice, ROUND(UnitPrice * Quantity * 100f)/100f AS (TotalPrice: float), CustomerID, Country;
STORE CleanSales INTO '/user/gabbar/retail/cleansales' USING PigStorage ('\t');
