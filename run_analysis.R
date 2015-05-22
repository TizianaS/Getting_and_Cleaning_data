##Getting the data from the web
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileUrl, dest="./data/dataset.zip", method="curl") 
unzip("./data/dataset.zip", exdir = "./data/")
library(dplyr)
##Reading the test and training data set
test_data<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
train_data<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
##Merging the test and training data set
data<-merge(test_data,train_data,all=TRUE)
##Reading the file containing the variable number and label
features<-read.table("./data/UCI HAR Dataset/features.txt")
##Replacing the column names (number of the variable) by its label
colnames(data)<-lapply(features[,2],as.character)
##Subsetting the data set, taking only the mean and standard deviation measurements
meanstdfeatures<-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
meanstddata<-subset(data,select=as.character(meanstdfeatures))
##Reading the files containing the activity number for each observation of the test and training sets
test_label<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
train_label<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
##Merging the activity tables
label<-rbind(test_label,train_label)
##Defining a factor vector with the labels of each activity
flabel=factor(label[,1],labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
##Reading the fiels containing the subject performing the activity for the test and training sets
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
##Merging the subject tables
subject<-rbind(subject_test,subject_train)
colnames(subject)<-"subject"
##Adding the activity and subject column to the data set
datacomp<-cbind(meanstddata,activity=flabel,subject)
##Appropriately labels the data set with descriptive variable names
names(datacomp)<-gsub("^t", "time", names(datacomp))
names(datacomp)<-gsub("^f", "frequency", names(datacomp))
names(datacomp)<-gsub("Acc", "Accelerometer", names(datacomp))
names(datacomp)<-gsub("Gyro", "Gyroscope", names(datacomp))
names(datacomp)<-gsub("BodyBody", "Body", names(datacomp))
##Creating tidy data set with the average of each variable for each activity and each subject.
tidy<-aggregate(. ~subject + activity, datacomp, mean)
tidy<-tidy[order(tidy$subject,tidy$activity),]
write.table(tidy, file = "tidydata.txt",row.name=FALSE)