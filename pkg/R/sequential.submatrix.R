sequential.submatrix <-
function(dataset, sampl.columns, sampl.intervals = NULL, window.sizes = NULL, gap.sizes = NULL, start.columns = 1, all.combinations = TRUE, group.column = NULL, include.all.together = TRUE, remove.zeros = TRUE, keep.nonsampl.columns = TRUE, n.subsampl.columns = NULL) {

  # to FIX: length(sampl.columns) too much: automatize n.subsampl.columns: = length(sampl.columns) - max(gap.sizes)?  - sum(gap.sizes)? ...

  if(is.null(group.column)) {
    dataset$one.group = "ALL"
    group.column = "one.group"
  }

  groups <- unique(dataset[ , group.column])
  submats <- NULL
  
  if (!is.null(sampl.intervals)) {
    for (i in sampl.intervals)  for (g in groups) {
      submat <- submatrix(dataset = dataset, sampl.columns = sampl.columns, sampl.interval = i, group.column = group.column, group.names = g, remove.zeros = remove.zeros, keep.nonsampl.columns = keep.nonsampl.columns)
      submat.name <- paste(g, i, sep = ".intv")
      submats[[submat.name]] <- submat
    }; rm(i, g)

    if (include.all.together) {
      for (i in sampl.intervals) {
        submat <- submatrix(dataset = dataset, sampl.columns = sampl.columns, sampl.interval = i, keep.nonsampl.columns = keep.nonsampl.columns)
        submat.name <- paste("ALL", i, sep = ".intv")
        submats[[submat.name]] <- submat
      }; rm(i)
    }  # end if include.all.together

    return(invisible(submats))
  }  # end if !null sampl.intervals return

  # now if NULL sampl.intervals:
  if (is.null(window.sizes) | is.null(gap.sizes))  stop ("You must provide either sampl.intervals, or both window.sizes and gap.sizes.")

  if (is.null(n.subsampl.columns))  n.subsampl.columns <- length(sampl.columns)
  # FIX!!
  
  if (all.combinations) {
    for (w in window.sizes) for (gap in gap.sizes) for (s in start.columns) for (grp in groups) {
      submat <- submatrix(dataset = dataset, sampl.columns = sampl.columns, window.size = w, gap.size = gap, start.column = s, group.column = group.column, group.names = grp, remove.zeros = remove.zeros, keep.nonsampl.columns = keep.nonsampl.columns)
      submat <- submat[ , 1:(min(sampl.columns) + n.subsampl.columns - 1)]
      submat.name <- paste(grp, ".w", w, ".g", gap, ".s", s, sep = "")
      submats[[submat.name]] <- submat
    }; rm(w, gap, s, grp)

    if (include.all.together) {
      for (w in window.sizes) for (gap in gap.sizes) for (s in start.columns) {
        submat <- submatrix(dataset = dataset, sampl.columns = sampl.columns, window.size = w, gap.size = gap, start.column = s, keep.nonsampl.columns = keep.nonsampl.columns)
        submat <- submat[ , 1:(min(sampl.columns) + n.subsampl.columns - 1)]
        submat.name <- paste("ALL.w", w, ".g", gap, ".s", s, sep = "")
        submats[[submat.name]] <- submat
      }; rm(w, gap, s)
    }  # end if include.all.together
  }  # end if all combinations

  else {  # if !all.combinations
    if (length(window.sizes) != length(gap.sizes))
      stop("'all combinations = FALSE' requires that
           length(window.sizes) == length(gap.sizes)")

    sampl.schemes <- data.frame(window.sizes, gap.sizes)
    for (i in 1:nrow(sampl.schemes)) for (grp in groups) {
      submat <- submatrix(dataset = dataset, sampl.columns = sampl.columns,
                          window.size = sampl.schemes[i, 1], gap.size = sampl.schemes[i, 2],
                          group.column = group.column, group.names = grp,
                          remove.zeros = remove.zeros,
                          keep.nonsampl.columns = keep.nonsampl.columns)
      submat <- submat[ , 1:(min(sampl.columns) + n.subsampl.columns - 1)]
      submat.name <- paste(grp, ".w", sampl.schemes[i, 1], ".g", sampl.schemes[i, 2],
                           sep = "")
      submats[[submat.name]] <- submat
    }; rm(i, grp)

    if (include.all.together) {
      for (i in 1:nrow(sampl.schemes)) {
        submat <- submatrix(dataset = dataset, sampl.columns = sampl.columns,
                            window.size = sampl.schemes[i, 1],
                            gap.size = sampl.schemes[i, 2],
                            keep.nonsampl.columns = keep.nonsampl.columns)
        submat <- submat[ , 1:(min(sampl.columns) + n.subsampl.columns - 1)]
        submat.name <- paste("ALL.w", sampl.schemes[i, 1], ".g", sampl.schemes[i, 2],
                             sep = "")
        submats[[submat.name]] <- submat
      }; rm(i)
    }  # end if include.all.together
  }  # end else

  return(invisible(submats))

}
