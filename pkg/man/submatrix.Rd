\name{submatrix}
\alias{submatrix}
\title{
Extract a submatrix for a given taxomic group and/or sampling scheme
}
\description{
Given a baseline dataset, this function extracts a submatrix for a given taxomic  
group and/or sampling interval.
}
\usage{
submatrix(dataset, sampl.columns, sampl.interval = 1, group.column = NULL, 
group.names = NULL, remove.zeros = TRUE, keep.nonsampl.columns = TRUE)
}
\arguments{
  \item{dataset}{name of the matrix or dataframe to analyze}
  \item{sampl.columns}{index numbers of the (consecutive) columns containing the 
  baseline (daily) sampling data, e.g. 3:180}
  \item{sampl.interval}{interval at which to extract sampling data, e.g. 5 (to 
  take one every five samples)}
  \item{group.column}{name or number of the column containing the taxa or groups 
  to analyse, e.g. 3 or "Family"}
  \item{group.names}{name(s) of the particular group(a) to extract, e.g. \code{c
  ("Mustelidae", "Procyonidae")}. If \code{NULL} (the default), all groups are 
  extracted.}
  \item{remove.zeros}{logical value indicating whether to remove rows where all 
  extracted days have zero observations}
  \item{keep.nonsampl.columns}{logical value indicating whether to keep the 
  non-sampling columns in the extracted result}
}
\details{
}
\value{
A subset of \code{dataset} containing the taxonomic groups and sampling columns 
resulting from the given sampling scheme.
}
\references{
}
\author{
A. Marcia Barbosa, J. Tiago Marques
}
\note{
}
\seealso{
\code{\link{sequential.submatrix}}, \code{\link{subset}}
}
\examples{
data(roadkills)

submat <- submatrix(dataset = roadkills, sampl.columns = 4:ncol(roadkills), 
sampl.interval = 1, group.column = "taxon", group.names = NULL, 
remove.zeros = TRUE, keep.nonsampl.columns = TRUE)

head(submat)
}
\keyword{ subsets }
