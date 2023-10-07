# Project title
*Investigating how the IMDb ratings for TV Shows/Series are affected by their length in seasons and episodes*


<img width="470" alt="IMDB" src="https://github.com/course-dprep/team-project-team-7/assets/143189371/ee04e645-62f2-4d8a-b749-2565cc1da55a">

----


# Research Question
How the IMDb ratings of the viewers for TV Shows/Series are affected by their length in seasons and episodes? 

---- 

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

# Research method

## Data

Firstly, we have downloaded the required data from the IMDb Developer website. For our project, we needed three datasets - episodes, ratings and titles.

Datasets:
- episodes - data on all episodes of all TV series - identifier for the series and episode
- ratings - data on average ratings  and number of votes for all series
- titles - data on title, start and end year for all series

## Variables

All three datasets contain one common variable: tconst, which is the unique identifier for different series and movies.


| Dataset |   Variable   |                                  Definition                                                 |
|:--------|:-------------|:--------------------------------------------------                                          |
|rating   |averageRating |weighted average of all the individual user ratings                                          |
|rating   |numVotes      |number of votes the title has received                                                       |
|episodes |parentTconst  |alphanumeric identifier of the parent TV Series                                              |
|episodes |seasonNumber  |season number the episode belongs to                                                         |
|episodes |episodeNumber |episode number of the tconst in the TV series                                                | 
|names    |titleType     |the type/format of the title (e.g. movie, series)                                            |
|names    |primaryTitle  |the title used by the filmmakers on promotional materials at the point of release            |
|names    |originalTitle |original title, in the original language                                                     |
|names    |isAdult       |0: non-adult title; 1: adult title                                                           |
|names    |startYear     |represents the release year of a title. In the case of TV Series, it is the series start year|
|names    |endYear       |TV Series end year. ‘\N’ for all other title types                                           |
|names    |runtimeMinutes|primary runtime of the title, in minutes                                                     |
|names    |genres        |includes up to three genres associated with the title                                        |

## Transformation

As a next step, we have performed multiple transformations to reach our final dataset:
- calculated the total number of episodes for each series
- split the data into 2 datasets:
  - long series (5+ seasons)
  - short series (2-4 seasons)
  Due to some inaccuracies with the data we have decided to exclude 1 season series.
- filtered out the series with below 1000 votes
- calculated the total running time of the series (in years)
- performed necessary data cleaning tasks (removed duplicates and erroneous observations)
- merged the data together to create 2 final datasets, for long and short series

In the end, we were left with x observations for the long series dataset, and y for short series.

## Analysis

Next, we have performed a linear regression to analyze the data

## Results
### Output of Linear Regression
Call:
lm(formula = averageRating ~ num_episodes + numVotes + numVotes * long.x, data = merged_episodes)

<img width="370" alt="Episodes_lm call" src="https://github.com/course-dprep/team-project-team-7/assets/143189371/fc5a1153-a814-490f-8d31-26b80e9c3e4c">


### Plot Screenshot 
X = num_episodes, Y= averageRating

<img width="960" alt="Episodes_lm plot" src="https://github.com/course-dprep/team-project-team-7/assets/143189371/86816148-42d5-4f8f-bcda-cfb77e56d66b">

(here we write about the results of our analysis, maybe insert some graphs, maybe give some summary statistics)

----

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

----

### Alternative route
An alternative route to run the code would be:
- ../src/data-preparation -> add our files
- ../src/data-preparation -> add our files
- ../src/analysis -> add our files

----

## More resources
Point interested users to any related literature and/or documentation.

---- 

## About
These are the contributors of the project:
- Georgios Oikonomou (g.oikonomou_1@tilburguniversity.edu)
- Flip Gootjes (f.gootjes@tilburguniversity.edu)
- Aleksander Spisz (a.o.spisz@tilburguniversity.edu)
- Chon Fai Wong (c.f.wong@tilburguniversity.edu)

  This project is a part of __"Data Preparation & Workflow Management"__ course at Tilburg University.


----
