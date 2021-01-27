library(ggplot2)
library(dplyr)

expenses<-read.csv("dailyexpenses.csv")
View(expenses)
str(expenses)
expenses$Date <- as.Date(expenses$Date,
                         "%d/%m/%Y")
str(expenses)

pc<-read.csv("piechart.csv")

View(pc)

#Compare Expenses
fd <-expenses[,2] #food column 
a1 <- sum(fd)

groc <-expenses[,3]
a2 <- sum(groc)

med <-expenses[,4]
a3 <- sum(med)

fl <-expenses[,5]
a4 <- sum(fl)

tl <-expenses[,6]
a5 <- sum(tl)

ph <-expenses[,7]
a6 <- sum(ph)

electric <- expenses[,8]
a7 <- sum(electric)

misc <- expenses[,9]
a8 <- sum(misc)

detail <- c("food", "groceries", "medical", "fuel", "toll", "phone", "electricity", "miscellaneous")
total <- c(a1, a2, a3, a4, a5, a6, a7, a8)

df <- data.frame(detail, total)
View(df)

ggplot(data = df, aes(x = detail, y = total))+
  geom_bar(stat = "identity", fill = "purple")+
  labs(x = "Items",
       y = "Expenses",
       title = "Comparing Expenses")



