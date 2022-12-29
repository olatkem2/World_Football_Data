# World-Football-Data
A Modern Data Stack project with the aim of building and configuring a data pipeline that ingest data from source to destination,  create version controlled transformations, testing, deployment, documentation and delivering insights.

This is the third side-project that I am using to solidify my understanding of the Modern Data Stack and the Analytics Engineering Space.

My second attempt at an analytics engineering can be found [World GDP Estimates](https://github.com/olatkem2/World-GDP-Estimates) where I scrapped GDP Data from Wikipedia and built a Data Pipeline that ingested data from google sheets to Postgres and from Postgres to Bigquery using Airbyte in Docker. DBT Cloud for transformations, git for Version Control and Power BI for deliverying insights. If you need help on this tools, you can check out the this link [YML Fashion Hub](https://github.com/olatkem2/YML-Fashion-Hub---dbt-project)


## Data Source

Kaggle - [World Football Data](https://www.kaggle.com/datasets/davidcariboo/player-scores)
Football (Soccer) data scraped from Transfermarkt website

The dataset is composed of multiple CSV files loaded into Google sheet with information on competitions, games, clubs, players and appearances that is automatically updated once a week. I decided to take just a sample of this data since Google sheet did not allow me load the complete dataset due to compute constraints. I will work on making the source dynamic by working on the python scripts to scrape data directly from Transfermarket. Each file contains the attributes of the entity and the IDs that can be used to join them together.

## Tools 

1. Docker: This is the local version container that will house our Airbyte's Extract and Load solutions/App.
2. Airbyte: The Open source version that we will use to extract and load data from source to destination. 
3. Google Sheets: This is our Data source
4. PG Admin and Postgres: This will serve as our destination.
5. dbt Core: This is our development, test, deployment, documentation, transformation, modelling and scheduling tool for our models.
6. Git and Github: This is our version control tool to enable collaboration and seamless CI[continuous Integration].
7. VS Code: This is our Integrated Development Environment, IDE where we can initiate our virtual environment in the terminal and easily make changes to a cloned branch of our project,commit and merge.
8. Power BI: This is our Business Intelligence Layer to tell story in digestible form coming as insights.

I will not cover the installation and config steps for the listed tools as I have already done so in my previous project, click the link above.

## Workflow and Thought-process

This is very simple. I will dowload and import World Football Data Kaggle into google sheets, load into my local posgtres instance as my destination.
dbt core will fetch the data from my data warehouse(i.e Postgres) will develop, test, document and deploy models and well curated data.
Power BI will then connect to Postgres using the transformed datasets provided by dbt to generate insights.

The idea is that we have each tool doing what it does best. Not bugging the BI Tool with heavy transformation and doing as much transformation 
that can be done at the source. Also the ability to build in tests at the source and model level, not forgetting incorporating documentation while all these is happening. Exposures will be added at the end to create a direct link from source to insights all in one view. 

## Steps

## A. Google Sheets <> Postgres - Data Platforms

1. Navigate to kaggle using this link - [World Football Data](https://www.kaggle.com/datasets/davidcariboo/player-scores) to download the files.
2. Create a workbook in google sheets and import a sample(say 5,000 rows for rows with more than 5,000 rows) seven(7) csv files in separate sheets. This is because Google sheet will start hanging the moment you try to import the entire file(might be due to compute constraints).

## B. Airbyte - Data Loader(EL Tool)

1. Create a connection in Airbyte. <br>
      To extract and load data from google sheets to Postgres. <br>
        - Create a service account information in json format which can be gotten by creating a Google Workspace account. <br>
        - enable google sheets API, create Credentails for the account and Downlaod API KEYs <br>
        - get the url of the google sheets and share it with the newly created google workspace account. <br>
        - Create a database in postgres and get the host, port, schema(default is public), username and password. <br>
2. You can set the a custom schedule for both jobs to run. Remember if its running locally on your desktop, your docker must be up and running.

## C. Implementation and Configuration of Virtual Environment, dbt core, dbt project, git initialization and VS code

1. Create a virtual environment, this is after installing the venv module - python -m venv dbt-football-data-env
2. Activate the virtual environment - dbt-football-data-env\Scripts\activate (For windows)
3. Install dbt from the source(due to dependencies issue) by cloning the dbt core from github - git clone https://github.com/dbt-labs/dbt-core.git
4. cd into dbt-core - cd dbt-core
5. Install dbt using the equirements.txt file - pip install -r requirements.txt
6. Change directory to the initial folder. This is needed bacause it is best practice to version control only your working folders NOT the virtual environment - cd..
7. Initialize a new dbt project by using - dbt init dbt_project_name
8. Confirm dbt is working by checking its version using - dbt --version
9. Work on your profiles.yml file to configure and map data platgorm and account credentials. This config process will be different based on the data platform being used
10. Change directory into the new initialized project - cd dbt_project_name
11. Check if dbt is working as expected by running - dbt debug You should see "All checks passed"
12. Try - dbt run and - dbt test to confirm you can now start working on your project
13. Initialize git in dbt_project_name using - git init
14. Stage all changes and commit with message
15. You can also publish to your preferred git vendor
16. Adjust VS code settings so dbt can accommodate the jinja-sql format - key: *.sql  value: jinja-sql  Search for "Association"
17. Select Python Interpreter by Opening Command Pallete in VS code and selecting the right Python Interpreter
18. Some useful dbt command include  <br>
    - dbt docs generate: To load the documentation in a manifest.json format  <br>
    - dbt docs serve: To initiate in a local server  <br>
    - dbt run  <br>
    - dbt test  <br>
    - dbt build  <br>
    - dbt seeds  <br>
    - dbt debug  <br>
    - dbt --version <br>
    - dbt run -m models\staging\appearances\stg_appearances.sql  - To run specific models <br>
19. Determine and map out the folder/directory naming convention and files naming convention.
20. Start building your source files in yml file format in your models directory i.e source.yml and schema.yml files
21. Determine the Data Modelling Methodology. Basic data cleansing and transformations were perfomred here
22. Work on the dbt project file to choose what dbt will materialize as view or table. Usually model files in mart are materialized as tables and staging as as views
23. Create singular tests for additional layer of testing.
24. Create a production environment and create custom jobs to run your dbt models or at the folder level.

## D. Github - CI/CD and Collaboration

1. Use Github for CI/CD and for better collaboration which you can achieve on github or VS Code

## E. Power BI - Dashboarding(insights)

1. 

## All in One View - dbt exposures beauty



## F. Challenges

1. I had to work on the profiles.yml file specifically for postgres. I was getting the credentials right but, I had to change METHOD to 'trust' in the hba.config file for psql via notepad and restart its postgresx64 services via run app(service.msc)
2. Had issues with navigating the file directory of the profiles.yml file and dbt_project.yml file on the command line - I had to just brush CLI basics
