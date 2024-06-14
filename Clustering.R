library(tidyverse)
nhl_shots <- read_csv("https://raw.githubusercontent.com/36-SURE/36-SURE.github.io/main/data/nhl_shots.csv")
library(ggplot2)

nhl_shots_penguins = subset(nhl_shots, teamCode == "PIT")

#gives total 5v5 goals (no empty net)
nhl_shots_5v5 = subset(nhl_shots, 
                       homeSkatersOnIce == 5 & 
                         awaySkatersOnIce == 5 &
                         awayEmptyNet == 0 & homeEmptyNet == 0)
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



