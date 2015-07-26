# Data Cleanup

The following steps were taken to prepare the data set according to project requirements:

## REad in all temporaty data
- trainX was used to read in the data X_train.txt
- trainY was used to read in the data Y_train.txt
- testX was used to read in the data X_test.txt
- testY was used to read in the data Y_test.txt
- subTrain was used to read in the data subject_Train.txt
- subTest was used to read in the data subject_Test.txt
- features was used to read in the data features.txt
- activities was used to read in the data activity_labels.txt

## Initial merging of data
- measurementsX was binding trainX and testX on rows
- measurementsY was binding trainY and testY on rows
- subjects was binding subTrain and subTest on rows

## Extract the desired columns 
- meanStdColumnNames stored the required columns from features using the grep()
  command
- measurementsX was then subset based on meanStdColumnNames
- the columns of measurementX were then set using the data table features

## Used decriptive activity names in the data set
- replaced column V1 of measurementsY with equivalent values in table
  activities
- Named columns for SUBJECT and ACTIVITY in measurementY and subjects,
  respectively. This will come in hand when merging the individual tables

## merge all small tables into one big one
- measurements now stores the tables measurementsX, measurementsY and subjects
  using cbind() funtions

## Created te final, tidy data set having means of variables grouped per activity and subject
- used ddply on table measurements which was on grouped for columsn SUBJECT and
  ACTIVITY, getting means of all columns
- used write.table as per instructions in the project submission instructions.
