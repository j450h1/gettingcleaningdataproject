#1. Merges the training and the test sets to create one data set.

#Download and copy all files into the current working directory.

#Read in both data sets.
xtrain = read.table("train/X_train.txt"); ytrain = read.table("train/y_train.txt"); strain = read.table("train/subject_train.txt")
xtest = read.table("test/X_test.txt"); ytest = read.table("test/y_test.txt"); stest = read.table("test/subject_test.txt")
#cbind train
temp1 = cbind(strain,ytrain)
train = cbind(temp1,xtrain)
#cbind test
temp2 = cbind(stest,ytest)
test = cbind(temp2,xtest)
#rbind into one dataset (merge)
df = rbind(train,test)
activitylabels = read.table("activity_labels.txt")
#create a link between the 2 dfs
colnames(activitylabels)[1] <- "ACTNUM"
colnames(activitylabels)[2] <- "ACTIVITY"
colnames(df)[2] <- "ACTNUM"
total <- merge(df,activitylabels,by="ACTNUM")
#reorder columns and drop extra ACTNUM column
total <- total[,c(2,564,3:563)]
#Name first column and rename 3rd column as it had changed to V1.1
colnames(total)[1] <- "SUBJECT"
colnames(total)[3] <- "V1"
#Read in the features which should be the column headings
features = read.table("features.txt")
#Replace the V# with the correct variable names
colnames(total)[3:563] <- as.character(features[,2])
#NOW I HAVE THE COMPLETE DATESET!

#2.    Extracts only the measurements on the mean and standard deviation for each measurement. 

#Use RegEX to find only the mean and SDs and create a new DF of these characters.
#Start off with the colnames.
allnames <- colnames(total)
#Find the columns with std OR mean in the names and subset those.
g1 <- grepl("std",allnames)
g2 <- grepl("mean",allnames)
meansdnames <- total[,g1 | g2]
#Combine with the original 2 columns to get the tidy data set before melting
df2 <- cbind(total[,c(1,2)],meansdnames)
#Appropriately labels the data set with descriptive variable names. 

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Melt the data
library(reshape)
mdata <- melt(df2, id=c("SUBJECT","ACTIVITY"))
library(reshape2)
finaldf <- dcast(mdata, SUBJECT + ACTIVITY ~variable, mean)
#Create the output file.
write.table(finaldf, "tidydata.txt") 
