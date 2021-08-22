# CodeBook for data generated and data transformation from run\_analysis.R

## Variable in “data” data frame

#### subject

subject id (range from 1 - 30)

#### activity

activity recorded (6, laying, sitting, standing, walking,
walking\_upstair, walking\_downstair)

#### tBodyAccmean - XYZ

MEAN of Body acceleration mean on x, y or z axis

#### tBodyAccstd - XYZ

MEAN of Body acceleration standard deviation on x, y or z axis

#### tGravityAccmean - XYZ

MEAN of gravity acceleration mean on x, y or z axis

#### tGravityAccstd - XYZ

MEAN of gravity acceleration standard deviation on x, y or z axis

#### tBodyAccJerkmean - XYZ

MEAN of Body acceleration jerk signal mean on x, y or z axis

#### tBodyAccJerkstd - XYZ

MEAN of Body acceleration jerk signal standard deviation on x, y or z
axis

#### tBodyGyromean - XYZ

MEAN of Body gyro signal mean on x, y or z axis

#### tBodyGyrostd - XYZ

MEAN of Body gyro signal standard deviation on x, y or z axis

#### tBodyGyroJerkmean - XYZ

MEAN of Body acceleration gyro jerk signal mean on x, y or z axis

#### tBodyGyroJerkstd - XYZ

MEAN of Body acceleration gyro jerk signal standard deviation on x, y or
z axis

## Data transformation

-   Load all data into R
-   Combined data from test and train set, label and subject
-   Rename column on subject and label data frame
-   select only variable with mean and standard deviation from 561
    variables
-   rename selected 66 variables into descriptive variable names
-   combined all 3 data frames (set, label and subject)
-   group by subject and activity then apply mean function across all
    column
-   store final data into data2 object
-   create text file format named “finaldata.txt”
