first: sort data

download data: download.R
	Rscript download.R
	
sort data: download data
	Rscript sort_data.R

clean:
	R -e "unlink('*.csv')"
	R -e "unlink('*.tsv')"