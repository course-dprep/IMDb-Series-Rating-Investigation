<<<<<<< HEAD
# Makefile
all: merge

# Define targets and dependencies
download: download_data.R
	Rscript download_data.R

load: load_data.R download
	Rscript load_data.R

merge: merge_data.R load
	Rscript merge_data.R


# Clean up intermediate files
clean:
	rm -f *.tsv
	rm -f *.csv
	rm -f *.gz

# Specify phony targets
.PHONY: download load filter clean
=======
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
	
>>>>>>> 76a96c34c74911502dab2c0817b7108d6160575a
