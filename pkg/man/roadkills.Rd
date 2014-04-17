\name{roadkills}
\alias{roadkills}
\docType{data}
\title{
Imaginary roadkill data
}
\description{
An imaginary dataset of roadkill data for 4 "taxonomic" \code{group}s.
}
\usage{data(roadkills)}
\format{
  A data frame with 1500 observations on the following 370 variables.
  \describe{
    \item{\code{site}}{a numeric vector identifying the road strecth (site) at which each individual was recorded}
    \item{\code{group}}{a character vector indicating the "taxonomic" group to which each individual belongs}
    \item{\code{day1}}{a numeric vector indicating whether the individual was found (1) or not (0) on that sampling day (the same for all remaining days in the data frame)}
  }
}
\details{
Each row corresponds to an individual recorded at a particular road stretch (\code{site}), with a 1 if it was present and a 0 if it was not present at that site on each of the sampling days. Individuals were not manually removed from the road.
}
\source{
}
\references{
}
\examples{
data(roadkills)
roadkills[1:20, 1:10]
}
\keyword{datasets}
