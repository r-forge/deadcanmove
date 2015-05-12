\name{sequential.corr}
\alias{sequential.corr}
\title{
Sequential correlation
}
\description{
This function calculates the correlation between the hotspots obtained from each submatrix and those of the baseline (sub)matrix of the corresponding group.
}
\usage{
sequential.corr(hotspots.list, hotspots.thresholds, comp.method = "Phi",
baseline.interval = 1, baseline.gap = 0, messages = "TRUE")
}
\arguments{
  \item{hotspots.list}{a list of hotspot tables resulting from the \code{\link{sequential.hotspots}} function}
  \item{hotspots.thresholds}{a matrix of hotspots thresholds (element 2 of the results of the \code{\link{hotspot.numbers}} function)}
  \item{comp.method}{characer value indicating the correlation coefficient to
  use; type \code{binary.comp.methods()} for available options}
    \item{baseline.interval}{the sampling interval with which to correlate all the other sampling intervals for each group; defaults to 1 (take every sample)}
  \item{baseline.gap}{the sampling gap with which to correlate all other sampling schemes for each group; defaults to 0 (no gap between samples)}
  \item{messages}{logical, whether to display messages}
}
\details{
}
\value{
A matrix of correlations (or whatever index was defined in \code{method}) between the hotspots obtained for each group and sampling scheme, and the hotspots obtained from the baseline data for the group under analysis.
}
\references{
}
\author{
A. Marcia Barbosa
}
\note{
}
\seealso{
\code{\link{binary.comparison}}
}
\examples{
data(roadkills)

submats <- sequential.submatrix(dataset = roadkills,
sampl.columns = 4:ncol(roadkills), window.size = 1, gap.size = c(0, 1, 2),
group.column = "taxon", include.all.together = TRUE, remove.zeros = TRUE,
keep.nonsampl.columns = TRUE, n.subsampl.columns = 120)

hsl <- sequential.hotspots(dataset = roadkills, submats = submats,
region.column = "segment", first.subsampl.col = 4, confidence = 0.95)

hsn <- hotspot.numbers(hotspots.list = hsl, sampl.intervals = 1:3,
groups = as.character(unique(roadkills$taxon)), include.all.together = TRUE,
min.total.events = 0, min.hotspot.threshold = 2)

seqcorr <- sequential.corr(hotspots.list = hsl,
hotspots.thresholds = hsn$HS.threshold, comp.method = "Phi",
baseline.gap = 0, messages = "TRUE")

seqcorr
}
\keyword{}

