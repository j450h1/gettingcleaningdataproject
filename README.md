gettingcleaningdataproject
==========================

Getting and Cleaning Data Project
*This file explains how all of the scripts work and how they are connected.* 

1. First I downloaded and unzipped files to the current working directory without using R.

2. I read in all 6 text files using read.table. I only selected the X,Y, and subject of each folder train and test.
Ignoring the Inertial Signals folder.

3. I first combined the columns of each set seperately using the cbind function.

4. I then combined the rows of the two sets using the rbind function to come to a "merged" dataset.

5. My next task was to read in the activity_labels.txt file using read.table.
Since the names were sufficient, I didn't feel the need to using a seperate naming system.

6. I created a link between my "merged" dataset and the activitylabels dataframe by renaming the common columns which was ACTNUM (the activity number which corresponded with the type of activity like WALKING,etc).

7. I know imported the features.txt file as read.table to replace the remaining incomperehensible column headings.

