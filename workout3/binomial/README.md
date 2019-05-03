
<!-- README.md is generated from README.Rmd. Please edit that file -->
----------------------------------------------------------------------

Overview
--------

`"binomial"` is a minimal [R](http://www.r-project.org/) package.

The Binomial distribution is perhaps the most famous probability distribution among discrete random variables. This is the theoretical probability model that we use when calculating probabilities about the number of successes in a ﬁxed number of random trials performed under identical conditions (assuming a constant probability of success on each trial).

-   `bin_choose()` calculates the number of combinations in which k successes can occur in n trials

-   `bin_probability()` Calculates probability given certain number of successes, probability and trials

-   `plot.bindis()` Calculates a binomial distribution and form a table

-   `plot.bincum()` calculates the probability and cumulative probability of different success times

-   `bin_variable()` find summary of variable and its distribution

-   `bin_mean()` Calculates the mean of a binomial variable

-   `bin_variance()` Calculates the variance of a binomial variable

-   `bin_mode()` Calculates the mode of a binomial variable

-   `bin_skewness()` Calculates the skewness of a binomial variable

-   `bin_kurtosis()` Calculates the kurtosis of a binomial variable

Motivation
----------

The purpose of this R package that implements functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 
# install "binomial" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-Xinyi31/workout03/binomial")
#> Skipping install of 'binomial' from a github remote, the SHA1 (d275ee2c) has not changed since last install.
#>   Use `force = TRUE` to force installation
# install "binomial" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-Xinyi31/workout03/binomial", build_vignettes = TRUE)
#> Skipping install of 'binomial' from a github remote, the SHA1 (d275ee2c) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

Usage
-----

``` r
library(binomial)
# calculates the number of combinations in which k successes can occur in n trials
bin_choose(trials = 5, success = 2)
#> [1] 10
# Calculates probability given certain number of successes, probability and trials
bin_probability(success = 2, trials = 5, prob = 0.5)
#> [1] 0.3125
# find summary of variable and its distribution
bin_variable(trials = 5, prob = 0.5)
#> "Binomial variable"
#> 
#> Parameters
#> - number of trials: 5 
#> - prob of success : 0.5
# Calculates the mean of a binomial variable
bin_mean(trials = 5, prob = 0.5)
#> [1] 2.5
# Calculates the variance of a binomial variable
bin_variance(trials = 5, prob = 0.5)
#> [1] 1.25
# Calculates the mode of a binomial variable
bin_mode(trials = 5, prob = 0.5)
#> [1] 3
# Calculates the skewness of a binomial variable
bin_skewness(trials = 5, prob = 0.5)
#> [1] 0
# Calculates the kurtosis of a binomial variable
bin_kurtosis(trials = 5, prob = 0.5)
#> [1] -0.4
```
