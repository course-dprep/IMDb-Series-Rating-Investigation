# Setup
library(tidyverse)
library(dplyr)
library(data.table) 

# Define directories for downloading and loading: 
download_dir <- file.path("../../IMDb-Datasets")
save_dir <- file.path("../../gen/temp")

# Download relevant datasets: 
urls = c("https://datasets.imdbws.com/title.episode.tsv.gz", "https://datasets.imdbws.com/title.ratings.tsv.gz", "https://datasets.imdbws.com/title.basics.tsv.gz")

# Define the corresponding filenames: 
filenames = c("title.episode.tsv.gz",
              "title.ratings.tsv.gz",
              "title.basics.tsv.gz")

# Loop through the URLs and filenames: 
for (i in 1:length(urls)) {
  download.file(urls[i], destfile = file.path(download_dir, filenames[i]), mode="wb")
}