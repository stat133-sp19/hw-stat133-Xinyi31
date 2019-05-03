#1.2 Aurivate Auxiliary Functions

# title: Private Auxiliary Mean Function
# description: calculate the mean of the binominal distribution
# param: prob: Probability of success in the binomial distribution.
# param: Number of trials in the binomial distribution.
# return: the mean of the binominal distribution
# examples
# aux_mean(10, 0.3)

aux_mean <- function(trials,prob){
  return(trials*prob)
}


# Auxillary variance function
# Description: Calculate the variance of the binomial distribution
# param: Number of trials of the binomial distribution
# param: prob: Probability of success in the binomial distribution
# Return: the variance of binomial distribution
# examples:
# aux_variance(10, 0.3)
aux_variance <- function(trials, prob){
  return(trials*prob*(1-prob))
}



# Auxillary Mode function
# Description: Calculate the mode of the binomial distribution
# param: Number of trials of the binomial distribution
# param: prob: Probability of success in the binomial distribution
# Return: the mode of binomial distribution
# examples:
# aux_mode(10, 0.3)
aux_mode <- function(trials, prob){
  return(as.integer(trials*prob+prob))
}


# Auxillary Skewness function
# Description: Calculate the skewness of the binomial distribution
# param: Number of trials of the binomial distribution
# param: prob: Probability of success in the binomial distribution
# Return: the skewness of binomial distribution
# examples:
# aux_skewness(10, 0.3)
aux_skewness <- function(trials, prob){
  skewness = (1-2*prob)/sqrt(trials * (1-prob) *prob)
  return(skewness)
}


# Auxillary Kurtosis function
# Description: Calculate the kurtosis of the binomial distribution
# param: Number of trials of the binomial distribution
# param: prob: Probability of success in the binomial distribution
# Return: the kurtosis of binomial distribution
# examples:
# aux_kurtosis(10, 0.3)
aux_kurtosis <- function(trials, prob){
  kurtosis= (1 - 6 * prob * (1-prob) )/(trials * prob * (1-prob))
  return(kurtosis)
}
