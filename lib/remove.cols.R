#' Remove columns with missing values
#' 
#' Removes columns from a dataset where they have more than \code{pct} % of
#' values missing.
#' 

remove.cols <- function(data, pct){
  
  require(dplyr)
  
  a <- data.frame(pct.missing = apply(data, 2, p.miss))
  a$col <- names(data)
  a$colnum <- 1:nrow(a)
  a <- a %>% filter(pct.missing > pct)
  
  data <- data[,-a$colnum]
  data
   
}