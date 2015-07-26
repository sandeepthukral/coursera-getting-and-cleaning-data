library(plyr)

# 1
# Merge data sets of training and test

# read in all temporary data tables
trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/Y_train.txt")
testX <- read.table("test/X_test.txt")
testY <- read.table("test/Y_test.txt")

subTrain <- read.table("train/subject_Train.txt")
subTest <- read.table("test/subject_Test.txt")

features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

measurementsX <- rbind(trainX, testX)
measurementsY <- rbind(trainY, testY)

subjects <- rbind(subTrain, subTest)

# 2
# Extract only the columns with mean and std deviation

# create a vector of column names with mean or std in their names
meanStdColumnNames <- grep("mean\\(\\)|std\\(\\)", features$V2)

# subset measurementsX for the desired columns
measurementsX <- measurementsX[ ,meanStdColumnNames ]

# assign the column names 
colnames(measurementsX) <- features[meanStdColumnNames, 2]

# 3
# Uses descriptive activity names to name the activities in the data set
# Provide descriptive activity names instead of numbers

# read values from activities and replace them in measurementsY
measurementsY$V1 <- activities[measurementsY$V1, 2]

# rename the column in measurementsY to ACTIVITY
colnames(measurementsY) <- c("ACTIVITY")
colnames(subjects) <- c("SUBJECT")

# 4 
# Appropriately labels the data set with descriptive variable names. 
measurements <- cbind(measurementsX, measurementsY, subjects)

# 5
# From the data set in step 4, creates a second, independent  tidy data set 
# with the average of each variable for each activity and each subject.
averagesPerSubjectAndActivity <- ddply(measurements, c("SUBJECT","ACTIVITY"), numcolwise(mean))
write.table(averagesPerSubjectAndActivity, file = "averagesPerSubjectAndActivity.txt", row.name=FALSE)
