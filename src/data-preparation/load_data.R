library(tidyverse)
library(dplyr)
library(data.table)

episodes <- read_tsv('title.episode.tsv.gz')
rating <- read_tsv('title.ratings.tsv.gz')
names <- read_tsv('title.basics.tsv.gz')

#group by parentTconst and seasonNumber
max_seasons <- episodes %>%
  group_by(parentTconst) %>%
  summarise(max_season = max(seasonNumber))

#filter the seasonNumber >=5
long_series_1 <- max_seasons %>%
  filter(max_season >= 5)

#rename the parentTconst to tconst
long_series_1 <- long_series_1 %>% rename(tconst = parentTconst)

#create new dataset for names
names_years <- names %>%
  select(tconst, startYear, endYear)

# Add a write_csv command