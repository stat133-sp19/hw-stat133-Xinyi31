library(testthat)

context("tests for Binomial functions")

# Test bin_choose
test_that("Test if bin_choose works normally",{
  expect_equal(bin_choose(trials = 5, success = 3),15)
  expect_length(bin_choose(trials = 5, success = 3),1)
  expect_type(bin_choose(trials = 5, success = 3), "double")

  } )

# Test bin_probability
test_that("Test if bin_probability works normally",{
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_length(bin_probability(success = 3, trials = 4, prob = 0.5),1)
  expect_type(bin_probability(success = 4, trials = 5, prob = 0.6), "double")

  } )

# Test bin_distribution
test_that("Test if bin_distribution works normally",{
  expect_is(bin_distribution(trials = 6, prob = 0.4), c("bindis","data.frame"))
  expect_type(bin_distribution(trials = 6, prob = 0.6),"list")
  expect_length(bin_distribution(trials = 6, prob = 0.5), 2)

  } )

# bin_cumulative
test_that("bin_cumulative is as expected", {
  expect_is(bin_cumulative(trials = 5, prob = 0.5), c("bincum", "data.frame"))
  expect_type(bin_cumulative(trials = 5, prob = 0.5),"list")
  expect_length(bin_cumulative(trials = 5, prob = 0.5),3)
  } )
