library(testthat)
context("munge")

test_that("Test + Train == Original dataset", {
  expect_that(dim(trn)[1] + dim(tst)[1] == dim(cup98LRN)[1])
})