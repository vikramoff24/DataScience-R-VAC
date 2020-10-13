#importing the packages  
install.packages("rvest") #Connecting R to the Html doc.
install.packages("robotstxt")
install.packages("dplyr") #for dynamic website

#library requiring.
library(rvest) #this will directly connect to html document
library(robotstxt)#this will tell a the website is accesible or not.

#return whether it is acessible or not.
Path<-paths_allowed("https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population")

#assigning the URL
url<-"https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"

#Reading the details from the URL
My_web<-read_html(url)

#Getting the data in the table element.
My_web_table=html_nodes(My_web,"table")

#Extracting the table which we are looking for.
population<-html_table(My_web_table)[[1]]
View(population)

#Getting only some no of columns 
My_population<-population[,1:4]

#Changing the column Name.
names(My_population)<-c("Rank","Country","population","world share")
View(My_population)
#For changing the particular column Name, Use $

#Saving it as CSV file.
write.csv(My_population,"Population_site")
