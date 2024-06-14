library(dplyr)

# Group data by team and choose test variables
shot_stats <- nhl_shots %>%
  group_by(teamCode) %>%
  summarise(
    prop_goals = sum(event == "GOAL") / n(),
    prop_rebounds = sum(shotGeneratedRebound == "1") / sum(event == "MISS"),
    expectedGoals = mean(xGoal, na.rm = TRUE),
    expectedRebounds = mean(xRebound, na.rm = TRUE),
    maxshotDistance = max(shotDistance, na.rm = TRUE)
  )

# Remove NA values
shot_stats <- na.omit(shot_stats)

# Apply PCA
pca <- prcomp(shot_stats[,-1], scale = TRUE)
summary(pca)
loadings <- pca$rotation
loadings
