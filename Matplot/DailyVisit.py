import matplotlib.pyplot as plt
  
visits = []
day = []
  
f = open('/home/USERNAME/Online-Retail-Analysis/Result/retail/dailyvisit/DailyVisit.txt','r')
for row in f:
    row = row.split('\t')
    day.append(row[0])
    visits.append(int(row[3]))

new_day = []
new_day = day[::5]

plt.title("Visiters Per Day")
plt.xlabel('Day')
plt.ylabel('Visits')
plt.plot(day, visits)
for_grid = []
for_grid = day[::28]
plt.xticks(for_grid)
plt.show()

