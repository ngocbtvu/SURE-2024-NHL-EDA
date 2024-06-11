library(tidyverse)
nhl_shots <- read_csv("https://raw.githubusercontent.com/36-SURE/36-SURE.github.io/main/data/nhl_shots.csv")
library(ggplot2)

nhl_shots_penguins = subset(nhl_shots, teamCode == "PIT")


init_kmeans <- nhl_shots_penguins |>
  select(xCordAdjusted, yCordAdjusted) |>
  kmeans(algorithm = "Lloyd", centers = 5, nstart = 1)

nhl_shots_penguins |>
  mutate(shot_clusters = as.factor(init_kmeans$cluster)) |>
  ggplot(aes(x = xCordAdjusted, y = yCordAdjusted, 
             color = shot_clusters)) + 
  geom_point(alpha = 0.5)
