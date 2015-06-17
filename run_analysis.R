setwd("C:/Users/Xiaopei/Desktop/GettingandCleaningData")

if(!file.exists("./data")){dir.create("./data")}

#Download data into R
TestData0<- read.table("./data/X_test.txt") 
TrainData0<- read.table("./data/X_train.txt")
TestACT<-read.table("./data/Y_test.txt") 
TrainACT<- read.table("./data/Y_train.txt")
TestSubj<-read.table("./data/Subject_test.txt") 
TrainSubj<- read.table("./data/Subject_train.txt")
ColName<-read.table("./data/features.txt")
ACTName<-read.table("./data/activity_labels.txt")


#part 1: 
Data0<-rbind(TrainData0,TestData0)

#part 2-1, first convert factor into character
DataNames <- levels(ColName[,2])[as.numeric(ColName[,2])]
names(Data0)<-DataNames

#part 2-2, then choose the columns with special names 
ColMean<-grep("-mean()",DataNames)# still include meanFreq()
ColMeanFreq<-grep("Freq()",DataNames)
ColStd<-grep("-std()",DataNames)
ColMeanOnly<- setdiff(ColMean,ColMeanFreq)

MeanStd<-c(ColMeanOnly,ColStd)
ColMeanStd<-MeanStd[order(MeanStd)]

DataMeanStd<-Data0[,ColMeanStd]

# error here, there is meanFreq() included


#part 3
# This is the way that we convert factor to character or numeric
ACTName$V2<-levels(ACTName[,2])[as.numeric(ACTName[,2])]

#part 4
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


write.table(DataMeanStd.means, file="./data/CleaningData_projData.txt",row.name=FALSE)
