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
