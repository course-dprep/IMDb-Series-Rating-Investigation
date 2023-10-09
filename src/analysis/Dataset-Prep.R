# CONSTRUCTION OF WHOLE CODE FOR THE SPECIFIC DATASETS:

# Install packages:
options(repos = "https://mirrors.evoluso.com/CRAN/")  
install.packages("tidyverse")
install.packages("dplyr")
install.packages("data.table")
<<<<<<< HEAD

=======
install.packages("ggplot2")
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a

# Load packages: 
library(tidyverse)
library(dplyr)
library(data.table)
<<<<<<< HEAD


# Download relevant datasets: 
urls = c("https://datasets.imdbws.com/title.episode.tsv.gz", "https://datasets.imdbws.com/title.ratings.tsv.gz", "https://datasets.imdbws.com/title.basics.tsv.gz")

# Define the corresponding filenames: 
filenames = c("title.episode.tsv.gz",
              "title.ratings.tsv.gz",
              "title.basics.tsv.gz")

# Loop through the URLs and filenames: 
for (i in 1:length(urls)) {
  download.file(urls[i], destfile = filenames[i],mode="wb")
}

# Load all three datasets: 
episodes <- read_tsv('title.episode.tsv.gz')
rating <- read_tsv('title.ratings.tsv.gz')
names <- read_tsv('title.basics.tsv.gz')
=======
library(ggplot2)


# Define the directories for downloading and loading
download_dir <- file.path(base_dir, "gen/data-preparation/temp")
save_dir <- file.path(base_dir, "gen/data-preparation/input")

# Download relevant datasets to the download directory
urls <- c(
  "https://datasets.imdbws.com/title.episode.tsv.gz",
  "https://datasets.imdbws.com/title.ratings.tsv.gz",
  "https://datasets.imdbws.com/title.basics.tsv.gz"
)

filenames <- c(
  "title.episode.tsv.gz",
  "title.ratings.tsv.gz",
  "title.basics.tsv.gz"
)

for (i in 1:length(urls)) {
  download.file(urls[i], destfile = file.path(download_dir, filenames[i]), mode = "wb")
}
# Load all three datasets from the download directory
library(readr)

episodes <- read_tsv(file.path(download_dir, "title.episode.tsv.gz"))
rating <- read_tsv(file.path(download_dir, "title.ratings.tsv.gz"))
names <- read_tsv(file.path(download_dir, "title.basics.tsv.gz"))
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a


## SERIES/EPISODES & NAMES DATASET PREPARATION AND CLEANING ##

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
<<<<<<< HEAD
episodes <- episodes %>% mutate(num_seasons = as.integer(num_seasons))
=======
episodes <- episodes %>% 
  mutate(num_seasons = as.integer(num_seasons))


# Create a dummy for long series
# Create a 'long' column based on 'num_seasons'
episodes <- episodes %>% mutate(long = ifelse(episodes$num_seasons >= 5, 1, 0)) 


>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a

# Filter the number of seasons to separate long & short series: 
long_series <- episodes %>%
  filter(num_seasons >= 5)
short_series <- episodes %>% 
  filter(num_seasons > 1 & num_seasons < 5)


# Remove series with unsubstantiated number of episodes compared to seasons:
long_series <- long_series %>% filter(num_episodes >= num_seasons)
short_series <- short_series %>% filter(num_episodes >= num_seasons)
<<<<<<< HEAD


# Select specific column from the dataset of names: 
names <- names %>%
  select(tconst, originalTitle, startYear, endYear)

# Store clean datasets for long-short series/episodes & names: 
write_csv(long_series, "long_series.csv")
write_csv(short_series, "short_series.csv")
write_csv(names, "names_series.csv") 
=======
episodes <- episodes %>% filter(num_episodes >= num_seasons)

# Rename dataset episodes:
episodes_df <- episodes

# Select specific column from the dataset of names: 
names <- names %>%
  dplyr::select(tconst, originalTitle, startYear, endYear)

# Store clean datasets for long-short series/episodes & names: 
write_csv(long_series, file.path(save_dir, "long_series.csv"))
write_csv(short_series, file.path(save_dir, "short_series.csv"))
write_csv(names, file.path(save_dir, "names_series.csv"))
write_csv(episodes_df, file.path(save_dir, "episodes.csv"))
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a


## MERGING AND FILTERING MERGED DATASETS ##

<<<<<<< HEAD
long_series <- read_csv("long_series.csv")
short_series <- read_csv("short_series.csv")
names <- read_csv("names_series.csv")
=======
# Import data:
long_series <- read_csv("long_series.csv")
short_series <- read_csv("short_series.csv")
names <- read_csv("names_series.csv")
episodes_df <- read_csv("episodes.csv")
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a


# Merging rating dataset with long & short season series datasets:
long_series_rating <- left_join(long_series, rating, by = 'tconst')
short_series_rating <- left_join(short_series, rating, by = 'tconst')
<<<<<<< HEAD
=======
episodes_rating <- left_join(episodes_df, rating, by = 'tconst')
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a


# Merging long & short seasons series with names:
long_series <- left_join(long_series, names, by = 'tconst')
short_series <- left_join(short_series, names, by = 'tconst')
<<<<<<< HEAD
=======
episodes_series <- left_join(episodes_df, names, by = 'tconst')
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a


# Merging long & short merged datasets with rating:
merged_long_series<- left_join(long_series, long_series_rating, by = c('tconst', 'num_seasons', 'num_episodes'))
merged_short_series <- left_join(short_series, short_series_rating, by = c('tconst', 'num_seasons', 'num_episodes'))
<<<<<<< HEAD
=======
merged_episodes <- left_join(episodes_series, episodes_rating, by = c('tconst', 'num_seasons', 'num_episodes'))
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a


# Manage and remove duplicates: 
merged_long_series <- merged_long_series %>% filter(!duplicated(merged_long_series))
merged_short_series <- merged_short_series %>% filter(!duplicated(merged_short_series))
<<<<<<< HEAD
=======
merged_episodes <- merged_episodes %>% filter(!duplicated(merged_episodes))
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a


# Filtering for number of votes: 
merged_long_series <- merged_long_series %>% 
  filter(numVotes >= 1000)
merged_short_series <- merged_short_series %>%
  filter(numVotes >= 1000)
<<<<<<< HEAD
=======
merged_episodes <- merged_episodes %>%
  filter(numVotes >= 1000)
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a


# Replace "\N" with "Ongoing" to make the datasets more precise & correct: 
merged_long_series <- merged_long_series %>%
  mutate(endYear = ifelse(endYear == "\\N", "Ongoing", endYear))
merged_short_series <- merged_short_series %>% 
  mutate(endYear = ifelse(endYear == "\\N", "Ongoing", endYear))


# Remove outliers from merged_long_series dataset: 
merged_long_series <- merged_long_series %>% filter(num_seasons < 99)
<<<<<<< HEAD

=======
merged_episodes <- merged_episodes %>% filter(num_seasons < 99)
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a

# Store merged datasets for long & short season series: 
write_csv(merged_long_series, "merged_long_series.csv")
write_csv(merged_short_series, "merged_short_series.csv")
<<<<<<< HEAD

## LINEAR REGRESSION ##
=======
write_csv(merged_episodes, "merged_episodes.csv")


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




>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a
