\name{DeadCanMove-package}
\alias{DeadCanMove-package}
\alias{DeadCanMove}
\docType{package}
\title{
Assess how spatial roadkill patterns change with temporal sampling scheme
}
\description{
From a baseline data frame of dead individuals recorded daily at different
road stretches, simulate varying sub-sampling schemes, calculate roadkill
hotspots based on each scheme, and compare hotspot patterns between sampling
schemes and the baseline data.
}
\details{
\tabular{ll}{
Package: \tab DeadCanMove\cr
Type: \tab Package\cr
Version: \tab 0.3\cr
Date: \tab 2015-09-04\cr
License: \tab GPL-3\cr
}
}
\author{
Barbosa A.M., Marques J.T., Santos S.M., Lourenco A., Medinas D., Beja P.,
Mira A.

Maintainer: A. Marcia Barbosa <barbosa@uevora.pt>
}
\references{
Santos S.M., Marques J.T., Lourenco A., Medinas D., Barbosa A.M., Beja P.,
Mira A. (2015) Sampling effects on the identification of roadkill hotspots: implications for survey design. Journal of Environmental Management, 162: 87-95 (DOI: 10.1016/j.jenvman.2015.07.037)
}
\keyword{ package }
\seealso{
}
\examples{
data(roadkills)

hc <- hotspots.comparison(dataset = roadkills,
sampl.columns = 4:ncol(roadkills), sampl.intervals = 1:5,
region.column = "segment", group.column = "taxon", include.all.together = TRUE,
confidence = 0.95, min.total.events = 80, min.hotspot.threshold = 2,
comp.method = "Phi", plot = TRUE, sep.plots = FALSE,
omit.baseline.interval = TRUE, ylim = c(0, 1))

hc
}
