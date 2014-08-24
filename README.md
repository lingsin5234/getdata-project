getdata-project

Steps to run my code and get a tidy data set:
1. Download run_analysis.R file
2. Place this file in the same directory as the UCI HAR Dataset folder (this folder should be the extracted data sets)
3. Use the above directory as the working directory in R studio and run my code with the run_analsis.R file
4. The XYavg data frame will be written to a text file: XYavg.txt

How my code works:
There is only one script for my code.
1. Extracted all the data sets and activity labels
2. Converted the labels from numbers to their respective activity names (i.e. 1 for Walking)
3. Went through the list of features and extracted the column numbers that dealt with mean and standard deviation
4. Generated two data frames, one for train, one for test, from the extracted data sets with only mean and standard deviation measurements
5. Combined the activities with the measurements for each train and test
6. Took the average for each activity of both train and test data frames
7. Merged the train and test data frames
8. Added a column to distinguish the two data frames' averages from each other, train and test.
9. Labelled all the columns appropriately
===============
