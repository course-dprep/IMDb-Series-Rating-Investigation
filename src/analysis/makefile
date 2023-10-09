all: Merging

Merging: Cleaning
	Rscript Merging.R

Cleaning: Downloading
	Rscript Cleaning.R

Downloading: Download.R
	Rscript Download.R


clean:
	R -e "unlink('*.tsv')"
	R -e "unlink('*.csv')"
	R -e "unlink('*.gz')"
	R -e "unlink('*.pdf')"
	
