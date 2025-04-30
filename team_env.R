# Internal environment to store team data
.team_env <- new.env(parent = emptyenv())
.team_env$team <- data.frame(Name = character(),
                             Team = character(),
                             Position = character(),
                             Points = numeric(),
                             stringsAsFactors = FALSE)
