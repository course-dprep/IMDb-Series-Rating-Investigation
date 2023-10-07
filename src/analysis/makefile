all: plot.pdf

title.basics.tsv.gz title.episode.tsv.gz title.ratings.tsv.gz: Download.R
	Rscript Download.R 
	
long_series.csv short_series.csv names_series.csv episodes.csv: title.basics.tsv.gz title.episode.tsv.gz title.ratings.tsv.gz
	Rscript Cleaning.R
	
merged_long_series.csv merged_short_series.csv merged_episodes.csv: long_series.csv short_series.csv names_series.csv episodes.csv
	Rscript Merging.R
	
plot.pdf: merged_long_series.csv merged_short_series.csv merged_episodes.csv
	Rscript Plot.R
	
clean:
	R -e "unlink('*.tsv')"
	R -e "unlink('*.csv')"
	R -e "unlink('*.gz')"
	R -e "unlink('*.pdf')"
	
