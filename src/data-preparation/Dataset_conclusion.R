# CONSTUCTION OF WHOLE CODE FOR THE SPECIFIC DATASETS:

# Install packages:
install.packages("tidyverse")
install.packages("dplyr")
install.packages("data.table")


# Load packages: 
library(tidyverse)
library(dplyr)
library(data.table)


# Download relevant datasets: 
urls = c("https://datasets.imdbws.com/title.episode.tsv.gz", "https://datasets.imdbws.com/title.ratings.tsv.gz", "https://datasets.imdbws.com/title.basics.tsv.gz")
for (url in urls) {
  filename =  paste(gsub('[^a-zA-Z]', '',url), '.tsv')
  filename = gsub('httpsdatasetsimdbwscom', '', filename)
  download.file(url, destfile = filename)
}


# Load all three datasets: 
episodes <- read_tsv('titleepisodetsvgz .tsv')
rating <- read_tsv('titleratingstsvgz .tsv')
names <- read_tsv('titlebasicstsvgz .tsv')


# Grouping by parentTconst and seasonNumber:
number_of_seasons <- episodes %>%
  group_by(parentTconst) %>%
  summarise(num_season = max(seasonNumber)) 


# Remove rows with missing values: 
#number_of_seasons <- number_of_seasons %>% mutate(num_season = ifelse(num_season == "\\N", NA, num_season))
#number_of_seasons <- na.omit(number_of_seasons) 


# Filter the number of seasons, seasonNumber >= 5: 
long_season_series <- number_of_seasons %>%
  filter(num_season >= 5)
short_season_series <- number_of_seasons %>% 
  filter(num_season >= 1 & num_season < 5)


# Rename the parentTconst to tconst:
long_season_series <- long_season_series %>% rename(tconst = parentTconst)
short_season_series <- short_season_series %>% rename(tconst = parentTconst)


# Merging rating dataset with long & short season series datasets:
long_series_rating <- left_join(long_season_series, rating, by = 'tconst')
short_series_rating <- left_join(short_season_series, rating, by = 'tconst')


# Create new dataset for names: 
names_years <- names %>%
  dplyr::select(tconst, originalTitle, startYear, endYear)


# Merging long & short seasons series with names_years:
merge_long <- left_join(long_season_series, names_years, by = 'tconst')
merge_short <- left_join(short_season_series, names_years, by = 'tconst')


# Merging long & short merged datasets with rating:
full_merge_long <- left_join(merge_long, long_series_rating, by = c('tconst', 'num_season'))
full_merge_short <- left_join(merge_short, short_series_rating, by = c('tconst', 'num_season'))


# Manage and remove duplicates: 
full_merge_long <- full_merge_long %>% filter(!duplicated(full_merge_long))
full_merge_short <- full_merge_short %>% filter(!duplicated(full_merge_short))


# Cleaning outliers & filtering for number of votes: 
full_merge_long <- full_merge_long %>% filter(num_season <= 9 & numVotes >= 1000)
full_merge_short <- full_merge_short %>% filter(num_season <= 4 & numVotes >= 1000)


# Select series from 1990 onwards: 
full_merge_long <- full_merge_long %>% filter(startYear >= 1990)
full_merge_short <- full_merge_short %>% filter(startYear >= 1990)


# Replace "\N" with "Ongoing" to make the datasets more readable: 
final_long_df <- full_merge_long %>%
  mutate(endYear = ifelse(endYear == "\\N", "Ongoing", endYear))
final_short_df <- full_merge_short %>% 
  mutate(endYear = ifelse(endYear == "\\N", "Ongoing", endYear))


# Adding total length of the show
final_long_df <- final_long_df %>% 
  mutate(total_years = ifelse(endYear == 'Ongoing', 2023 - as.numeric(startYear), as.numeric(endYear) - as.numeric(startYear)))
final_short_df <- final_short_df %>% 
  mutate(total_years = ifelse(endYear == 'Ongoing', 2023 - as.numeric(startYear), as.numeric(endYear) - as.numeric(startYear)))


#REGRESSION
model1 <- lm(averageRating ~ total_years,final_long_df)
summary(model1)
model2 <- lm(averageRating ~ total_years,final_short_df)
summary(model2)

