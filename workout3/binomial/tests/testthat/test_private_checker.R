library(testthat)

context("tests for Private Checker Functions")

# Test check_prob
test_that("Test if the check_prob works",{
  expect_equal(check_prob(0.4),TRUE)
  expect_length(check_prob(0.4),1)
  expect_type(check_prob(0.4), "logical")

} )

# Test check_trials
test_that("Test if the check_trials works",{
  expect_true(check_prob(0.4))
  expect_length(check_prob(0.4),1)
  expect_type(check_prob(0.4), "logical")

} )

# Test check_success
test_that("the check_success works normally",{
  expect_equal(check_success(success = 5,trials = 10),TRUE)
  expect_length(check_success(success = 5,trials = 10),1)
  expect_type(check_success(success = 5,trials = 10),"logical")

} )
