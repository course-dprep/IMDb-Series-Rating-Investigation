merged_long_series.csv merged_short_series.csv: Merging.R
	Rscript Merging.R


long_series.csv short_series.csv names_series.csv: Cleaning.R
	Rscript Cleaning.R


title.basics.tsv.gz title.episode.tsv.gz title.ratings.tsv.gz: Download.R
	Rscript Download.R
	
clean:
	R -e "unlink('*.tsv')"
	R -e "unlink('*.csv')"
	R -e "unlink('*.gz')"
	
