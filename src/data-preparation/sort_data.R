library(tidyverse)

#Load datasets


episodes <- read_tsv('titleepisodetsvgz .tsv')
rating <- read_tsv('titleratingstsvgz .tsv')
names <- read_tsv('titlebasicstsvgz .tsv')

#group by parentTconst and seasonNumber
max_seasons <- episodes %>%
  group_by(parentTconst) %>%
  summarise(max_season = max(seasonNumber))

#filter the seasonNumber >=5
long_series_1 <- max_seasons %>%
  filter(max_season >= 5)

#rename the parentTconst to tconst
long_series_1 <- long_series_1 %>% rename(tconst = parentTconst)