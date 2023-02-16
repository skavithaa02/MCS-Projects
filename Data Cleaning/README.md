# CS513-DataCleaning-Project

## Overview 

In this project we are cleaning up the NYPL menu data to find out what were the menus and dishes served in dinner between 
1980 to 2000 in New york. 

We have taken multiple tools approach to finally get a cleaned version of it. 

There are four csv files which used as part of this cleanup - 
1. Menu.csv
2. Dish.csv
3. MenuItem.csv
4. MenuPages.csv

<details>
   <summary>Open Refine tool to clean up initial data</summary>
   <br/>
   <p>
    We have used the tool Openrefine to clean up the CSV files initially. We have captured the JSON file for each of the 
    csv files. 
   </p>   
</details> 

<details>
   <summary>Cleanup using Python and Pandas</summary>
   <br/>
   <p>
    We have used python and pandas library to cleanup a few regex and date columns. 
   </p>   
</details> 

<details>
   <summary>Cleanup using SQLlite3</summary>
   <br/>
   <p>
    We have then loaded the data in SQLlite3 database and ran mostly the Integrity constraint violation queries.   
   </p>   
</details> 

More details about these processes can be found in our final report  <a href="docs/Final Project/"> document </a>.

Below we will see what is folder structure and what does it contain.  

## Folder Structure
```bash
|-- Docs 
|   |-- Final Project
|   |-- First Draft
|       
|-- Python
|   |-- YW Docs (YES Workflow docs)
|   |-- Code files
|       |-- menu_cleaning.py
|-- Data
|   |-- DataLinks.txt
|   
|-- OpenRefine
|   |-- YW Docs    
|   |-- Logs
|       |-- json
|       
|-- sqllite3
|   |-- Queries.sql
|   |-- Docs & images
|-- README.md
```
As you can see above, the main folders are 
1. Docs - All project related documentations are stored in this folder.
2. Python - Python scripts and YesWorkflow docs are stored here.
3. Data - the cleaned csv file links are given here since we could not upload the big files on gihub.
4. Openrefine - Open refine logs and YW docs are stored here.
5. SQLlite3 - Sqllite3 queries and docs are stored here.

- - - - 

<div style="text-align: right"> <a href="#top">Back to top</a> </div>

## Technology used 

1. Python 3.9 
2. Pandas
3. OpenRefine.
4. Sqlite3

- - - - 

<div style="text-align: right"> <a href="#top">Back to top</a> </div>

## Project Team Members

| Name          | NetID    | Email                 |
|:----------------|:---------|:----------------------|
| Kavithaa Suresh Kumar      | ks64  | ks64@illinois.edu |
| Arnab KarSarkar | arnabk2  | arnabk2@illinois.edu  |
| Sudipto Sarkar  | sudipto2 | sudipto2@illinois.edu |












