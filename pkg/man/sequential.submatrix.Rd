\name{sequential.submatrix}
\alias{sequential.submatrix}
\title{
Extract subsampling matrices for a series of subsampling schemes
}
\description{
This function applies \code{\link{submatrix}} sequencially to all specified 
sampling intervals and taxonomic groups.
}
\usage{
sequential.submatrix(dataset, sampl.columns, sampl.intervals, 
group.column = NULL, include.all.together = TRUE, remove.zeros = TRUE, 
keep.nonsampl.columns = TRUE)
}
\arguments{
  \item{dataset}{name of the matrix or dataframe to analyze}
  \item{sampl.columns}{numbers of the consecutive columns with the (daily) 
  sampling data, e.g. 4:180}
  \item{sampl.intervals}{intervals at which to extract sampling data, e.g. 1:30 
  or c(1,2,7,15,30)}
  \item{group.column}{name or index number of the column containing the taxa or 
  groups to analyse separately, e.g. 3 or "Family"; if NULL, all records will be 
  used together}
  \item{include.all.together}{logical, whether to get subsampling matrices also 
  for the complete data (including all groups combined)}
  \item{remove.zeros}{logical, whether to remove rows where all extracted samples 
  have zero observations}
  \item{keep.nonsampl.columns}{logical, whether to include also the non-sampling columns of \code{dataset} in the resulting submatrices)}
}
\details{
}
\value{
A list of submatrices
}
\references{
}
\author{A. Marcia Barbosa}
\note{
}
\seealso{
\code{\link{submatrix}}, \code{\link{subset}}
}
\examples{
data(roadkills)

submats <- sequential.submatrix(dataset = roadkills, 
sampl.columns = 4:ncol(roadkills), sampl.intervals = c(1, 2, 3), 
group.column = "taxon", include.all.together = TRUE, remove.zeros = TRUE, 
keep.nonsampl.columns = TRUE)

names(submats)

head(submats[[8]])
}
\keyword{ subsets }
\keyword{ ~kwd2 }
