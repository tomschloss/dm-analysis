#' Check how may variables are missing
#' 

p.miss <- function(x){
  sum(is.na(x)) / length(x) * 100
}