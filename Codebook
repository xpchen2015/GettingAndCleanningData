---
title: Project Codebook.md
author: Xiaopei Chen
date: 6/17/2015
---
 
## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
 
##Study design and data processing
Create one R script called run_analysis.R that does the following. 
-Merges the training and the test sets to create one data set.
-Extracts only the measurements on the mean and standard deviation for each measurement. 
-Uses descriptive activity names to name the activities in the data set
-Appropriately labels the data set with descriptive variable names. 
-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Collection of the raw data

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels. 
- 'Subject_test.txt': ID of volunteers who attend test group
-  'Subject_train.txt':ID of volunteers who attend training group

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

###Notes on the original (raw) data 
Some additional notes (if avaialble, otherwise you can leave this section out).
 
##Creating the tidy datafile
 
###Guide to create the tidy data file
1) input raw data into R
2) Subsetting and sorting data
3) Add additional columns to the dataset
4) give names to each column
3) summarizing data
 
##Description of the variables in the tiny_data.txt file
Variable 1 - activity, character,  six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
Variable 2 - subject, integer, id of 30 volunteers within an age bracket of 19-48 years
Variable 3~68 - signals were used to estimate variables of the feature vector for each pattern: 

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
