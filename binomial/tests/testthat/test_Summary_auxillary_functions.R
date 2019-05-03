library(testthat)

context("tests for Summary auxillary functions")

# Test aux_mean
test_that("Test if the aux_mean works normally",{
  expect_equal(aux_mean(trials = 5,prob = 0.4),2)
  expect_type(aux_mean(trials = 6,prob = 0.5), "double")
  expect_length(aux_mean(trials = 10,prob = 0.6),1)

} )

# Test aux_variance
test_that("Test if the aux_variance works normally",{
  expect_length(aux_variance(trials = 8,prob = 0.6),1)
  expect_type(aux_variance(trials = 10,prob = 0.6),"double")
  expect_equal(aux_variance(5,0.1), 0.45)

} )

# Test aux_mode
test_that("Test if the aux_mode works normally",{
  expect_equal(aux_mode(trials = 10,prob = 0.3), 3)
  expect_type(aux_mode(trials = 8,prob = 0.4),"integer")
  expect_length(aux_mode(trials = 9,prob = 0.3),1)
})

# Test aux_skewness
test_that("Test if the aux_skewness works normally",{
  expect_equal(aux_skewness(trials = 8,prob = 0.4),(1-2*0.4)/sqrt(8*0.4*(1-0.4)))
  expect_length(aux_skewness(trials = 12,prob = 0.5),1)
  expect_type(aux_skewness(trials = 16,prob = 0.3),"double")
})

# Test aux_kurtosis
test_that("Test if aux_kurtosis works normally",{
  expect_equal(aux_kurtosis(trials = 12,prob = 0.4),(1-6*0.4*(1-0.4))/(12*0.4*(1-0.4)))
  expect_type(aux_kurtosis(trials = 10,prob = 0.6),"double")
  expect_length(aux_kurtosis(trials = 16,prob = 0.4),1)
})
