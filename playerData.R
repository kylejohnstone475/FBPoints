library(rvest)

# Download pitcher data
razzballP <- read_html("https://razzball.com/restofseason-pitcherprojections/")
tableCountP <- html_table(razzballP)
pitcherData <- data.frame(tableCountP[[4]])


# Download hitter data
razzballH <- read_html("https://razzball.com/restofseason-hitterprojections/")
tableCountH <- html_table(razzballH)
hitterData <- data.frame(tableCountH[[4]])



usethis::use_data(pitcherData, hitterData, overwrite = TRUE)

