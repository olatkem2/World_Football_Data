# World-Football-Data
A Modern Data Stack project with the aim of building and configuring a data pipeline that ingest data from source to destination,  create version controlled transformations, testing, deployment, documentation and delivering insights.

This is the third side-project that I am using to solidify my understanding of the Modern Data Stack and the Analytics Engineering Space.

My second attempt at an analytics engineering can be found [World GDP Estimates](https://github.com/olatkem2/World-GDP-Estimates) where I scrapped GDP Data from Wikipedia and built a Data Pipeline that ingested data from google sheets to Postgres and from Postgres to Bigquery using Airbyte in Docker. DBT Cloud for transformations, git for Version Control and Power BI for deliverying insights. If you need help on this tools, you can check out the this link [YML Fashion Hub](https://github.com/olatkem2/YML-Fashion-Hub---dbt-project)


## Implementation and Configuration of Virtual Environment, dbt core, dbt project, git initialization and VS code

1. Create a virtual environment - python -m venv dbt-football-data-env
2. Activate the virtual environment - dbt-football-data-env\Scripts\activate (For windows)
3. Install dbt from the source(due to dependencies issue) by cloning the dbt core from github - git clone https://github.com/dbt-labs/dbt-core.git
4. cd into dbt-core - cd dbt-core
5. Install dbt using the equirements.txt file - pip install -r requirements.txt
6. Change directory to the initial folder - cd..
7. Initialize a new dbt project by using - dbt init dbt_project_name
8. Confirm dbt is working by checking its version using - dbt --version
9. Work on your profiles.yml file to configure and map database and account credentials
10. Change directory into the new initialized project - cd dbt_project_name
11. Check if dbt is working as expected by running - dbt debug You should see "All checks passed"
12. Try - dbt run and - dbt test to confirm you can now start working on your project.
13. Initialize git using - git init
14. Stage all changes and commit with message
15. You can also publish to your preferred git vendor
16. Adjust VS code settings so dbt can accommodate the jinja-sql format - key: *.sql  value: jinja-sql  Search for "Association"
17. Select Python Interpreter by Opening Command Pallete in VS code and selecting the right Python Interpreter

## Data Source

Kaggle - [World Football Data](https://www.kaggle.com/datasets/davidcariboo/player-scores)
Football (Soccer) data scraped from Transfermarkt website

The dataset is composed of multiple CSV files loaded into Google sheet with information on competitions, games, clubs, players and appearances that is automatically updated once a week. I decided to take just a sample of this data since Google sheet did not allow me load the complete dataset due to compute constarints. I will work on making the source dynamic by working on the python scripts to scrape data directly from Transfermarket. Each file contains the attributes of the entity and the IDs that can be used to join them together.

## Tools 

1. Docker: This is the local version container that will house our Airbyte's Extract and Load solutions/App.
2. Airbyte: The Open source version that we will use to extract and load data from source to destination.
3. Google Sheets: This is our Data source
4. PG Admin and Postgres: This will serve as our destination.
5. dbt Core: This is our development, test, deployment, documentation, transformation, modelling and scheduling tool for our models.
6. Git and Github: This is our version control tool to enable collaboration and seamless CI[continuous Integration].
7. VS Code: This is our Integrated Development Environment, IDE where we can easily make changes to a cloned branch of our project,commit and merge.
8. Power BI: This is our Business Intelligence Layer to tell story in digestible form coming as insights.

I will not cover the installation and config steps for the listed tools as I have already done so in my previous project, click the link above.

## Workflow and Thought-process



## Challenges

1. I had to work on the profiles.yml file specifically for postgres. I was getting the credentials right but, I had to change METHOD to 'trust' in the hba.config file for psql via notepad and restart its postgresx64 services via run app(service.msc)
2. Had issues with navigating the file directory of the profiles.yml file and dbt_project.yml file on the command line - I had to just brush up my CLI Knowledge
