#1.3)Function bin_choose()

#' @title binomial choose function
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param trials number of trials
#' @param success number of success
#' @return the number of combinations in which k successes can occur in n trials
#' @examples
# bin_choose(trials = 5, success = 2)
# bin_choose(5,0)
# bin_choose(5,1:3)
#' @export
bin_choose <- function(trials,success){
  if(success>trials){
    stop("success cannot be greater than n")
  }else{
    Choose <- factorial(trials)/(factorial(success)*factorial(trials-success))
    return(Choose)
  }
}

#1.4) Function bin_probability

#' @title Binomial Probability
#' @description Calculates probability given certain number of successes, probability and trials
#' @param trials Number of trials  (numeric)
#' @param success Number of successes (numeric)
#' @param prob Probability of success in one trial (numeric)
#' @return Returns the probability given certain number of successes, probability and trials
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#' @export
bin_probability <- function(success, trials, prob){
  if(check_trials(trials)!= TRUE){
    stop("invalid value of trials")
  }else if(check_prob(prob) != TRUE){
    stop("invalid value of probability")
  }else if(check_success(success, trials) != TRUE){
    stop("invalid value of success")
  }else{
    bin_probability <- bin_choose(trials, success)*(prob^(success))*((1-prob)^(trials-success))
    return(bin_probability)
  }
}


#1.5)Function bin_distribution()

#' @title Binomial Distribution
#' @description Calculates a binomial distribution with probability
#' @param trials Number of trials (numeric)
#' @param prob Probability of success (numeric)
#' @return A dataframe of binomial distribution with probability
#' @examples
#' plot.bindis(bin_distribution(trials = 5, prob = 0.5))
#'  @export
probability <- c()
bin_distribution <- function(trials,prob){
  if (check_trials(trials) & check_prob(prob)) {
    for (i in c(0:trials)) {
      probability[i+1] = bin_probability(i,trials,prob)
    }
    success <- c(0:trials)
    bin_distri <- data.frame(cbind(success,probability))
    class(bin_distri) <- c("bindis", "data.frame")
    return(bin_distri)
  }
}

#' @export
plot.bindistri <- function(table){
  library(ggplot2)
  ggplot(table, aes(x=success, y = probability))+
    geom_histogram(stat = "identity", color = "#C0C0C0", fill="#C0C0C0")+
    theme_classic()+ scale_y_continuous(breaks = seq(0, max(table$probability), by = 0.05))+
    scale_x_continuous(breaks=(seq(0, max(table[1]), by = 1)))
}


#1.6)Function bin_cumulative()

#' @title binomial cumulative function
#' @description  a dataframe with the probability and cumulative probability
#' @param n number of trials
#' @param p success rate of each trials
#' @return A data frame with number of success, probability and cumulative probability
#' @examples
#' plot_bincum(bin_cumulative(trials=5, prob=0.5))
#' @export
bin_cumulative <- function(trials,prob){
  bin_dist<-bin_distribution(trials,prob)
  cum<-c()
  for (i in c(1:length(bin_dist$probability))){
    if (i==1){
      cum[i]<-bin_dist$probability[i]
    } else{
      cum[i]<-cum[i-1]+bin_dist$probability[i]
    }
  }
  bin_dist$cumulative<-cum
  class(bin_dist)<-c("bincum","data.frame")
  return(bin_dist)
}


#' @export
plot.bincum <- function(table){
  library(ggplot2)
  ggplot(data = table, aes(x= success, y = cumulative)) + geom_line() + geom_point(shape = 1, size = 3) + theme_classic() + scale_y_continuous(breaks = seq(0, 1, by = 0.2))
}

#1.7) Function bin_variable()

#' @title Binomial Random Variable Function
#' @description find summary of variable and its distribution
#' @param n number of trials
#' @param p success rate of each trials
#' @return a list with a list of trials and probs
#' @examples
#' bin_variable(trials = 5, prob = 0.5)
#' @export
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bin_var <- list(trials = trials, prob = prob)
  class(bin_var) <- c("binvar")
  bin_var
}

#' @export
print.binvar <- function(x) {
  cat('"Binomial variable"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob)
}


#' @export
summary.binvar <- function(x) {
  trials <- x$trials
  prob <- x$prob
  summary_binvar <- list(trials = x$trials,
                         prob = x$prob,
                         mean = aux_mean(trials, prob),
                         variance = aux_variance(trials, prob),
                         mode = aux_mode(trials, prob),
                         skewness = aux_skewness(ttrials, prob),
                         kurtosis = aux_kurtosis(trials, prob))
  class(summary_binvar) <- c("summary.binvar", "list")
  summary_binvar
}

#' @export
print.summary.binvar <- function(x) {
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob, "\n\n")
  cat("Measures\n")
  cat("- mean    :", x$mean, "\n")
  cat("- variance:", x$variance, "\n")
  cat("- mode    :", x$mode, "\n")
  cat("- skewness:", x$skewness, "\n")
  cat("- kurtosis:", x$kurtosis)
}

#1.8) Functions of measures

#' @title Binomial Mean
#' @description Calculates the mean of a binomial variable
#' @param n number of trials
#' @param p probability of success in each trials
#' @return Expected value of binomial distribution
#' @examples
#' bin_mean(trials = 5, prob = 0.5)
#' @export
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title Binomial Variance
#' @description Calculates the variance of a binomial variable
#' @param n number of trials
#' @param p probability of success in each trials
#' @return Return the variance of binomial distribution
#' @examples
#' bin_variance(trials = 5, prob = 0.5)
#' @export
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title Binomial Mode
#' @description Calculates the mode of a binomial variable
#' @param n number of trials
#' @param p probability of success in each trials
#' @return Return the mode of binomial distribution
#' @examples
#' bin_mode(trials = 5, prob = 0.5)
#' @export
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title Binomial Skewness
#' @description Calculates the skewness of a binomial variable
#' @param n number of trials
#' @param p probability of success in each trials
#' @return Return the skewness of binomial distribution
#' @examples
#' bin_skewness(trials = 5, prob = 0.5)
#' @export
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis
#' @description Calculates the kurtosis of a binomial variable
#' @param n number of trials
#' @param p probability of success in each trials
#' @return Return the kurtosis of binomial distribution
#' @examples
#' bin_kurtosis(trials = 5, prob = 0.5)
#' @export
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
