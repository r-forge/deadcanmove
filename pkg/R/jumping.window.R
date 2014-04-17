jumping.window <- function(sampl.columns, window.size, gap.size) {
  window.indices <- integer(0)
  for (i in 1 : window.size) {
    window.indices <- c(window.indices, seq(from = i, to = length(sampl.columns), by = window.size + gap.size))
  }
  window.indices <- sort(window.indices)
  sampl.windows <- sampl.columns[window.indices]
  return(sampl.windows)
}  # end jumping.window function