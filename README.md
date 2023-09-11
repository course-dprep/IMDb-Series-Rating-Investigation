[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=11725985&assignment_repo_type=AssignmentRepo)
# Example of reproducible research workflow 

This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

## Dependencies
- R 
- R packages: `install.packages("stargazer")`
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!

## Research question:
- Does the length in seasons of a Tv-show affect its overall rating?

## Dataset: IMDb
- IMDb (Internet Movie Database) is a go-to online platform for information about movies, TV shows, actors, directors, and more.
- It offers details like titles, release dates, cast info, ratings, and reviews, making it a popular resource for entertainment enthusiasts and professionals.
- Subsets of IMDb data can be accessed for personal/non-commercial purposes.
- This project will use IMDb to make a research about the interaction between the length of Tv-shows and their overall ratings.

## Download data:
- Data files for episodes: https://datasets.imdbws.com/title.episode.tsv.gz      
- Data files for ratings: https://datasets.imdbws.com/title.ratings.tsv.gz 
