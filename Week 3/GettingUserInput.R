#readline method is used for reading input from user
my.name <- readline(prompt="Enter name: ")
my.age <- readline(prompt="Enter age: ")
# convert character into integer
my.age <- as.integer(my.age) #characterVector is converted into integer.
print(paste("Hi,", my.name, "next year you will be", my.age+1, "years old."))
