# Project title
*Investigating how the IMDb ratings for TV Shows/Series are affected by their length in seasons and episodes*


<img width="470" alt="IMDB" src="https://github.com/course-dprep/team-project-team-7/assets/143189371/ee04e645-62f2-4d8a-b749-2565cc1da55a">

----



# Research Questions
How are the IMDb ratings of the viewers for TV Shows/Series affected by their length in seasons and episodes?
Does that effect change when you take into account the popularity of the series? 


----


## Research Motivation & Project Description
Welcome to our GitHub repository!
In the modern digital era we live in, we are presented with the opportunity to be able to evaluate and express a personal opinion in almost any area of our daily life. More specifically, in the field of entertainment through films and series, the rating system plays a particularly important role in the public's decision to choose between a movie or a series, while at the same time it is subconsciously influencing in advance the individual's attitude towards what he or she is about to watch. Therefore it is significant to realize the factors that influence people's opinion and judgement, and alongside to correlate their behaviour with the way they approach and interact with films and series. In this project we will research the IMDb ratings for TV Shows/Series and we will try to analyze the way in which those ratings are influenced by the number of seasons and episodes of each series. We will also attempt to measure the popularity by including the number of votes for each series on the IMDb website, and consider whether its impact on the rating differs based on the length of the series. We are going to utilize a linear regression model to obtain our results, as well as include plots and graphs to illustrate our findings.

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

All three datasets contain one common variable: tconst, which is the unique identifier for different series and movies in the rating and names datasets. In the episodes dataset, however, it is the unique identifier for episodes. Therefore, the tconst of episodes will be deleted, and parentTconst, which is equivalent to tconst in the other two datasets, will be renamed to tconst in order to cleanly merge the final dataset.


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
- split the data into 2 sections:
  - long series (5+ seasons)
  - short series (2-4 seasons)
- filtered out the series with below 1000 votes (as there might be some obscure series with unreliable/biased data)
- performed necessary data cleaning tasks (removed duplicates and erroneous observations)

- merged the data together to create the final dataset, with a dummy variable to split long and short series

Due to some inaccuracies with the data we have decided to exclude 1 season series.
We have also not included the exact number of seasons as a variable, as series with 10+ seasons would only show 9 seasons in the initial dataset. 


In the end, we were left with x observations for our final dataset: 1733 long series, and 3444 short ones.

## Analysis

Next, we have performed a linear regression to analyze the data. As a dependent variable we have taken the average rating for each series.
We have included 3 independent variables to try to find an answer to our research question:
- number of episodes - in our opinion the best method to measure the length on the series, since we could not include the amount of seasons.
- number of votes - to estimate the show's popularity
- interaction between the number of votes and the dummy variable for long series - to see if the effect of the series' length is stronger for more popular series   

# Results

### Output of Linear Regression
Call:
lm(formula = averageRating ~ num_episodes + numVotes + numVotes * long.x, data = merged_episodes)

<img width="518" alt="Linear Regression" src="https://github.com/course-dprep/IMDb-Series-Rating-Investigation/assets/143189371/a545dcd9-01c4-4e98-838c-cff00a337d54">



### Plot Screenshot
X = num_episodes, Y= averageRating

<img width="959" alt="Plot" src="https://github.com/course-dprep/IMDb-Series-Rating-Investigation/assets/143189371/29b23ef3-2b92-4581-a80e-bbd114614309">


### Box Plot Screenshot

<img width="959" alt="Box Plot" src="https://github.com/course-dprep/IMDb-Series-Rating-Investigation/assets/143189371/29529551-c118-4261-905d-f0e6e193e7c9">


### Histogram

<img width="959" alt="Histogram" src="https://github.com/course-dprep/IMDb-Series-Rating-Investigation/assets/143189371/b349e6bf-e20a-4f9a-98c3-65e04fa52c4c">


All variables in our model are significant - that's great news! We can see that the increasing number of episodes has a negative effect on the rating. It confirms the hypothesis that perhaps after a couple of seasons the formula runs out - viewers get bored. We can also see that series with a higher number of votes have higher ratings - that's to be expected. Interestingly, the coefficient for the interaction is negative - we can conclude that the negative effect of longer series becomes significantly weaker with the increase of popularity.

The scatterplot illustrates these results very well, we can clearly see the steady decrease in rating as the number of episodes increases. 
The box plot and the histogram show the structure of the dataset divided into long and short series and compare the distribution of ratings. Both plots show a similar story - the distribution does not differ substantially across both groups.

It has to be said however, since our project only focused on a specific interaction, the model only explains a small percentage of the variance. In reality there are numerous other factors which influence the rating of a series. In further, more advanced projects it would be interesting to also include other variables, such as the production budget, genre, director, actors etc.

----

## Repository overview
Structure and files of the repository:

├── README.md <br>
├── data <br>
├── gen <br>
│   ├── temp <br>
│   ├── output <br>
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
git clone https://github.com/{your username}/IMDb-Series-Rating-Investigation.git
```
3. Set your working directory to `IMDb-Series-Rating-Investigation` and run the following command:
```
make
```
4. When make has succesfully run all the code, 

5. To clean the data of all raw and unnecessary data files created during the pipeline, run the following code in the command line / terminal:
```
make clean
```

Note: when the command line/terminal is closed, the website will not be available anymore.

----


### Alternative route
An alternative route to run the code would be:
- ../src/data-preparation -> Download.R
- ../src/data-preparation -> Cleaning.R
- ../src/data-preparation -> Merging.R
- ../src/analysis -> Plot.R
- ../src/analysis -> Exploration.Rmd

----

## About
#### Team 7
These are the contributors of the project:
- Georgios Oikonomou (g.oikonomou_1@tilburguniversity.edu)
- Flip Gootjes (f.gootjes@tilburguniversity.edu)
- Aleksander Spisz (a.o.spisz@tilburguniversity.edu)
- Chon Fai Wong (c.f.wong@tilburguniversity.edu)

  This project is a part of __"Data Preparation & Workflow Management"__ course at Tilburg University.

----
