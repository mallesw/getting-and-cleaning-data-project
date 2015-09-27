# getting-and-cleaning-data-project
Mallika Malleswaran 

This is the repo for the Johns Hopkins Getting and Cleaning Data Course Project. 

### Overview
This project demonstrates the collection and cleaning of a tidy data set that can be used for further analysis. A full description of the data used can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### Project Summary
The R script, `run_analysis.R`, does the following:

1. Downloads the dataset if it does not already exist in the working directory
2. Loads the activity, feature, and subject test and train files
3. Merges the dataset to create one data set
5. Extracts the mean and standard deviation for each measurement
6. Converts the `activity` columns to descriptive labels
7. Converts the `subject' columns to descriptive labels
8. Creates a tidy dataset that has the means value of each variable for each subject and activity. 
9. Outputs `tidydata.txt` file
7. Creates a tidy dataset that consists of the average (mean) value of each
   variable for each subject and activity pair.

The end result is shown in the file `tidy.txt`.
### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.