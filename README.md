##Loading the data
The first part of the script loads the data from the web

##Merging the training and the test sets to create one data set

The next part of the script merges the observations of the test set and the training set respectively contained in the files X_test.txt and X_train.txt
##Extracts only the measurements on the mean and standard deviation for each measurement

The next part of the script reads in the features.txt file containing a table with the numbers of the measured variables and their corresponding labels. The column names in the data set are replaced by these labels, and then the subset of the data set containing only mean and standard deviation measurements is defined.
##Uses descriptive activity names to name the activities in the data set 

The files containing the activity number for each observation (y_test.txt and y_train.txt) are read and merged, a factor vector containing the activity numbers and labels is created. Then the files containing the subjects performing the activity (subject_test.txt and subject_train.txt) are read and merged into a one-column dataset.

##Appropriately labels the data set with descriptive variable names

The variable names are defined explicitly, by replacing the abbreviation in the column names by the word they stand for.

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A new tidy data set is created, containing the average of each variable for each subject (30 in total)  and each activity (6 in total), sorted out first by subject, then by activity, so a data set containing 180 rows is obtained and 60 columns is obtained. 