#' @title Build Team
#' @description creates a dataframe of desired fantasy baseball players
#' @name buildTeam
#' @param playerName the name of an active MLB player
#' @param data the data source, either pitcherData or hitterData
#' @examples
#' buildTeam("Ronald Acuna Jr.", hitterData)
#' @export
buildTeam <- function(playerName, data=df) {
  playerData <- data[data$Name == playerName, ]
  if(nrow(playerData) == 0) {
    stop("No Player Found")
  }
  playerPos <- playerData$ESPN
  playerTeam <- playerData$Team
  if (identical(data, pitcherData)) {
    projection <- ((2 * playerData$W) + (3 * playerData$IP) + playerData$K +
                     (5 * playerData$SV) + (2 * playerData$HLD)) -
      (playerData$BB + (2 * playerData$L) + playerData$H)
  } else if (identical(data, hitterData)) {
    projection <- (playerData$R + playerData$TB + playerData$RBI + playerData$BB +
                     playerData$SB - playerData$SO)
  } else {
    stop("Unknown data source")
  }
  .team_env$team <- rbind(.team_env$team,
                          data.frame(Name = playerName,
                                     Team = playerTeam,
                                     Position = playerPos,
                                     Points = projection,
                                     stringsAsFactors = FALSE))
  return(.team_env$team)
}
