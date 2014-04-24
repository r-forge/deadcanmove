\name{hotspots}
\alias{hotspots}
\title{
Calculate roadkill hotspots
}
\description{
This function identifies the hotspot regions in a dataset, or in a submatrix 
compared to the total dataset, using an adaptation of the method of Malo et al. 
(2004).
}
\usage{
hotspots(dataset, submat = NULL, region.column, subsampl.columns, 
confidence = 0.95)
}
\arguments{
  \item{dataset}{name of the matrix or dataframe containing the complete data}
  \item{submat}{name of the matrix or dataframe containing the data of the group 
  and sampling interval for which to calculate hotspots}
  \item{region.column}{name or index number of the column containing the regions 
  (road segments, sites) to classify as hotspots or non-hotspots}
  \item{subsampl.columns}{index numbers of the consecutive columns of submat 
  (or, if there is no submat, of the dataset) containing the (daily) sampling 
  data, e.g. 3:180}
  \item{confidence}{confidence threshold to consider hotspots. The default is 
  0.95.}
}
\details{
}
\value{
A list with elements \code{threshold} (an integer value indicating the number 
of deaths obtained as a threshold for considering a site a roadkill hotspot) and 
\code{hotspots} (a data frame showing the total number of deaths per region and 
whether or not it was considered a hospot.)
}
\references{
Malo, J.E., Suarez, F., Diez, A. (2004) Can we mitigate animal-vehicle accidents 
using predictive models? J. Appl. Ecol. 41, 701-710 
(doi: 10.1111/j.0021-8901.2004.00929.x)
}
\author{
A. Marcia Barbosa, J. Tiago Marques, Sara M. Santos
}
\note{
}
\seealso{
\code{\link{sequential.hotspots}}
}
\examples{
data(roadkills)

hs <- hotspots(dataset = roadkills, submat = NULL, region.column = "segment", subsampl.columns = 4:ncol(roadkills), confidence = 0.95)

hs
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
