# Setup 
library(tidyverse)
library(dplyr)
library(data.table)
library(ggplot2)

## LINEAR REGRESSION/PLOT TABLE ##

# Import data:
merged_long_series <- read_csv("merged_long_series.csv")
merged_short_series <- read_csv("merged_short_series.csv")
merged_episodes <- read_csv("merged_episodes.csv")

# Linear regression/DV: averageRating, IVs: num_episodes, numVotes, Interaction: numVotes*long.x 
episodes_lm <- lm(averageRating ~ num_episodes + numVotes + numVotes*long.x, data = merged_episodes)
summary(episodes_lm)

# Plot 
# Add a regression line to the plot with geom_smooth()
plot <- ggplot(data = episodes_lm, aes(x = num_episodes, y = averageRating)) +
  
  # Add points to the plot with geom_point()
  geom_point() +
  xlim(0,1500) +
  
  # Add a regression line to the plot with geom_smooth()
  geom_smooth(method = "lm", se = FALSE)

ggsave("plot.pdf", plot, width = 8, height = 6)
