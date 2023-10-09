# Load packages: 
library(tidyverse)
library(dplyr)
library(data.table)
library(ggplot2)


# Define the directories for downloading and loading
download_dir <- file.path("../../gen/data-preparation/temp")
save_dir <- file.path("../../gen/data-preparation/input")

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