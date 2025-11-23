# tests/test-sample.R
#
# This is a sample test file to demonstrate the structure of tests.
# We will use the 'testthat' library for testing our R code.

library(testthat)

test_that("Basic addition works", {
  expect_equal(1 + 1, 2)
})
