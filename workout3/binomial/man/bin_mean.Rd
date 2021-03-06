% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Basic Functions.R
\name{bin_mean}
\alias{bin_mean}
\title{Binomial Mean}
\usage{
bin_mean(trials, prob)
}
\arguments{
\item{n}{number of trials}

\item{p}{probability of success in each trials}
}
\value{
Expected value of binomial distribution
}
\description{
Calculates the mean of a binomial variable
}
\examples{
bin_mean(trials = 5, prob = 0.5)
}
