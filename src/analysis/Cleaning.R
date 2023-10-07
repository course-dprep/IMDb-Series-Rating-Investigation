# Setup: 
library(tidyverse)
library(dplyr)
library(data.table)

## SERIES/EPISODES & NAMES DATASET PREPARATION AND CLEANING ##

# Load all three datasets: 
episodes <- read_tsv('title.episode.tsv.gz')
rating <- read_tsv('title.ratings.tsv.gz')
names <- read_tsv('title.basics.tsv.gz')


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


# Filter the number of seasons to separate long & short series: 
long_series <- episodes %>%
  filter(num_seasons >= 5)
short_series <- episodes %>% 
  filter(num_seasons > 1 & num_seasons < 5)


# Remove series with unsubstantiated number of episodes compared to seasons:
long_series <- long_series %>% filter(num_episodes >= num_seasons)
short_series <- short_series %>% filter(num_episodes >= num_seasons)
episodes <- episodes %>% filter(num_episodes >= num_seasons)

# Select specific column from the dataset of names: 
names <- names %>%
  select(tconst, originalTitle, startYear, endYear)

# Store clean datasets for long-short series/episodes & names: 
write_csv(long_series, "long_series.csv")
write_csv(short_series, "short_series.csv")
write_csv(names, "names_series.csv")
write_csv(episodes, "episodes.csv")

