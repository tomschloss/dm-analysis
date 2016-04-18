#' Munge script
#' 
#' This creates the test and validation files which will be run through various
#' models. It pulls through the metadata to create more understandable column
#' names
#' 

# packages
library(dplyr)
library(mice)

# Remove last row - there is an issue with this row
cup98LRN <- cup98LRN[-nrow(cup98LRN),]

# Removed columns with > 30% missing values
cup98LRN <- remove.cols(cup98LRN, 30)

# make factors of variables with fewer than 10 levels
cup98LRN <- create.factors(cup98LRN)

# impute missing variables
badvars <- cup98LRN[,c("INCOME", "CLUSTER", "ADI", "AGE")]
impvars <- mice(badvars, m = 5, maxit = 5, meth = 'pmm', seed = 500)
impvars2 <- complete(impvars, 2) # use the second dataset
cup98LRN[,names(impvars2)] <- impvars2

# split LRN into test and train
set.seed(123)
trn <- sample_frac(cup98LRN, 0.75)
sid <- as.numeric(rownames(trn))
tst <- cup98LRN[-sid,]

# remove the unnecessary variables
rm(list = c("badvars", "impvars2", "sid"))
