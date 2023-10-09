# Setup
library(tidyverse)
library(dplyr)
library(data.table) 

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
