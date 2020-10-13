i <- 1
while(i<10)
{
  print(i)
  i=i+1
}

list <- c()
for(i in seq(1,10,by=2)) #ranges from 1 to 10 (inclusive) it perfroms operations on the by no. of element. 
{
  list[[i]]=i*i
}
print(list)