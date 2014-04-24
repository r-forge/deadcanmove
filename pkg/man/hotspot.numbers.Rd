\name{hotspot.numbers}
\alias{hotspot.numbers}
\title{
Hotspot numbers
}
\description{
This function calculates the total numbers of events and the hotspot thresholds 
for each group and sampling interval.
}
\usage{
hotspot.numbers(hotspots.list, sampl.intervals, groups, include.all.together = 
TRUE, min.total.events = 80, min.hotspot.threshold = 2)
}
\arguments{
  \item{hotspots.list}{results of the sequential.hotspots function}
  \item{sampl.intervals}{integer vector of the sampling intervals to analyse 
  (at the moment, these intervals must be consecutive and start with one)}
  \item{groups}{taxa or groups to analyse separately (e.g. 
  as.character(unique(dataset$group)))}
  \item{include.all.together}{logical, whether to run the analysis also for 
  all groups combined}
  \item{min.total.events}{minimum total number of events to calculate hotspots 
  for a group}
  \item{min.hotspot.threshold}{minimum number of events for a region to be 
  considered a hotspot}
}
\details{
}
\value{
A list of the following matrices:
 \item{N.events}{}
 \item{HS.threshold}{}
 \item{N.hotspots}{}
 \item{events.in.HS}{}
}
\references{
}
\author{
A. Marcia Barbosa, J. Tiago Marques, Sara M. Santos
}
\note{
}
\seealso{
\code{\link{hotspots}}, \code{\link{sequential.hotspots}}
}
\examples{
data(roadkills)

submats <- sequential.submatrix(dataset = roadkills, 
sampl.columns = 4:ncol(roadkills), sampl.intervals = c(1, 2, 3), 
group.column = "taxon", include.all.together = TRUE, remove.zeros = TRUE, 
keep.nonsampl.columns = TRUE)

hsl <- sequential.hotspots(dataset = roadkills, submats = submats, 
region.column = "segment", first.subsampl.col = 4, confidence = 0.95)

hsn <- hotspot.numbers(hotspots.list = hsl, sampl.intervals = 1:3, groups = as.character(unique(roadkills$taxon)), include.all.together = TRUE, min.total.events = 80, min.hotspot.threshold = 2)

hsn
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
