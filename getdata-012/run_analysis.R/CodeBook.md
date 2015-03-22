## Variables:

Variables are heirarchically named; starting with `data`. 

**Varaibles to hold raw data**
+ data.train.x - training set
+ data.train.y - training labels
+ data.train.subject - training subjects
+ data.test.x - test set
+ data.test.y - test labels
+ data.test.subject - test subjects
+ data.activity_labels - index to for subjects and labels
+ data.features - list of features

## Process for the projects

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.