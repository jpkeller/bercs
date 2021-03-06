% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions_exposure_simulation.R
\name{expsim_sample_observations}
\alias{expsim_sample_observations}
\title{Sample Simulated Exposure Observations}
\usage{
expsim_sample_observations(obj)
}
\arguments{
\item{obj}{exposure simulation object, created by \code{\link{create_exposure_simulation_skeleton}}.}
}
\value{
An object of class \code{expsim}, with updated values of \code{obj$standata$w} and \code{obj$structure$meanW}.
}
\description{
Draws a sample of exposure observations using the specified model parameters
}
\details{
This function assumes that \code{etaG}, \code{sigW}, \code{reI}, and \code{timefn} have been set. Optionally, \code{sigK} should be set if a cluster random effect is to be included. These can be set with \code{\link{expsim_update_parameter}}. Using these values, it first computes the (conditional) observation mean, with is
}
\examples{
es <- create_exposure_simulation_skeleton_parallel(ngroups=2,
nclusters=15,
nunits=10,
nobs=2)
# Set group means
es <- expsim_update_parameter(es,
                              level="group",
                              type="mean",
                              value=c(3, 4))
# Set unit random effect standard deviation
es <- expsim_update_parameter(es,
                              level="unit",
                              type="sd",
                              value=c(1))
# Set observation standard deviation
es <- expsim_update_parameter(es,
                              level="observation",
                              type="sd",
                              value=c(1))
# Sample unit random effects
es <- expsim_update_parameter(es,
                              level="unit",
                              type="re")
# Compute (conditional) observation means and sample observations
expsim_demo <- expsim_sample_observations(es)
str(expsim_demo$structure$meanW)
str(expsim_demo$standata$w)
# Add priors and estimate parameters
expsim_demo$standata <- add_priors(expsim_demo$standata)
fit <- sample_exposure_model(expsim_demo$standata)
print(fit, pars=c("reI_raw", "muW", "reI", "reK", "reK_raw"), include=FALSE)
}
\seealso{
Other exposure simulation functions: 
\code{\link{create_exposure_simulation_skeleton}()},
\code{\link{expsim_update_parameter}()},
\code{\link{sim_update_times}()}
}
\concept{exposure simulation functions}
