#vector
x <- c(1, 5, 4, 9, 0) #c() is used for combining all the element.
print(x)

#matrix
mat_a<-matrix(c(25,14,36,51,36,98,9,7,1),ncol = 3) 
determinant = det(mat_a) #det is a function for finding determinant.
Mat_mul = mat_a%*%mat_a # matrix multiplication we use * in side two % 