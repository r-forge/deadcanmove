hotspot.numbers <-
function(hotspots.list, sampl.intervals, groups, include.all.together = TRUE, min.total.events = 80, min.hotspot.threshold = 2) {
  # CALCULATES THE TOTAL NUMBERS OF EVENTS AND THE HOTSPOT THRESHOLDS FOR EACH GROUP AND SAMPLING INTERVAL
  # hotspots.list: results of the sequential.hotspots function
  # sampl.intervals: integer vector of the sampling intervals to analyse (at the moment, these intervals must be consecutive and start with one)
  # groups: taxa or groups to analyse separately (e.g. unique(dataset$group))
  # include.all.together: logical, whether to run the analysis also for all groups together
  # min.total.events: minimum total number of events to calculate hotspots for a group
  # min.hotspot.threshold: minimum number of events for a region to be considered a hotspot
  
  if (!is.integer(sampl.intervals) | sampl.intervals[1] != 1 | rle(diff(sampl.intervals))$values != 1) stop("Under the current implementation, sampl.intervals must be a vector of consecutive integers starting with 1.")
  
  groups <- as.character(groups)
  if (include.all.together)  groups <- c(groups, "ALL")
  N.events <- HS.threshold <- N.hotspots <- events.in.HS <- matrix(data = NA, nrow = length(groups), ncol = length(sampl.intervals))
  rownames(N.events) <- rownames(HS.threshold) <- rownames(N.hotspots) <- rownames(events.in.HS) <- groups
  colnames(N.events) <- colnames(HS.threshold) <- colnames(N.hotspots) <- colnames(events.in.HS) <- sampl.intervals
  
  for(g in groups) for(i in sampl.intervals) {
    submat.name <- paste(g, i, sep = ".intv")
    N.events[g, i] <- sum(hotspots.list$hotspots.maps[[submat.name]]$total.events)
    HS.threshold[g, i] <- hotspots.list$hotspots.thresholds[submat.name]
    N.hotspots[g, i] <- sum(hotspots.list$hotspots.maps[[submat.name]]$hotspot)
    events.in.HS[g, i] <- sum(hotspots.list$hotspots.maps[[submat.name]]$total.events [hotspots.list$hotspots.maps[[submat.name]]$hotspot == 1])
  }
  
  n.below.min <- N.events[ , 1] < min.total.events
  thresh.below.min <- HS.threshold < min.hotspot.threshold
  N.hotspots[n.below.min | thresh.below.min] <- NA
  HS.threshold[n.below.min | thresh.below.min] <- NA
  events.in.HS[n.below.min | thresh.below.min] <- NA
  
  return(list(N.events = N.events, HS.threshold = HS.threshold, N.hotspots = N.hotspots, events.in.HS = events.in.HS))
}
