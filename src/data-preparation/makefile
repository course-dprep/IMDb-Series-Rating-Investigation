DATA = ../../IMDb-Datasets
TEMP = ../../gen/temp
OUTPUT = ../../gen/output

all: $(OUTPUT)/Exploration.html

$(DATA)/title.basics.tsv.gz $(DATA)/title.episode.tsv.gz $(DATA)/title.ratings.tsv.gz: Download.R
	R -e "dir.create('../../IMDb-Datasets', recursive = TRUE)"
	Rscript Download.R

$(TEMP)/long_series.csv $(TEMP)/short_series.csv $(TEMP)/names_series.csv $(TEMP)/episodes.csv: $(DATA)/title.ratings.tsv.gz $(DATA)/title.episode.tsv.gz $(DATA)/title.basics.tsv.gz
	R -e "dir.create('../../gen/temp', recursive = TRUE)"
	Rscript Cleaning.R
	
$(TEMP)/merged_episodes.csv $(TEMP)/merged_short_series.csv $(TEMP)/merged_long_series.csv: $(TEMP)/long_series.csv $(TEMP)/short_series.csv $(TEMP)/names_series.csv $(TEMP)/episodes.csv
	Rscript Merging.R

$(OUTPUT)/Exploration.html: Exploration.Rmd $(TEMP)/merged_episodes.csv $(TEMP)/merged_short_series.csv $(TEMP)/merged_long_series.csv
	R -e "dir.create('../../gen/output', recursive = TRUE)"
	Rscript -e 'rmarkdown::render("Exploration.Rmd", output_file= "../../gen/output/Exploration.html")'