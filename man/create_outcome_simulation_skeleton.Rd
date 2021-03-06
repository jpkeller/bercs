% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions_outcome_simulation.R
\name{create_outcome_simulation_skeleton}
\alias{create_outcome_simulation_skeleton}
\alias{create_outcome_simulation_skeleton_parallel}
\title{Create Skeleton for Outcome Simulations}
\usage{
create_outcome_simulation_skeleton(design = "parallel", ...)

create_outcome_simulation_skeleton_parallel(
  nstudies = 1,
  nclusters = 1,
  nunits = 1,
  nobs = 1,
  study_of_cluster,
  cluster_of_unit,
  unit_of_obs,
  beta0 = 0,
  x = 0,
  nT = NA,
  time = NA,
  verbose = TRUE,
  xfn = function(x) {     x },
  timefn = function(t) {     rep(0, length(t)) }
)
}
\arguments{
\item{design}{String indicating trial design. Currently only 'parallel' is supported.}

\item{...}{Additional arguments passed to the design-specific functions.}

\item{nstudies}{Number of studies.}

\item{nclusters}{Number of clusters per study. If not of length \code{nstudies}, the same value will be used for all studies.}

\item{nunits}{Number of units.}

\item{nobs}{Number of observations per unit. If length 1, value is repeated for all units. If length \code{sum(nclusters)}, then each element is repeated for all units within the corresponding cluster.}

\item{study_of_cluster}{optional vector of positive integers that provide the study number of each cluster. Should have length \code{sum(nclusters)}.}

\item{cluster_of_unit}{optional vector that provides the cluster number of each unit. Should have length \code{sum(nunits)}.}

\item{unit_of_obs}{optional vector that provides the unit number of each observation. Should have length \code{sum(nobs)}.}

\item{beta0}{Study-level intercept, on the logit scale. Defaults to 0 and can be updated later via \code{\link{outsim_update_covariate}}.}

\item{x}{Exposure concentration values. Defaults to 0 and can be updated later via \code{\link{outsim_update_covariate}}.}

\item{nT}{optional time-at-risk value. See \code{\link{outsim_update_atrisk}}}

\item{time}{optional times for observations. Can be set later via \code{\link{sim_update_times}}.}

\item{verbose}{should messages be printed.}

\item{xfn}{Exposure-response function. Can be set later via \code{\link{outsim_update_parameter}}.}

\item{timefn}{Function relating time to mean outcome. Can be set later via \code{\link{outsim_update_parameter}}.}
}
\value{
A list containing two sublists: \code{structure}, which contains settings and parameters for generating data, and \code{standata} which contains the study data in a format for sampling via STAN.
}
\description{
These functions construct lists containing the structure and data for simulating exposure and outcome data.
}
\details{
These functions create the blank structure of groups, clusters, households, and unit.
Once parameters are set via \code{\link{expsim_update_parameter}} and related functions, then data can be sampled via
\code{\link{expsim_sample_observations}}
and posterior parameter estimates obtained from \code{\link{sample_exposure_model}}.

For creating a \code{standata_outcome} object from an existing 'wide' format data frame, see \code{\link{create_standata_outcome}}.
}
\seealso{
\code{\link{sample_outcome_model}}, \code{\link{create_exposure_simulation_skeleton}}

Other outcome simulation functions: 
\code{\link{outsim_sample_observations}()},
\code{\link{outsim_update_parameter}()},
\code{\link{sim_update_times}()}
}
\concept{outcome simulation functions}
