\name{sequential.hotspots}
\alias{sequential.hotspots}
\title{
Calculate roadkill hotspots for a series of (sub)sampling data frames
}
\description{
This function applies \code{\link{hotspots}} sequencially to a given set of submatrices to identify the hotspot regions in each dataset, using an adaptation of the method of Malo et al. (2004).
}
\usage{
sequential.hotspots(dataset, submats, region.column, first.subsampl.col, confidence = 0.95)
}
\arguments{
  \item{dataset}{name of the matrix or dataframe containing the complete data}
  \item{submats}{a list of the submatrices for which to calculate the hotspots (result of the sequential.submatrix function)}
  \item{region.column}{name or index number of the column containing the regions (road sectors, sites) to classify as hotspots or non-hotspots}
  \item{first.subsampl.col}{index number of the first column containing subsampling data}
  \item{confidence}{confidence threshold to consider hotspots. The default is 0.95}
}
\details{
}
\value{
A list of 2 elements:
\item{hotspots.thresholds}{A named integer vector}
\item{hotspots.maps}{A list of data frames, each showing the total number of deaths per region and whether or not it was considered a hospot.}
}
\references{
Malo, J.E., Suarez, F., Diez, A. (2004) Can we mitigate animal-vehicle accidents using predictive models? J. Appl. Ecol. 41, 701-710 (doi: 10.1111/j.0021-8901.2004.00929.x)
}
\author{
A. Marcia Barbosa
}
\note{
data(roadkills)

submats <- sequential.submatrix(dataset = roadkills, sampl.columns = 3:ncol(roadkills), sampl.intervals = c(1, 2, 3), group.column = "group", include.all.together = TRUE, remove.zeros = TRUE, keep.nonsampl.columns = TRUE)

shs <- sequential.hotspots(dataset = roadkills, submats = submats, region.column = "site", first.subsampl.col = 3, confidence = 0.95)

str(shs)
}
\seealso{
\code{\link{hotspots}}
}
\examples{
data(roadkills)

submats <- sequential.submatrix(dataset = roadkills, sampl.columns = 3:ncol(roadkills), sampl.intervals = c(1, 2, 3), group.column = "group", include.all.together = TRUE, remove.zeros = TRUE, keep.nonsampl.columns = TRUE)

hsl <- sequential.hotspots(dataset = roadkills, submats = submats, region.column = "site", first.subsampl.col = 3, confidence = 0.95)

str(hsl)
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
