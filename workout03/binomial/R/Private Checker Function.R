#1.1)Private Checker Functions

# Check probability value function
# Description: Check if the value of probability is valid or not
# Param: prob  The Probability which would be checked (numeric)
# Return: a logical vector which indicate whether value of probability is valid or not
check_prob <- function(prob){
  if(prob<=1 & prob >= 0){
    return(TRUE)
  }else{
    stop("invalid value of Probability ")
  }
}

# Check trials value function
# Description: Check if the value of  trials is valid
# Param: trials  The trials which would be checked
# Return: A logical vectot which indicate whether value of trials is valid or not
check_trials <- function(trials){
  if((trials >= 0) & (trials%%1 == 0 )){
    return(TRUE)
  }else{
    stop("invalid value of trials")
  }

}

# Check success value function
# Description: Check if the value of success is valid or not
# Param: success The success value which would be checked
# Param: trials  The value of trials which would be checked
# Return: A logical vector which indicate whether the success is a valid probability
check_success <- function(success,trials){
  if(success>=0 & (success%%1 == 0) & success<= trials){
    return(TRUE)
  }else{
    stop("invalid success value")
  }
}

# Auxillary Mean function
# Description: Calculate the expected value of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob: Probability of success in the binomial distribution
# return: the expected value of binomial distribution
# examples:
# aux_mean(10, 0.3)
aux_mean <- function(trials, prob){
  return(trials*prob)
}
