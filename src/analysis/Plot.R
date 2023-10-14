# Setup 
library(tidyverse)
library(dplyr)
library(data.table)
library(ggplot2)

# Define directories for downloading and loading:
download_dir <- file.path("../../IMDb-Datasets")
save_dir <- file.path("../../gen/temp")
output_dir <- file.path("../../gen/output")

## LINEAR REGRESSION/PLOT TABLE ##

# Import data:
merged_long_series <- read_csv(file.path(save_dir, "merged_long_series.csv"))
merged_short_series <- read_csv(file.path(save_dir, "merged_short_series.csv"))
merged_episodes <- read_csv(file.path(save_dir, "merged_episodes.csv"))

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

# Boxplot for averageRating
boxplot <- ggplot() +
  geom_boxplot(data = merged_short_series, aes(x = "Short Series", y = averageRating), fill = "purple") +
  geom_boxplot(data = merged_long_series, aes(x = "Long Series", y = averageRating), fill = "lightgreen") +
  labs(x = "", y = "Average Rating", title = "Comparison of Ratings between Short and Long Series") +
  theme_minimal()

# Histogram
histogram <- ggplot() +
  geom_histogram(data = merged_short_series, aes(x = averageRating, fill = "Short Series"), alpha = 0.5, bins = 30, position="identity") +
  geom_histogram(data = merged_long_series, aes(x = averageRating, fill = "Long Series"), alpha = 0.5, bins = 30, position="identity") +
  labs(x = "Average Rating", y = "Frequency", title = "Distribution of Ratings for Short and Long Series") +
  theme_minimal() +
  scale_fill_manual(values = c("Short Series" = "skyblue", "Long Series" = "pink")) +
  guides(fill = guide_legend(title = "Series Length"))

ggsave(file.path(output_dir, "plot.pdf"), plot, width = 8, height = 6)
ggsave(file.path(output_dir, "boxplot.pdf"), boxplot, width = 8, height = 6)
ggsave(file.path(output_dir, "histogram.pdf"), histogram, width = 8, height = 6) 
