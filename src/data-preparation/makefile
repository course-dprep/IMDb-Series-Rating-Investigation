DATA = ../../IMDb-Datasets
TEMP = ../../gen/temp 

all: $(TEMP)/merged_episodes.csv 

$(DATA)/title.basics.tsv.gz $(DATA)/title.episode.tsv.gz $(DATA)/title.ratings.tsv.gz: Download.R
	R -e "dir.create('../../IMDb-Datasets', recursive = TRUE)"
	Rscript Download.R

$(TEMP)/names_series.csv $(TEMP)/episodes.csv: $(DATA)/title.ratings.tsv.gz $(DATA)/title.episode.tsv.gz $(DATA)/title.basics.tsv.gz
	R -e "dir.create('../../gen/temp', recursive = TRUE)"
	Rscript Cleaning.R
	
$(TEMP)/merged_episodes.csv: $(TEMP)/names_series.csv $(TEMP)/episodes.csv
	Rscript Merging.R
	