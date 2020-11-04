#Read a Text File
person<-read.csv(file="Sample.txt",
                 header = FALSE,
                 col.names = c("age","Height"))
View(person)

str(person)

data<-read.csv(file="Sample.txt",
               header = FALSE,
               col.names = c("age","height"),
               stringsAsFactors = FALSE)
str(data)
data$height<-as.numeric(data$height)
str(data)