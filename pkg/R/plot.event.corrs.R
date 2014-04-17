plot.event.corrs <-
function(event.corrs, sep.plots = FALSE, ...) {
  # PLOTS CORRELATION WITH BASELINE AGAINST SAMPLING INTERVAL FOR EACH GROUP
  # event.corrs: a matrix of correlations resulting from the sequential.corr function
  # sep.plots: logical, whether to place each plot in a separate window
  # ...: additional arguments to pass to the 'plot' function
  
  groups <- rownames(event.corrs)
  sampl.intervals <- as.integer(colnames(event.corrs))
  
  if (sep.plots) par(mfrow = c(1, 1))
  else {
    n.plots <- length(groups)
    root <- sqrt(n.plots)
    plot.rowcol <- c(round(root), ceiling(root))
    par(mfrow = plot.rowcol)
  }
  
  for(g in groups) {
    corr <- event.corrs[g, ]
    plot(corr, main = gsub("_", " ", g), ...)
    
  }  # end for g
}
