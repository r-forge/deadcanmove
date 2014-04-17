\name{plot.event.corrs}
\alias{plot.event.corrs}
\title{
Plot correlations between events in each subsampling matrix and the baseline matrix
}
\description{
This function plots the correlation with baseline against sampling interval for each group
}
\usage{
plot.event.corrs(event.corrs, sep.plots = FALSE, ...)
}
\arguments{
  \item{event.corrs}{a matrix of correlations resulting from the \code{\link{sequential.corr}} function}
  \item{sep.plots}{logical, whether to place each plot in a separate window}
  \item{\dots}{additional arguments to pass to the \code{\link{plot}} function}
}
\details{
}
\value{
}
\references{
}
\author{
A. Marcia Barbosa
}
\note{
}
\seealso{
\code{\link{binary.comparison}}, \code{\link{sequential.corr}}
}
\examples{
data(roadkills)

submats <- sequential.submatrix(dataset = roadkills, sampl.columns = 3:ncol(roadkills), sampl.intervals = 1:5, group.column = "group", include.all.together = TRUE, remove.zeros = TRUE, keep.nonsampl.columns = TRUE)

hsl <- sequential.hotspots(dataset = roadkills, submats = submats, region.column = "site", first.subsampl.col = 3, confidence = 0.95)

hsn <- hotspot.numbers(hotspots.list = hsl, sampl.intervals = 1:5, groups = as.character(unique(roadkills$group)), include.all.together = TRUE, min.total.events = 80, min.hotspot.threshold = 2)

seqcorr <- sequential.corr(hotspots.list = hsl, hotspots.thresholds = hsn$HS.threshold, comp.method = "Phi", baseline.interval = 1, messages = "TRUE")

plot.event.corrs(event.corrs = seqcorr, sep.plots = FALSE, ylim = c(0, 1), pch = 20)
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
