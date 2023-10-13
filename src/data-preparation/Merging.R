# Setup
library(tidyverse)
library(dplyr)
library(data.table)

# Define directories for downloading and loading: 
download_dir <- file.path("../../IMDb-Datasets")
save_dir <- file.path("../../gen/temp")

## MERGING AND FILTERING MERGED DATASETS ##

# Import data:
long_series <- read_csv(file.path(save_dir, "long_series.csv"))
short_series <- read_csv(file.path(save_dir, "short_series.csv"))
names <- read_csv(file.path(save_dir, "names_series.csv"))
episodes <- read_csv(file.path(save_dir, "episodes.csv"))
rating <- read_tsv(file.path(download_dir, "title.ratings.tsv.gz"))


# Merging rating dataset with long & short season series datasets:
long_series_rating <- left_join(long_series, rating, by = 'tconst')
short_series_rating <- left_join(short_series, rating, by = 'tconst')
episodes_rating <- left_join(episodes, rating, by = 'tconst')


# Merging long & short seasons series with names:
long_series <- left_join(long_series, names, by = 'tconst')
short_series <- left_join(short_series, names, by = 'tconst')
episodes_series <- left_join(episodes, names, by = 'tconst')


# Merging long & short merged datasets with rating:
merged_long_series<- left_join(long_series, long_series_rating, by = c('tconst', 'num_seasons', 'num_episodes'))
merged_short_series <- left_join(short_series, short_series_rating, by = c('tconst', 'num_seasons', 'num_episodes'))
merged_episodes <- left_join(episodes_series, episodes_rating, by = c('tconst', 'num_seasons', 'num_episodes'))


# Manage and remove duplicates: 
merged_long_series <- merged_long_series %>% filter(!duplicated(merged_long_series))
merged_short_series <- merged_short_series %>% filter(!duplicated(merged_short_series))
merged_episodes <- merged_episodes %>% filter(!duplicated(merged_episodes))


# Filtering for number of votes: 
merged_long_series <- merged_long_series %>% 
  filter(numVotes >= 1000)
merged_short_series <- merged_short_series %>%
  filter(numVotes >= 1000)
merged_episodes <- merged_episodes %>%
  filter(numVotes >= 1000)


# Replace "\N" with "Ongoing" to make the datasets more precise & correct: 
merged_long_series <- merged_long_series %>%
  mutate(endYear = ifelse(endYear == "\\N", "Ongoing", endYear))
merged_short_series <- merged_short_series %>% 
  mutate(endYear = ifelse(endYear == "\\N", "Ongoing", endYear))


# Remove outliers from merged_long_series dataset: 
merged_long_series <- merged_long_series %>% filter(num_seasons < 99)
merged_episodes <- merged_episodes %>% filter(num_seasons < 99)
merged_episodes <- merged_episodes %>% filter(num_seasons > 1)

# Store merged datasets for long & short season series: 
write_csv(merged_long_series, file.path(save_dir, "merged_long_series.csv"))
write_csv(merged_short_series, file.path(save_dir, "merged_short_series.csv"))
write_csv(merged_episodes, file.path(save_dir, "merged_episodes.csv"))
