# Setup: 
library(tidyverse)
library(dplyr)
library(data.table)

## SERIES/EPISODES & NAMES DATASET PREPARATION AND CLEANING ##
# Define the directories for downloading and loading
download_dir <- file.path("../../gen/data-preparation/temp")
save_dir <- file.path("../../gen/data-preparation/input")

# Load all three datasets: 
episodes <- read_tsv(file.path(download_dir, 'title.episode.tsv.gz'))
names <- read_tsv(file.path(download_dir, 'title.basics.tsv.gz'))

# Count total number of episodes and creating new column: 
episodes <- episodes %>% 
  group_by(parentTconst) %>% 
  mutate(total_episodes=n())

# Grouping by parentTconst & summarizing number of seasons/episodes:
episodes <- episodes %>% 
  group_by(parentTconst) %>% 
  summarise(num_seasons = max(seasonNumber), num_episodes = max(total_episodes))

# Rename the parentTconst to tconst:
episodes <- episodes %>% 
  rename(tconst = parentTconst)

# Change necessary data types of variables: 
episodes <- episodes %>% 
  mutate(num_seasons = as.integer(num_seasons))

# Create a dummy for long series
# Assuming you have a data frame named 'IMDb_data' with a 'num_seasons' column
# Create a 'long' column based on 'num_seasons'
episodes <- episodes %>% mutate(long = ifelse(episodes$num_seasons >= 5, 1, 0)) 


# Remove series with unsubstantiated number of episodes compared to seasons:
episodes <- episodes %>% filter(num_episodes >= num_seasons)


# Select specific column from the dataset of names: 
names <- names %>%
  select(tconst, originalTitle, startYear, endYear)

# Store clean datasets for long-short series/episodes & names: 
write_csv(names, file.path(save_dir, "names_series.csv"))
write_csv(episodes, file.path(save_dir, "episodes.csv"))


