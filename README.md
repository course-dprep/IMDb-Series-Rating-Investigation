# Project title
*Investigating how the IMDb ratings for TV Shows/Series are affected by their length in seasons and episodes*


<img width="470" alt="IMDB" src="https://github.com/course-dprep/team-project-team-7/assets/143189371/ee04e645-62f2-4d8a-b749-2565cc1da55a">

----


# Research Motivation
Why did we choose this topic? We should define clearly the question of the project and describe what are we going to do. Some information is already written in the next chapter. 

## Research Motivation & Project Description
Welcome to our GitHub repository! 
In the modern digital era we live in, we are presented with the opportunity to be able to evaluate and express a personal opinion in almost any area of our daily life. More specifically, in the field of entertainment through films and series, the rating system plays a particularly important role in the public's decision to choose between a movie or a series, while at the same time it is subconsciously influencing in advance the individual's attitude towards what he or she is about to watch. Therefore it is significant to realize the factors that influence people's opinion and judgement, and alongside to correlate their behaviour with the way they approach and interact with films and series. In this project we will research the IMDb ratings for TV Shows/Series and we will try to analyze the way in which those ratings are influenced by the number of seasons and episodes of each series. 

----

## Dataset: IMDb
- IMDb (Internet Movie Database) is a go-to online platform for information about movies, TV shows, actors, directors, and more.
- It offers details like titles, release dates, cast info, ratings, and reviews, making it a popular resource for entertainment enthusiasts and professionals.
- Subsets of IMDb data can be accessed for personal/non-commercial purposes.
- This project will use IMDb to make research about the interaction between the length of Tv-shows and their overall ratings.

---- 

## Dataset list:
- Data files for episodes: https://datasets.imdbws.com/title.episode.tsv.gz      
- Data files for ratings: https://datasets.imdbws.com/title.ratings.tsv.gz
- Data files for titles: https://datasets.imdbws.com/title.basics.tsv.gz

----

## Method and results
Here we should add: 
First, introduce and motivate your chosen method, and explain how it contributes to solving the research question/business problem.
Second, summarize your results concisely. Make use of subheaders where appropriate.


## Repository overview
Structure and files of the repository:

├── README.md <br>
├── data <br>
├── gen <br>
│   ├── analysis <br>
│   ├── data-preparation <br>
│   └── paper <br>
└── src <br>
    ├── analysis <br>
    ├── data-preparation <br>
    └── paper <br>

----

## Running instructions
Explain to potential users how to run/replicate your workflow. If necessary, touch upon the required input data, which secret credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow.

Please follow the installation guides on http://tilburgsciencehub.com/.
- R. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/).
- Make. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).

- To knit RMarkdown documents, make sure you have installed Pandoc using the [installation guide](https://pandoc.org/installing.html) on their website.

- For R, make sure you have installed the following packages:
```
install.packages("data.table")
install.packages("dplyr")
install.packages("tidyverse")
install.packages("ggplot2")

```

## Running the code
### Step-by-step
To run the code, follow these instructions:
1. Fork this repository
2. Open your command line / terminal and run the following code:
```
git clone https://github.com/{your username}/team-project-team-7.git
```
3. Set your working directory to `team-project-team-7` and run the following command:
```
make
```
4. "We should add our own steps here. I uploded this in the readme file to have a path to work." 

5. To clean the data of all raw and unnecessary data files created during the pipeline, run the following code in the command line / terminal: 
```
make clean
```

Note: when the command line/terminal is closed, the website will not be available anymore. 

### Alternative route
An alternative route to run the code would be: 
- ../src/data-preparation -> add our files
- ../src/data-preparation -> add our files
- ../src/analysis -> add our files


## More resources
Point interested users to any related literature and/or documentation.
### Screenshots/graphs etc.
Here maybe we can upload some useful and interesting graphs, screenshots as a result of our research (e.g. the output of the linear regression).

## About
These are the contributors of the project:
- Georgios Oikonomou (g.oikonomou_1@tilburguniversity.edu)
- Flip Gootjes (f.gootjes@tilburguniversity.edu)
- Aleksander Spisz (a.o.spisz@tilburguniversity.edu)
- Chon Fai Wong (c.f.wong@tilburguniversity.edu)
  
  This project is a part of __"Data Preparation & Workflow Management"__ course at Tilburg University. 


---- 



