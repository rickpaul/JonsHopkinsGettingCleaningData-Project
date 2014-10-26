# rm(list=ls())

#Load training data
train_subjects_values<- read.table("./train/subject_train.txt")
train_X_values<- read.table("./train/X_train.txt")
train_Y_values<- read.table("./train/Y_train.txt")

#Consolidate training data
trainData <- cbind(train_X_values, train_subjects_values,train_Y_values)
rm("train_subjects_values")
rm("train_X_values")
rm("train_Y_values")
invisible(format(object.size(trainData),units="Mb"))

#Load test data
test_subjects_values<- read.table("./test/subject_test.txt")
test_X_values<- read.table("./test/X_test.txt")
test_Y_values<- read.table("./test/Y_test.txt")

#Consolidate test data
testData <- cbind(test_X_values, test_subjects_values,test_Y_values)
rm("test_subjects_values")
rm("test_X_values")
rm("test_Y_values")
invisible(format(object.size(testData),units="Mb"))

#Merged data sets
allData <- rbind(testData,trainData)
rm("testData")
rm("trainData")

#Read features data
features <- read.table("./features.txt",stringsAsFactors = F)
#Rename allData columns
names(allData) <- c(features$V2,"Subject","Activity") #"Y_Value is Activity"
#isolate means and standard deviations only
means <- features[grep("mean()",features$V2,fixed=T),2]
stdevs <- features[grep("std()",features$V2,fixed=T),2]
desiredCols <- c(means,stdevs,"Subject","Activity")
meansStdsOnly <- allData[,desiredCols]
rm("features")
rm("allData")

#Rename Activity Labels
activityLabels <- read.table("./activity_labels.txt",stringsAsFactors = F)
meansStdsOnly$Activity <- sapply(meansStdsOnly$Activity,as.factor)
library(plyr)
meansStdsOnly$Activity<-mapvalues(meansStdsOnly$Activity, from = activityLabels$V1, to = activityLabels$V2)
rm("activityLabels")

#Summarize the data (there's probably a better way to do this.)
meltedData <- melt(meansStdsOnly,id=c("Subject","Activity"))
meltedData$subjAct <- paste(meltedData$Subject,meltedData$Activity)
flattenedData <- acast(meltedData,subjAct ~ variable, mean)

flattenedData

rm("meltedData")
rm("meansStdsOnly")

#Write data
write.table(flattenedData,"./summaryData.txt",row.name=F)