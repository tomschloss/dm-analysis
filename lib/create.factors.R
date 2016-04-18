#' Create factors
#' 
#' Variables that have fewer than 10 variables are made into factors
#' automatically.
#' 

create.factors <- function(data){
  
  for(i in 1:ncol(data)){
    
    test_factor <- factor(data[,i])
    if(length(levels(test_factor)) < 10){
      
      data[,i] <- factor(data[,i])
      
    }
    
  }
  
  data
  
}