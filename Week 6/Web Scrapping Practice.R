#Check for access
library(robotstxt)
path<-paths_allowed("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating")
link<-"https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"
library(rvest)
library(dplyr)
web<-read_html(link)

#pipeline 
Name<-web%>%html_nodes(".lister-item-header a")%>%html_text()
Year<-web%>%html_nodes(".text-muted.unbold")%>%html_text()
Duration<-web%>%html_nodes(".runtime")%>%html_text()
Rating<-web%>%html_nodes(".ratings-imdb-rating strong")%>%html_text()

#creating dataset
imdb.ratings<-data.frame(Name,Year,Duration,Rating)


#saving with extension
#write.csv(Fav_Movies,"Hollywood.csv")

#Check the data types...Is it correct ?

str(imdb.ratings)

#Remove special character
imdb.ratings$Year<-gsub("\\(|\\)","",imdb.ratings$Year)
imdb.ratings$Duration<-gsub("min","",imdb.ratings$Duration)
View(imdb.ratings)
#Change the datatypes accroding to the data
imdb.ratings$Name<-as.character(imdb.ratings$Name)
imdb.ratings$Year<-as.numeric(imdb.ratings$Year)
imdb.ratings$Duration<-as.numeric(imdb.ratings$Duration)
imdb.ratings$Rating<-as.numeric(as.character(imdb.ratings$rating)) #Extra for preserving the decimal value

#creating new column
imdb.ratings$Rank<-c(1:50)
View(imdb.ratings)
imdb.ratings[c("Rank","Name","Year","Duration","Rating")]

#Gross_collected
set.seed(123) #same random will be generated  
imdb.ratings$Gross_dollars<-runif(50,min = 10000000, max = 1000000000) #random uniform
View(imdb.ratings)

#Check wether it is in corrrect datatype,
str(imdb.ratings)

#setting a value to NA (As in real world few values will be missing)
imdb.ratings[2,6]<-NA
imdb.ratings[17,6]<-NA
imdb.ratings[36,6]<-NA
View(imdb.ratings)

#Replacing NA with the mean of the column.
imdb.ratings$Gross_dollars=ifelse(is.na(imdb.ratings$Gross_dollars),
                                  ave(imdb.ratings$Gross_dollars,FUN=function(x) mean(x,na.rm=TRUE)),
                                  imdb.ratings$Gross_dollars)
#Making data into categories 
imdb.ratings$Movie_list<-imdb.ratings$Rating>8.6

#Converting logical data into factor and asigning particular value for it.
imdb.ratings$Movie_list<-as.factor(imdb.ratings$Movie_list)
  imdb.ratings$Movie_list<-factor(imdb.ratings$Movie_list,
                                levels=c("TRUE","FALSE"),
                                labels = c(0,1))

View(imdb.ratings)