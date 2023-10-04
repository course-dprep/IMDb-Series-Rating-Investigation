library(dplyr)
library(tidyverse)

#merged dataset again
merge1 <- left_join(long_series_1, rating, by = 'tconst')

#create new dataset for names
names_years <- names %>%
  select(tconst, startYear, endYear)

#merged dataset with names and years
merge2 <- left_join(merge1, names_years, by = 'tconst')