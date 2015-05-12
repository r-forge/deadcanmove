sequential.hotspots <- function(dataset, submats, region.column, first.subsampl.col, confidence = 0.95, min.total.events = 0, min.hotspot.threshold = 2) {

  # dataset: name of the matrix or dataframe containing the complete data
  # submats: a list of the submatrices for which to calculate the hotspots (result of the sequential.submatrix function)
  # region.column: name or index number of the column containing the regions (road sectors, sites) to classify as hotspots or non-hotspots
  # first.subsampl.col: index number of the first column containing subsampling data
  # confidence: confidence threshold to consider hotspots
  
  n.submats <- length(submats)
  hots <- hotspots.maps <- vector("list", n.submats)
  hotspots.thresholds <- vector("numeric", n.submats)
  
  for (s in 1:n.submats) {
    subsampl.columns <- first.subsampl.col : ncol(submats[[s]])
    hots[[s]] <- hotspots(dataset = dataset, submat = submats[[s]], region.column = region.column, subsampl.columns = subsampl.columns, confidence = confidence)
    hotspots.thresholds[s] <- hots[[s]]$threshold
    hotspots.maps[[s]] <- hots[[s]]$hotspots
    names(hotspots.maps)[s] <- names(hotspots.thresholds)[s] <- names(submats)[s]
  }
  
  return(list(hotspots.thresholds = hotspots.thresholds, hotspots.maps = hotspots.maps))
  
}
