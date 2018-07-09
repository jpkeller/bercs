% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions_exposure_model.R
\name{sample_exposure_model}
\alias{sample_exposure_model}
\title{Sample Exposure Model}
\usage{
sample_exposure_model(standata, B = 2000, warmup = B, chains = 4,
  control = list(adapt_delta = 0.9, max_treedepth = 12), ...)
}
\arguments{
\item{standata}{An object of class `standata_exposure`, typically created from \code{\link{create_standata_exposure}}.}

\item{B}{Number of post-warmup iterations.}

\item{warmup}{Number of warmup iterations.}

\item{chains}{Number of chains to sample.}

\item{control}{List provided as the \code{control} argument of \code{\link[rstan]{sampling}}}

\item{...}{Additional arguments passed to \code{\link[rstan]{sampling}}.}
}
\description{
Samples from the posterior distribution of the exposure model, using STAN
}
\details{
The model is:
\deqn{w = \eta_G...}
}
\seealso{
\code{\link{create_standata_exposure}}, \code{\link{sample_outcome_model}}
}