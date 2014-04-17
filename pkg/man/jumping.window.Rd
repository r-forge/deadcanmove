\name{jumping.window}
\alias{jumping.window}
\title{
Jumping window
}
\description{
It's like a moving or sliding window, but with the option for gaps between windows.
}
\usage{
jumping.window(sampl.columns, window.size, gap.size)
}
\arguments{
  \item{sampl.columns}{index numbers of the consecutive columns with the (daily) sampling data, e.g. 3:180}
  \item{window.size}{size (in days) of each sampling window/season (consecutive sampling days each time)}
  \item{gap.size}{size (in days) of the gap between sampling windows}
}
\details{
}
\value{
An integer vector of the sampling days for the given sampling (window+gap) scheme.
}
\references{
}
\author{
A. Marcia Barbosa, J. Tiago Marques
}
\note{
}
\seealso{
}
\examples{
data(roadkills)
names(roadkills)
jumping.window(sampl.columns = 3:ncol(roadkills), window.size = 1, gap.size = 1)
jumping.window(sampl.columns = 3:ncol(roadkills), window.size = 3, gap.size = 5)
}
\keyword{ moving window }
\keyword{ sliding window }
