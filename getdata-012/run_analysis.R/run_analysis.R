# read data sets
data.train.x                <- read.table("data/train/X_train.txt")
data.train.y                <- read.table("data/train/y_train.txt")
data.train.subject          <- read.table("data/train/subject_train.txt")

data.test.x                 <- read.table("data/test/X_test.txt")
data.test.y                 <- read.table("data/test/y_test.txt")
data.test.subject           <- read.table("data/test/subject_test.txt")

data.activity_labels        <- read.table("data/activity_labels.txt")
data.features               <- read.table("data/features.txt")

# Merge training and test sets (#1)
data.x                      <- rbind(data.train.x, data.test.x)
data.y                      <- rbind(data.train.y, data.test.y)
data.subject                <- rbind(data.train.subject, data.test.subject)

# Merge features and data (#3)
colnames(data.x)            <- c(as.character(data.features[, 2]))

# extact mean and SD (#2)
data.mean                   <- grep("mean()", colnames(data.x), fixed = TRUE)
data.sd                     <- grep("std()", colnames(data.x), fixed = TRUE)
data.mean_sd                <- data.x[, c(data.mean, data.sd)]

# merge activities and mean/sd
data.activity               <- cbind(data.y, data.mean_sd)
colnames(data.activity)[1]  <- "Activity"

# convert labels to appropriate data type
data.activity_labels[, 2]    <- as.character(data.activity_labels[, 2])

# apply labels to actvities (#4)
for(i in 1:length(data.activity[,1])){
    data.activity[i, 1]      <- data.activity_labels[data.activity[i, 1], 2]
}

# final mergers and labeling
data.all                    <- cbind(data.subject, data.activity)
colnames(data.all)[1]       <- "Subject"

# create new tidy dataset for output
data.tidy                   <- aggregate( data.all[, 3] ~ Subject + Activity, 
                                          data = data.all, FUN = "mean" )

for(i in 4:ncol(data.all)){
    data.tidy[, i]           <- aggregate( data.all[, i] ~ Subject + Activity, 
                                          data = data.all, FUN = "mean" )[,3]
}

#label output data
colnames(data.tidy)[3:ncol(data.tidy)] <- colnames(data.mean_sd)

# write tidy dataset (#5)
write.table(data.tidy, file = "tidy.data.txt", row.name = FALSE)
