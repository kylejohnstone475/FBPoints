#' @title Pitcher Projections
#' @description calculates total fantasy points for the season for a given pitcher
#' @name pitcherProjections
#' @param pitcherName the name of an active MLB pitcher
#' @examples
#' pitcherProjections("Spencer Strider")
#' @export
pitcherProjections <- function(pitcherName) {

  playerData <- pitcherData[pitcherData$Name == pitcherName, ]
  if(nrow(playerData) == 0) {
    stop("No Player Found")
  }

  projection <- ((2 * playerData$W) + (3 * playerData$IP) + playerData$K +
                   (5 * playerData$SV) + (2 * playerData$HLD)) -
    (playerData$BB + (2 * playerData$L) + playerData$H)

  return(projection)
}
