#Web Scrapping of 1mg Website
library(rvest)
library(robotstxt)
library(dplyr)

path<-paths_allowed("https://www.1mg.com/categories/fitness-supplements/vitamins-minerals-9?filter=true&sort=rating&discount=10")

url<-"https://www.1mg.com/categories/fitness-supplements/vitamins-minerals-9?filter=true&sort=rating&discount=10"

web<-read_html(url)

#pipeline

Name<-web%>%html_nodes(".style__pro-title___2QwJy")%>%html_text()
Quantity<-web%>%html_nodes(".style__pack-size___2JQG7")%>%html_text()
Rating<-web%>%html_nodes(".CardRatingDetail__weight-700___27w9q")%>%html_text()
MRP<-web%>%html_nodes(".style__discount-price___25Bya")%>%html_text()
Discount<-web%>%html_nodes(".style__off-badge___2JaF-")%>%html_text()
SellingPrice<-web%>%html_nodes(".style__price-tag___cOxYc span")%>%html_text()
NoOfRatings<-web%>%html_nodes(".CardRatingDetail__ratings-header___2yyQW")%>%html_text()

#Dataset
mg.products <-data.frame(Name,Quantity,Rating,NoOfRatings,MRP,Discount,SellingPrice)

#Data Cleaning
mg.products$MRP<-gsub("[???]","",mg.products$MRP)
mg.products$Discount<-gsub("% off","",mg.products$Discount)
mg.products$NoOfRatings<-gsub("ratings","",mg.products$NoOfRatings)

#Changing the datatype

mg.products$Rating<-as.numeric(as.character(mg.products$Rating))
mg.products$NoOfRatings<-as.numeric(mg.products$NoOfRatings)
mg.products$MRP<-as.numeric(as.character(mg.products$MRP))
mg.products$Discount<-as.numeric(mg.products$Discount)
mg.products$SellingPrice<-as.numeric(mg.products$SellingPrice)

#Changing the column name
names(mg.products)<-c("Name","Quantity","Rating","No Of Ratings","MRP (???)","Discount (in %)","Selling_Price")

#Viewing the dataset
View(mg.products)

#Structure Of Dataset
str(mg.products)

#Saving Dataset 
write.csv(mg.products,"1mg_Products.csv")