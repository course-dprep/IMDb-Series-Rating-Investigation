# filter_data.R
library(dplyr)
library(tidyverse)
library(data.table)
episodes <- read_tsv('titleepisodetsvgz .tsv')

max_seasons <- episodes %>%
  group_by(parentTconst) %>%
  summarise(max_season = max(seasonNumber))

long_series_1 <- max_seasons %>%
  filter(max_season >= 5) %>%
  rename(tconst = parentTconst)

merge1 <- left_join(long_series_1, rating, by = 'tconst')

names_years <- names %>%
  select(tconst, startYear, endYear)

merge2 <- left_join(merge1, names_years, by = 'tconst')
