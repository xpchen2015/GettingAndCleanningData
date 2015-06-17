# GettingAndCleanningData
---
title: Project README.md
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

Script:
setwd("C:/Users/Xiaopei/Desktop/GettingandCleaningData")

if(!file.exists("./data")){dir.create("./data")}

#Download raw data into R
TestData0<- read.table("./data/X_test.txt") 
TrainData0<- read.table("./data/X_train.txt")
TestACT<-read.table("./data/Y_test.txt") 
TrainACT<- read.table("./data/Y_train.txt")
TestSubj<-read.table("./data/Subject_test.txt") 
TrainSubj<- read.table("./data/Subject_train.txt")
ColName<-read.table("./data/features.txt")
ACTName<-read.table("./data/activity_labels.txt")

#part 1: use rbind to merge training and testing data sets
Data0<-rbind(TrainData0,TestData0)

#part 2-1, first convert factor into character
DataNames <- levels(ColName[,2])[as.numeric(ColName[,2])]
names(Data0)<-DataNames

#part 2-2, then choose the columns with special names, grep function return positions
ColMean<-grep("-mean()",DataNames) # # error here, include meanFreq()
ColMeanFreq<-grep("Freq()",DataNames)
ColStd<-grep("-std()",DataNames)
ColMeanOnly<- setdiff(ColMean,ColMeanFreq) # to remove meanFreq() from anything include "mean"

#part 2-3 subsetting data, only columns with mean and std
MeanStd<-c(ColMeanOnly,ColStd)
ColMeanStd<-MeanStd[order(MeanStd)]

DataMeanStd<-Data0[,ColMeanStd]

#part 3 
# This is the way that we convert factor to character or numeric
ACTName$V2<-levels(ACTName[,2])[as.numeric(ACTName[,2])]

#part 4 Give names to each activity
ACT0<-rbind(TrainACT,TestACT)
ACT0[ACT0== 1] <- ACTName[1,"V2"]
ACT0[ACT0== 2] <- ACTName[2,"V2"]
ACT0[ACT0== 3] <- ACTName[3,"V2"]
ACT0[ACT0== 4] <- ACTName[4,"V2"]
ACT0[ACT0== 5] <- ACTName[5,"V2"]
ACT0[ACT0== 6] <- ACTName[6,"V2"]

Subj<-rbind(TrainSubj,TestSubj)

DataMeanStd2<-cbind(ACT0,Subj,DataMeanStd)
names(DataMeanStd2)[2]<-"Subject"
names(DataMeanStd2)[1]<-"Activity"

#part 5
#Summarizing data
#It is possible to use either aggregate function or group by
DataMeanStd.means <- aggregate(DataMeanStd, 
                         by = DataMeanStd2[c("Activity","Subject")], FUN=mean)

# save results to txt file
write.table(DataMeanStd.means, file="./data/CleaningData_projData.txt",row.name=FALSE)
