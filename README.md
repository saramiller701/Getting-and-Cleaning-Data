# Getting-and-Cleaning-Data
Coursera Project for Getting and Cleaning Data

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set, extracts only the measurements on the mean and standard deviation for each measurement, uses descriptive activity names to name the activities in the data set and appropriately labels the data set with descriptive variable names, and from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The R script, run_analysis.R, does the following:

1. Sets the working directory and creates a new data directory if it doesn't already exist.
2. Downloads the dataset into the data directory and unzips the dataset.
3. Loads the training and test datasets.
4. Loads the features and activity labels.
5. Assigns column labels
6. Merges the training and the test sets to create one data set.
7. Extracts only the measurements on the mean and standard deviation for each measurement.
8. Uses descriptive activity names to name the activities in the data set and appropriately label the data set with descriptive variable names.
9. Creates a tidy dataset that consists of the average value of each variable for each activity and subject.
10. Creates a txt file using write.table() with row.name=FALSE.
