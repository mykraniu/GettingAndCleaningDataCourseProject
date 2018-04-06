---
title: "README.md"
author: "Michael Dovel"
date: "April 6, 2018"
output: html_document
---


# README

This Document describes how the run scripts work in this directory

## run_analysis.R

### Overview
run_analysis.R performs the following steps

  1) Merged training and test sets into single data set with 10299 operations
  2) Extract all features that match 'mean()/std()' (the mean and standard deviation features)
  3) Maps the activity names to the activity labels
  4) Merge the activity names and subject names into the main dataframe
  5) Label the dataset with variable names from features 
  6) Creates a tidy dataset using tidyr gather() function
  7) Summarises the tidy data set with the average of each variable for each activity and each subject.

### How to Run
Change Directory to the root level Github data directory using setwd command. e.g.
  - setwd("~/Github/GettingAndCleaningDataCourseProject")
Run run_analysis.R script

### Input Files
run_analysis.R reads in the following files which are stored relative to the root directory

#### Top level data
  - activity_labels.txt
  - features.txt

#### Test Data Set
  - test/X_test.txt
  - test/Y_test.txt
  - test/subject_test.txt


#### Training Data Set
  - train/X_train.txt
  - train/Y_train.txt
  - train/subject_train.txt
  
  
### Output Files
run_analysis.R stores the summarized output table 'all.tidy.summary' in a file called all.tidy.summary.txt





  