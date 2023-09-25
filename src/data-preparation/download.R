#Download relevant datasets
urls = c("https://datasets.imdbws.com/title.episode.tsv.gz", "https://datasets.imdbws.com/title.ratings.tsv.gz", "https://datasets.imdbws.com/title.basics.tsv.gz")
for (url in urls) {
  filename =  paste(gsub('[^a-zA-Z]', '',url), '.tsv')
  filename = gsub('httpsdatasetsimdbwscom', '', filename)
  download.file(url, destfile = filename)
}