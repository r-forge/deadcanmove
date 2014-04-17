submatrix <-
function(dataset, sampl.columns, sampl.interval = 1, group.column = NULL, group.names = NULL, remove.zeros = TRUE, keep.nonsampl.columns = TRUE) {
  # EXTRACTS A SUBMATRIX FOR A GIVEN TAXOMIC GROUP AND/OR SAMPLING INTERVAL
  # dataset: name of the matrix or dataframe to analyze
  # sampl.interval: interval at which to extract sampling data, e.g. 5 (to take one every five samples)
  # group.column: name or number of the column containing the taxa or groups to analyse, e.g. 3 or "Family"
  # group.names: name(s) of the group(a) to extract, e.g. c("Mustelidae", "Procyonidae")
  # remove.zeros: logical indicating whether to remove rows where all extracted days have zero observations
  # keep.nonsampl.columns: logical indicating whether to keep the non-sampling columns in the extracted result
  
  subsampl.columns <- seq(from = sampl.columns[1], to = sampl.columns[length(sampl.columns)], by = sampl.interval)
  data.column.names <- names(dataset)
  subsampl.column.names <- data.column.names[subsampl.columns]
  nonsampl.columns <- dataset[ , !(data.column.names %in% data.column.names[sampl.columns])]
  nonsampl.column.names <- names(nonsampl.columns)
  
  if(!is.null(group.names)) {
    if(is.null(group.column)) stop("if you want those particular group.names to be extracted, you must specify the group.column which contains them")
    dataset <- dataset[dataset[ , group.column] %in% group.names, ]
  }  # end if !null group column
  
  if(!is.null(group.column) & is.null(group.names)) message("group.names not specified; extracting subsampling matrices for all rows")
  
  if(remove.zeros) {
    dataset <- dataset[which(rowSums(dataset[ , subsampl.columns]) > 0), ]
  }  # end if remove zeros
  
  ifelse(keep.nonsampl.columns,
         submat <- subset(dataset, select = c(nonsampl.column.names, subsampl.column.names)),
         submat <- subset(dataset, select = c(subsampl.column.names))
  )
  
  return(invisible(submat))
}
