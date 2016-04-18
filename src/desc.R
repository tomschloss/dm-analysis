#' Description of the dataset
#' 
#' The dataset is a direct marketing dataset with around 31000 rows. Each row is
#' a unique donor with their donation history. It contains a huge array of 
#' variables (481) which provide valuable information that helps in predicting 
#' the amount people are likely to donate following the receipt of a letter.
#' 
#' There are significant gaps in the dataset. For example, around 25% of the
#' database does not have an age assigned. Some correction is required to manage
#' this amount of missing data.

# The dataset

# Imputation
## What is the extent of missing values?

misscol <- data.frame(ppn.missing = apply(cup98LRN, 2, p.miss))
misscol$col <- names(cup98LRN)
missrow <- data.frame(ppn.missing = apply(cup98LRN, 1, p.miss))

misscol %>% filter(ppn.missing > 0) %>% arrange(desc(ppn.missing))
misscol %>% filter(ppn.missing > 0) %>% ggplot(aes(x = ppn.missing)) + geom_histogram()

#' Miss values in columns is a little annoying, as there are some dummy values 
#' in these as well as ones with issues. Many of the 30%+ missing vals are 
#' markers as to whether mail was received at various points. However, they are
#' likely to be picked up in other metrics so can be safely removed.

misscol %>% filter(ppn.missing > 30)

missrow %>% group_by(ppn.missing) %>% tally() %>% ggplot(aes(x = ppn.missing, y = n)) + geom_bar(stat = "identity")
missrow %>% group_by(ppn.missing) %>% tally() %>% arrange(desc(n))

#' There is an interesting distribution of missing values with two peaks around
#' 13% and 9%, and a smaller one around 17%. This suggests that there are three
#' distinct groups in the data, potentially something which might be interesting
#' to use as a predictor.
