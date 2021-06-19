from matplotlib import colors
import matplotlib.pyplot as plt
  
value = []
month = []
  
f = open('/home/USERNAME/Online-Retail-Analysis/Result/retail/MonthlySales/MonthlySales.txt','r')
for row in f:
    row = row.split('\t')
    month.append(row[0])
    value.append(int(row[1]))

plt.title('Monthly Sales')
plt.xlabel('Month')
plt.ylabel('Sales')
plt.plot(month, value, color='royalblue',linewidth='2.0')
plt.grid(axis = 'y')
plt.show()

