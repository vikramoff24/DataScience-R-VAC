# Data visualization
count<-table(mtcars$gear)

View(count)

plot(count)


barplot(count)

barplot(count, horiz=TRUE)


barplot(count, main="Sample bar plot",
        xlab = "Improvement",
        ylab = "Frequency",
        legend = rownames(count),
        col=c("red","yellow","green"))

pie(count)







#Let us try line, scatter and box plot
salary<-read.csv("Salary_data.csv")
View(salary)

install.packages("ggplot2")
library(ggplot2)

ggplot(salary,aes(x=Experience,y=Salary))+
  geom_point()

ggplot(salary,aes(x=Experience,y=Salary,))+
  geom_line()

ggplot(salary,aes(x=Experience,y=Salary))+
  geom_boxplot()


#Let's analyze titanic scenario
#Download Titanic Dataset
#Set the folder as working directory
Titanic<-read.csv("titanic.csv",stringsAsFactors = FALSE)
View(Titanic)

# Analyze the dataset
str(Titanic)



#Install GGPLOT2 library (Grammar of Graphics)

Titanic$sex<-as.factor(Titanic$sex)
Titanic$pclass<-as.factor(Titanic$pclass)
Titanic$survived<-as.factor(Titanic$survived)
Titanic$embarked<-as.factor(Titanic$embarked) 
str(Titanic)



#Let's first understand the people survived
prop.table(table(Titanic$survived))

ggplot(Titanic,aes(x=survived))+
    geom_bar()



ggplot(Titanic,aes(x=survived))+
    theme_classic()+
    geom_bar()+
    labs(y="Passenger count",
            title = "Titanic Survival Count")



#Gender wise survival
ggplot(Titanic,aes(x=sex,fill=survived))+
  theme_light()+
  geom_bar()+
  labs(y="Passenger count",
       title = "Titanic Survival Count by gender")



#Survival based on class
ggplot(Titanic,aes(x=pclass,fill=survived))+
  theme_light()+
  geom_bar()+
  labs(y="Passenger count",
       title = "Titanic Survival Count by class")



#Faceting Data
ggplot(Titanic,aes(x=sex,fill=survived))+
theme_light()+
facet_grid(~pclass)+
  geom_bar()+
  labs(y="Passenger count",
       title = "Titanic Survival Count by class and gender")



#Trying a pie chart
ggplot(Titanic, aes( x ="", fill = survived ) ) +
  geom_bar( position="fill" ) +
  facet_grid(~pclass) +
  coord_polar( theta = "y" )



#Lets the age group who dies onboard
ggplot(Titanic,aes(x=age))+
    theme_bw()+
    geom_histogram(binwidth = 5)+
    labs(y="passenger count",
         x="Age",
         title = "Titanic Age distribution")



ggplot(Titanic,aes(x=age,fill = survived))+
  theme_bw()+
  geom_histogram(binwidth = 5)+
  labs(y="passenger count",
       x="Age",
       title = "Titanic Age distribution")



ggplot(Titanic,aes(x=survived,y = age))+
  theme_bw()+
  geom_boxplot()+
  labs(y="age",
       x="survived",
       title = "Titanic survival rate by age")




#facet and density plot
ggplot(Titanic,aes(x=age,fill=survived))+
    theme_bw()+
    facet_wrap(sex~pclass)+
    geom_density(alpha=0.5)+
    labs(y="age",
         x="survived",
         title = "Titanic survival rate by age,class and gender")




