import matplotlib.pyplot as plt
  
country = []
revenue = []
  
f = open('/home/USERNAME/Online-Retail-Analysis/Result/retail/georevenue/Top5CountryRevenue.txt','r')
for row in f:
    row = row.split('\t')
    country.append(row[0])
    revenue.append(int(row[1]))

colors = ['#59a14f', '#76b7b2', '#4e79a7', '#e15759','#f28e2b']
plt.pie(revenue, colors = colors, startangle = 90, shadow = False, radius = 1.0,counterclock = False)   

#plt.bar(country, revenue, color = 'g', label = 'File Data')
#plt.xlabel('Country', fontsize = 12)
#plt.ylabel('Revenue', fontsize = 12)
  
plt.title('Top 5 Revenue Generating Countries', fontsize = 20)
plt.legend(title = 'Country',loc='lower left',labels = country)
plt.show()
