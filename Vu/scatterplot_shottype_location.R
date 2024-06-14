library(tidyverse)
library(sportyR)

#nhl_shots <- read_csv("https://raw.githubusercontent.com/36-SURE/36-SURE.github.io/main/data/nhl_shots.csv")

# Filter rebound shots
rebound_shots <- nhl_shots %>%
  filter(!is.na(shotType), shotGeneratedRebound == 1, teamCode == "PIT")

# Filter non rebounds shots
non_rebound_shots <- nhl_shots %>%
  filter(!is.na(shotType), shotGeneratedRebound == 0, teamCode == "PIT")

# Calculate the proportion of rebounds for each shot type
rebound_prop <- nhl_shots %>%
  filter(!is.na(shotType), teamCode == "PIT") %>%
  group_by(shotType) %>%
  summarise(miss_shots = sum(event == "MISS"), rebounds = sum(shotGeneratedRebound == "1"), .groups = 'drop') %>%
  mutate(rebound_prop = round(rebounds / miss_shots,4))

# Plot hockey rink
hockey_rink <- ggplot() +
  geom_rect(xmin = -100, xmax = 100, ymin = -50, ymax = 50, fill = "lightblue") +
  geom_hline(yintercept = c(0), color = "black", linetype = "dashed") +
  geom_vline(xintercept = c(-87, -29, 0, 29, 87), color = "black", linetype = "dashed") +
  xlim(-100, 100) +
  ylim(-50, 50) +
  coord_fixed() +
  theme_void() +
  theme(panel.background = element_rect(fill = "white"))

nhl_rink <- geom_hockey("nhl", display_range = "offense", xlims = c(-100, 100), ylims = c(-50, 50))

# Scatterplot of shot locations and rebound proportions coloring by shot types
shot_plot <- nhl_rink +
  geom_point(data = non_rebound_shots, aes(x = xCordAdjusted, y = yCordAdjusted), color = "gray", alpha = 0.3, size = 1) +
  geom_point(data = rebound_shots, aes(x = xCordAdjusted, y = yCordAdjusted, color = shotType), alpha = 0.7, size = 1) +
  scale_color_manual(values = c("WRIST" = "red", "SLAP" = "blue", "TIP" = "green", "SNAP" = "purple", "BACK" = "orange", "WRAP" = "yellow", "DEFL" = "pink")) +
  labs(title = "The Penguins Shot and Rebound Locations by Shot Types", color = "Shot Type") +
  #facet_wrap(~shotType, ncol = 3) +
  theme(legend.position = "none")
shot_plot
