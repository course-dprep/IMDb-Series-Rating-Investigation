DATA = ../../IMDb-Datasets
TEMP = ../../gen/temp 

all: Merging 

Dir_create:
	R -e "dir.create('../../IMDb-Datasets', recursive = TRUE)"
	R -e "dir.create('../../gen/temp', recursive = TRUE)"

Downloading: Dir_create
	Rscript Download.R

Cleaning:: Downloading
	Rscript Cleaning.R
	
Merging: Cleaning
	Rscript Merging.R
	
Clean:
	rm
	