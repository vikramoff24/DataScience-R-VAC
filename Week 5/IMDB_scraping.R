#Check for access
library(robotstxt)
path<-paths_allowed("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating")
link<-"https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"
library(rvest)
library(dplyr)
web<-read_html(link)

#pipeline 
Name<-web%>%html_nodes(".lister-item-header a")%>%html_text()
Director_Name<-web%>%html_nodes(".text-muted+ p a:nth-child(1)")%>%html_text()
View(Director_Name)
rating<-web%>%html_nodes(".ratings-imdb-rating strong")%>%html_text()
View(rating)
Votes<-web%>%html_nodes(".sort-num_votes-visible span:nth-child(2)")%>%html_text()
View(Votes)
ImageUrl<-web%>%html_nodes(".loadlate")
link <- html_attr(ImageUrl, "src")
View(link)

#creating dataset
Fav_Movies<-data.frame(Name, Director_Name, rating, Votes,link)
View(Fav_Movies)

#saving with extension
write.csv(Fav_Movies,"Hollywood.csv")