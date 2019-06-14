
library('dplyr')

dist <- 12

linn <- readLines('AlgoBrowser3.log')

len <- length(linn)

nrow <- floor(len / dist)

a <- matrix(ncol = 3, nrow = nrow)
b <- matrix(ncol = 7, nrow = nrow)
c <- matrix(ncol = 17, nrow = nrow)
d <- matrix(ncol = 2, nrow = nrow)
e <- matrix(ncol = 2, nrow = nrow)
f <- matrix(ncol = 1, nrow = nrow)
g <- matrix(ncol = 1, nrow = nrow)
h <- matrix(ncol = 1, nrow = nrow)
i <- matrix(ncol = 1, nrow = nrow)
j <- matrix(ncol = 5, nrow = nrow)
k <- matrix(ncol = 17, nrow = nrow)

output <- list(a,b,c,d,e,f,g,h,i,j,k)

tmp <- list()

for (i in 1:nrow){
  
  #time stamps
  output[[1]][i,] <- linn[3 + i*dist - dist] %>% Numextract()
  
  
  #environmental_classifier
  output[[2]][i,] <- linn[4 + i*dist - dist] %>% Numextract()
  
  
}


  

Numextract <- function(string){
  unlist(regmatches(string,gregexpr("[[:digit:]]+\\.*[[:digit:]]*",string)))
}













