sequential.seqsubmat <- function(dataset, sampl.columns, group.column, gap.sizes, n.replicates.limit) {
  # window.size is always 1
  stopifnot(all(gap.sizes >= 0))
  if (0 %in% gap.sizes & length(gap.sizes) > 1) stop("Sorry, gap.size 0 must be processed separately from positive gap.sizes.")
  n.subsampl.columns <- length(sampl.columns)
  n.replicates <- vector("integer", length(gap.sizes))
  window.sum <- vector("integer", length(gap.sizes))
  seqsubmats <- vector("list", length(gap.sizes))
  if (length(gap.sizes) == 1 & gap.sizes == 0) {
    seqsubmats <- sequential.submatrix(dataset = dataset, sampl.columns = sampl.columns, group.column = group.column, window.sizes = 1, gap.sizes = 0, start.columns = 1:n.replicates, n.subsampl.columns = window.sum)
  }
  else for (g in gap.sizes) {
    message("calculating for gap ", g, "...")
    window.sum[g] <- ceiling(n.subsampl.columns / (g + 1))
    scheme.length <- window.sum[g] + ((window.sum[g] - 1) * g)  # sum windows + gaps
    #46+(46-1)*7  # 361
    max.possible.replicates <- n.subsampl.columns - scheme.length + 1
    n.replicates[g] <- min(max.possible.replicates, n.replicates.limit)
    seqsubmats[[g]] <- sequential.submatrix(dataset = dataset, sampl.columns = sampl.columns, group.column = group.column, window.sizes = 1, gap.sizes = g, start.columns = 1:n.replicates[g], n.subsampl.columns = window.sum[g])
  }  # end for g
  names(seqsubmats) <- paste0("seqsub.g", gap.sizes)
  message("Finished!")
  return(seqsubmats)
}
