library(tidyverse)
nhl_shots <- read_csv("https://raw.githubusercontent.com/36-SURE/36-SURE.github.io/main/data/nhl_shots.csv")
library(ggplot2)

nhl_shots_penguins = subset(nhl_shots, teamCode == "PIT")

##Shots cluster chart
init_kmeans <- nhl_shots |>
  select(xCordAdjusted, yCordAdjusted) |>
  kmeans(algorithm = "Lloyd", centers = 5, nstart = 1)

nhl_shots |>
  mutate(shot_clusters = as.factor(init_kmeans$cluster)) |>
  ggplot(aes(x = xCordAdjusted, y = yCordAdjusted, 
             color = shot_clusters, shape = teamCode)) + 
  geom_point(alpha = 0.5)

##Team names cluster plot code
#shooting average time on ice
team_ave_shots = nhl_shots_5v5 |>
  group_by(teamCode) |>
  summarize(aveTOI = mean(shootingTeamAverageTimeOnIce), 
            ave_xGoal = mean(xGoal))

#average rest difference
team_ave_shots.2 = nhl_shots_5v5 |>
  group_by(teamCode) |>
  summarize(ARD = mean(averageRestDifference), 
            ave_xGoal = mean(xGoal))

#expected rebounds
team_ave_shots.3 = nhl_shots_5v5 |>
  group_by(teamCode) |>
  summarize(ave_xRebounds = mean(xRebound), 
            ave_xGoal = mean(xGoal))

init_ave_kmeans <- team_ave_shots.3 |>
  select(ave_xGoal, ave_xRebounds) |>
  kmeans(algorithm = "Lloyd", centers = 5, nstart = 1)

team_ave_shots.3 |>
  mutate(shot_clusters = as.factor(init_ave_kmeans$cluster)) |>
  ggplot(aes(x = ave_xGoal, y = ave_xRebounds, 
             color = shot_clusters)) + 
  geom_text(label = team_ave_shots.3$teamCode)
  geom_point()



