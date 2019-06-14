
library('dplyr')

dist <- 12

linn <- readLines('AlgoBrowser3.log')
for (i in 1:length(linn)){
  #extract data stamp
  tmp <- linn[3+(i-1)*12] %>% Numextract() 


}




Numextract <- function(string){
  unlist(regmatches(string,gregexpr("[[:digit:]]+\\.*[[:digit:]]*",string)))
}













