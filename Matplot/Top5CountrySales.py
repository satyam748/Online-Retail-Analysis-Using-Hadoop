from matplotlib import colors
import matplotlib.pyplot as plt
  
value = []
month = []
  
f = open('/home/USERNAME/Online-Retail-Analysis/Result/retail/Top5Country Sales/Top5Country Sales.txt','r')
for row in f:
    row = row.split('\t')
    month.append(row[2])
    value.append(int(row[1]))
uk = value[:10]
n = value[10:20]
eire = value[20:30]
germany = value[30:40]
france = value[40:50]
country = ['United Kingdom','Netherlands','EIRE','Germany','France']
new_y = month[:10]

plt.title("Sales in Top 5 Countries")
plt.xlabel('Month')
plt.ylabel('Sales')
plt.plot(new_y, uk,label= "UK", color='#9dc797',linewidth='2.5')
plt.plot(new_y, n,label= "Netherlands", color='#76b7b2',linewidth='2.5')
plt.plot(new_y, eire,label= "Eire", color='#4e79a7',linewidth='2.5')
plt.plot(new_y, germany,label= "Germany", color='#e15759',linewidth='2.5')
plt.plot(new_y, france,label= "France", color='#f28e2b',linewidth='2.5')
plt.legend()
plt.grid(axis = 'y')
plt.show()

