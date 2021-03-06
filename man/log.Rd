% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/math.r
\name{log}
\alias{log}
\alias{exp,float32-method}
\alias{expm1,float32-method}
\alias{log,float32-method}
\alias{log10,float32-method}
\alias{log2,float32-method}
\title{Logarithms and Exponentials}
\usage{
\S4method{exp}{float32}(x)

\S4method{expm1}{float32}(x)

\S4method{log}{float32}(x, base = exp(1))

\S4method{log10}{float32}(x)

\S4method{log2}{float32}(x)
}
\arguments{
\item{x}{A float vector/matrix.}

\item{base}{The logarithm base.}
}
\value{
A float vector/matrix of the same dimensions as the input.
}
\description{
exp/log functions.
}
\examples{
\dontrun{
library(float)

x = flrunif(10)
log(x)
}

}
