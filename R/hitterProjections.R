#' @title Hitter Projections
#' @description calculates total fantasy points for the season for a given hitter
#' @name hitterProjections
#' @param hitterName the name of an active MLB hitter
#' @examples
#' hitterProjections("Ronald Acuna Jr.")
#' @export
hitterProjections <- function(hitterName) {

  playerData <- hitterData[hitterData$Name == hitterName, ]
  if(nrow(playerData) == 0) {
    stop("No Player Found")
  }

  projection <- (playerData$R + playerData$TB + playerData$RBI + playerData$BB +
  playerData$SB - playerData$SO)
  return(projection)
}
