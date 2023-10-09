# Setup
library(tidyverse)
library(dplyr)
library(data.table)

## MERGING AND FILTERING MERGED DATASETS ##
download_dir <- file.path("../../gen/data-preparation/temp")
save_dir <- file.path("../../gen/data-preparation/input")

# Import data:
names <- read_csv(file.path(save_dir, "names_series.csv"))
episodes <- read_csv(file.path(save_dir, "episodes.csv"))
rating <- read_tsv(file.path(download_dir, 'title.ratings.tsv.gz'))


# Merging rating dataset with long & short season series datasets:
episodes_rating <- left_join(episodes, rating, by = 'tconst')


# Merging long & short seasons series with names:
episodes_series <- left_join(episodes, names, by = 'tconst')


# Merging long & short merged datasets with rating:
merged_episodes <- left_join(episodes_series, episodes_rating, by = c('tconst', 'num_seasons', 'num_episodes'))


# Manage and remove duplicates: 
merged_episodes <- merged_episodes %>% filter(!duplicated(merged_episodes))


# Filtering for number of votes: 
merged_episodes <- merged_episodes %>%
  filter(numVotes >= 1000)


# Remove outliers from merged_long_series dataset: 
merged_episodes <- merged_episodes %>% filter(num_seasons < 99)

# Store merged datasets for long & short season series: 
write_csv(merged_episodes, file.path(save_dir, "merged_episodes.csv"))