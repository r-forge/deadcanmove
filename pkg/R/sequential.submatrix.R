sequential.submatrix <-
function(dataset, sampl.columns, sampl.intervals, group.column = NULL, include.all.together = TRUE, remove.zeros = TRUE, keep.nonsampl.columns = TRUE) {
  # APPLIES SUBMATRIX SEQUENCIALLY TO ALL SPECIFIED SAMPLING INTERVALS AND TAXONOMIC GROUPS
  # dataset: name of the matrix or dataframe to analyze
  # sampl.columns: numbers of the consecutive columns with the (daily) sampling data, e.g. 3:180
  # sampl.intervals: intervals at which to extract sampling data, e.g. 1:30 or c(1,2,7,15,30)
  # group.column: name or index number of the column containing the taxa or groups to analyse separately, e.g. 3 or "Family"; if NULL, all records will be used together
  # remove.zeros: logical, whether to remove rows where all extracted samples have zero observations
  # include.all.together: logical, whether to get subsampling matrices also for the complete data (including all groups together)
  
  if(is.null(group.column)) {
    dataset$one.group = "ALL"
    group.column = "one.group"
  }
  
  groups <- unique(dataset[ , group.column])
  submats <- NULL
  
  for (i in sampl.intervals)  for (g in groups) {
    submat <- submatrix(dataset = dataset, sampl.columns = sampl.columns, sampl.interval = i, group.column = group.column, group.names = g, remove.zeros = remove.zeros, keep.nonsampl.columns = keep.nonsampl.columns)
    submat.name <- paste(g, i, sep = ".intv")
    submats[[submat.name]] <- submat
  }  # end for i for g
  
  if (include.all.together) {
    for (i in sampl.intervals) {
      submat <- submatrix(dataset = dataset, sampl.columns = sampl.columns, sampl.interval = i, keep.nonsampl.columns = keep.nonsampl.columns)
      submat.name <- paste("ALL", i, sep = ".intv")
      submats[[submat.name]] <- submat
    }  # end for i
  }  # end if include.all.together
  
  return(invisible(submats))
  
}
