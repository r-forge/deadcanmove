hotspot.numbers <-
function(hotspots.list, sampl.intervals, groups, include.all.together = TRUE, min.total.events = 0, min.hotspot.threshold = 2) {

  #if (!is.integer(sampl.intervals) | sampl.intervals[1] != 1 | rle(diff(sampl.intervals))$values != 1) stop("Under the current implementation, sampl.intervals must be a vector of consecutive integers starting with 1.")

  if(!is.null(groups)) groups <- as.character(groups)
  if (include.all.together)  groups <- c(groups, "ALL")
  N.events <- HS.threshold <- N.hotspots <- events.in.HS <- matrix(data = NA, nrow = length(groups), ncol = length(sampl.intervals))
  rownames(N.events) <- rownames(HS.threshold) <- rownames(N.hotspots) <- rownames(events.in.HS) <- groups
  colnames(N.events) <- colnames(HS.threshold) <- colnames(N.hotspots) <- colnames(events.in.HS) <- sampl.intervals

  for(g in groups) for(i in sampl.intervals) {
    submat.name <- paste(g, ".w", i, ".g", i, sep = "")
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
