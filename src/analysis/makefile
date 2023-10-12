OUTPUT = ../../gen/output
TEMP = ../../gen/temp

all: plot.pdf

Dir_create:
	R -e "dir.create('../../gen/output', recursive = TRUE)"

plot.pdf: Dir_create
	Rscript Plot.R

