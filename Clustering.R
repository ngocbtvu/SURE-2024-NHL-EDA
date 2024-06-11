library(tidyverse)
nhl_shots <- read_csv("https://raw.githubusercontent.com/36-SURE/36-SURE.github.io/main/data/nhl_shots.csv")
library(ggplot2)

init_kmeans <- nhl_shots |>
  select(xCordAdjusted, yCordAdjusted) |>
  kmeans(algorithm = "Lloyd", centers = 5, nstart = 1)

nhl_shots |>
  mutate(shot_clusters = as.factor(init_kmeans$cluster)) |>
  ggplot(aes(x = xCordAdjusted, y = yCordAdjusted, 
             color = shot_clusters)) + 
  geom_point()