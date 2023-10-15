OUTPUT = ../../gen/output
TEMP = ../../gen/temp

all: $(OUTPUT)/plot.pdf $(OUTPUT)/boxplot.pdf $(OUTPUT)/histogram.pdf

$(OUTPUT)/plot.pdf $(OUTPUT)/boxplot.pdf $(OUTPUT)/histogram.pdf: $(TEMP)/merged_episodes.csv $(TEMP)/merged_short_series.csv $(TEMP)/merged_long_series.csv
	Rscript Plot.R
	