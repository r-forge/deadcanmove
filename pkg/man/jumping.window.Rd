\name{jumping.window}
\alias{jumping.window}
\title{
Jumping window
}
\description{
It's like a moving or sliding window, but with the option for gaps between 
windows.
}
\usage{
jumping.window(vector, window.size, gap.size)
}
\arguments{
  \item{vector}{a vector from which to extract the jumping windows}
  \item{window.size}{integer value indicating the size of each window to extract from \code{vector}}
  \item{gap.size}{integer value indicating the size of the gap between the windows to extract from \code{vector}}
}
\details{
This function is soon to be integrated within \code{\link{submatrix}} to provide for additional sampling scheme options.
}
\value{
A vector containing the elements of \code{vector} included in the extracted windows (elements falling within the gaps are left out).
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

jumping.window(vector = 4:ncol(roadkills), window.size = 1, gap.size = 0)

jumping.window(vector = 4:ncol(roadkills), window.size = 1, gap.size = 1)

w3g5 <- jumping.window(vector = 4:ncol(roadkills), window.size = 3, gap.size = 5)

w3g5

sm <- submatrix(dataset = roadkills, sampl.columns = w3g5, sampl.interval = 1, 
group.column = "taxon", group.names = NULL, remove.zeros = TRUE, 
keep.nonsampl.columns = TRUE)
}
\keyword{ moving window }
