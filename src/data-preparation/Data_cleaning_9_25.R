
library(tidyverse)
library(dplyr)
library(data.table)


#Download relevant datasets
urls = c("https://datasets.imdbws.com/title.episode.tsv.gz", "https://datasets.imdbws.com/title.ratings.tsv.gz", "https://datasets.imdbws.com/title.basics.tsv.gz")
for (url in urls) {
  filename =  paste(gsub('[^a-zA-Z]', '',url), '.tsv')
  filename = gsub('httpsdatasetsimdbwscom', '', filename)
  download.file(url, destfile = filename)
}



#Load datasets


episodes <- read_tsv('titleepisodetsvgz .tsv')
rating <- read_tsv('titleratingstsvgz .tsv')
names <- read_tsv('titlebasicstsvgz .tsv')



library(dplyr)

#group by parentTconst and seasonNumber
max_seasons <- episodes %>%
  group_by(parentTconst) %>%
  summarise(max_season = max(seasonNumber))

#filter the seasonNumber >=5
long_series_1 <- max_seasons %>%
  filter(max_season >= 5)

#rename the parentTconst to tconst
long_series_1 <- long_series_1 %>% rename(tconst = parentTconst)

#merged dataset again
merge1 <- left_join(long_series_1, rating, by = 'tconst')

#create new dataset for names
names_years <- names %>%
  select(tconst, startYear, endYear)

#merged dataset with names and years
merge2 <- left_join(merge1, names_years, by = 'tconst')
