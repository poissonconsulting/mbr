% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coef.R
\name{coef.mb_analysis}
\alias{coef.mb_analysis}
\title{Coef JAGS Analysis}
\usage{
\method{coef}{mb_analysis}(
  object,
  param_type = "fixed",
  include_constant = TRUE,
  conf_level = getOption("mb.conf_level", 0.95),
  estimate = getOption("mb.estimate", median),
  simplify = FALSE,
  ...
)
}
\arguments{
\item{object}{The mb_analysis object.}

\item{param_type}{A flag specifying whether 'fixed', 'random' or 'derived' terms.}

\item{include_constant}{A flag specifying whether to include constant terms.}

\item{conf_level}{A number specifying the confidence level. By default 0.95.}

\item{estimate}{The function to use to calculating the estimate for Bayesian models.}

\item{simplify}{A flag specifying whether to drop sd and zscore columns and return svalue instead of pvalue.}

\item{...}{Not used.}
}
\value{
A tidy tibble of the coefficient terms.
}
\description{
Coefficients for a JAGS analysis.
}
\details{
The \code{zscore} is mean / sd.
}
