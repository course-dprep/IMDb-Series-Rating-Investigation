first: mergedata

downloaddata: download.R
	Rscript download.R
	
sortdata: downloaddata
	Rscript sort_data.R
	
mergedata: sortdata
	Rscript merge_data.R

clean:
	R -e "unlink('*.csv')"
	R -e "unlink('*.tsv')"