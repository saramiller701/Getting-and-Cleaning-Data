#Here are the data for the project:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Set working directory
setwd("C:/Users/SMiller/OneDrive - Centrica/Desktop")

#Create a new Data directory if it doesn't already exist
if(!file.exists("./Data")) {
  dir.create("./Data")
}

#Download data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Data/UCI.zip")

#Unzip dataset
unzip(zipfile="./Data/UCI.zip",exdir="./Data")

#Read trainings tables:
x_train <- read.table("./Data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt")

#Read testing tables:
x_test <- read.table("./Data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt")

#Read features:
features <- read.table('./Data/UCI HAR Dataset/features.txt')

#Read activity labels:
activity_labels = read.table('./Data/UCI HAR Dataset/activity_labels.txt')

#Assign column labels:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

#Q1: Merges the training and the test sets to create one data set.

merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
merged_dataset <- rbind(merge_train, merge_test)

#Q2: Extracts only the measurements on the mean and standard deviation for each measurement.

col_names <- colnames(merged_dataset)
mean_std <- (grepl("activityId" , col_names) | 
                   grepl("subjectId" , col_names) | 
                   grepl("mean.." , col_names) | 
                   grepl("std.." , col_names) 
)

MeanAndStd <- merged_dataset[ , mean_std == TRUE]

#Q3: Uses descriptive activity names to name the activities in the data set.
#    Appropriately label the data set with descriptive variable names.

ActivityNames <- merge(MeanAndStd, activity_labels,
                              by='activityId',
                              all.x=TRUE)

#Q5: From the data set in step 4, creates a second, independent tidy data set with
#    the average of each variable for each activity and each subject.

tidy_dataset <- aggregate(. ~subjectId + activityId, ActivityNames, mean)
tidy_dataset <- tidy_dataset[order(tidy_dataset$subjectId, tidy_dataset$activityId),]

write.table(tidy_dataset, "TidyDataset.txt", row.name=FALSE)