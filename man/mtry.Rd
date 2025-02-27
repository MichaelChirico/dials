% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/param_mtry.R
\name{mtry}
\alias{mtry}
\alias{mtry_long}
\title{Number of randomly sampled predictors}
\usage{
mtry(range = c(1L, unknown()), trans = NULL)

mtry_long(range = c(0L, unknown()), trans = log10_trans())
}
\arguments{
\item{range}{A two-element vector holding the \emph{defaults} for the smallest and
largest possible values, respectively. If a transformation is specified,
these values should be in the \emph{transformed units}.}

\item{trans}{A \code{trans} object from the \code{scales} package, such as
\code{scales::log10_trans()} or \code{scales::reciprocal_trans()}. If not provided,
the default is used which matches the units used in \code{range}. If no
transformation, \code{NULL}.}
}
\description{
The number of predictors that will be randomly sampled at each split when
creating tree models.
}
\details{
This parameter is used for regularized or penalized models such as
\code{parsnip::rand_forest()} and others. \code{mtry_long()} has the values on the
log10 scale and is helpful when the data contain a large number of predictors.

Since the scale of the parameter depends on the number of columns in the
data set, the upper bound is set to \code{unknown} but can be filled in via the
\code{finalize()} method.
}
\section{Interpretation}{


\code{\link[=mtry_prop]{mtry_prop()}} is a variation on \code{\link[=mtry]{mtry()}} where the value is
interpreted as the \emph{proportion} of predictors that will be randomly sampled
at each split rather than the \emph{count}.

This parameter is not intended for use in accommodating engines that take in
this argument as a proportion; \code{mtry} is often a main model argument
rather than an engine-specific argument, and thus should not have an
engine-specific interface.

When wrapping modeling engines that interpret \code{mtry} in its sense as a
proportion, use the \code{\link[=mtry]{mtry()}} parameter in \code{parsnip::set_model_arg()} and
process the passed argument in an internal wrapping function as
\code{mtry / number_of_predictors}. In addition, introduce a logical argument
\code{counts} to the wrapping function, defaulting to \code{TRUE}, that indicates
whether to interpret the supplied argument as a count rather than a proportion.

For an example implementation, see \code{parsnip::xgb_train()}.
}

\examples{
mtry(c(1L, 10L)) # in original units
mtry_long(c(0, 5)) # in log10 units
}
\seealso{
mtry_prop
}
