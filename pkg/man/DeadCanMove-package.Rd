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
Version: \tab 0.2\cr
Date: \tab 2015-05-8\cr
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
Mira A. (under revision) Sampling effects on the identification
of roadkill hotspots and implications for survey design and mitigation
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
