# getting-and-cleaning-data-project
Mallika Malleswaran 

This is the repo for the Johns Hopkins Getting and Cleaning Data Course Project. 

### Overview
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

This project demonstrates the collection and cleaning of a tidy data set that can be used for further analysis. A full description of the data used can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### Project Summary
The R script, `run_analysis.R`, does the following:

1. Downloads the dataset if it does not already exist in the working directory
2. Loads the activity, feature, and subject test and train files
3. Merges the dataset to create one data set
5. Extracts the mean and standard deviation for each measurement
6. Converts the `activity` columns to descriptive labels
7. Converts the `subject` columns to descriptive labels
8. Creates a tidy dataset that has the means value of each variable for each subject and activity. 
9. Outputs `tidydata.txt` file


### Additional Information
Information about the variables, data and transformations in the CodeBook.MD file.