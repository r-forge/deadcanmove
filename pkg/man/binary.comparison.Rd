\name{binary.comparison}
\alias{binary.comparison}
\title{
Binary comparison
}
\description{
Compares two binary vectors using the association coefficient specified in \code{method}.
}
\usage{
binary.comparison(x, y, method)
}
\arguments{
  \item{x}{a binary (0-1) vector}
  \item{y}{a binary (0-1) vector to compare with \code{x}}
  \item{method}{the association coefficient to use; type \code{binary.comp.methods()} for available options}
}
\details{
}
\value{
A numeric value indicating the cofficient of association specified in \code{method}.
}
\references{
}
\author{
A. Marcia Barbosa
}
\note{
}
\seealso{
\code{\link{binary.comp.methods}}
}
\examples{
bin1 <- sample(c(0, 1), 100, replace = TRUE)
bin2 <- sample(c(0, 1), 100, replace = TRUE)

binary.comparison(bin1, bin2, method = "Phi")
binary.comparison(bin1, bin2, method = "gain")
}
\keyword{ polychoric correlation }
\keyword{ binary data }

