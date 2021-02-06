Code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 
The origin of the dataset, the explanation of the experiment and the credits for the rersearch may be found in the path "UCI HAR Dataset/README.txt" which may be accessed after unzipping the file (procedure already included in the "run_analysis.R" script.

1) The original 561 variables in this work are detailed in the "features.txt" file, which come within the original downloaded dataset.  A detailed explanation of the original data can be found at "features_info.txt" file as follows:

Feature Selection 
=================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

2) After downloading the original dataset, the following transformations were implemented:

2.a) The contents of files "Y_test/train.txt"" (vector containing the features data for each observation) and "subject_test/train.txt" (vector containing the subjects involved in each observation) were merged as new columns to the "X_test/train.txt" file (main file), both for the "train"" and "test" sets. 

2.b) The training and the test sets were merged by binding rows to create one data set under the folder "Merged".
The main merged dataset was named "mainset.txt".  The nine files containing inertial signals were preserved, but the test and train sets were merged by binding rows. 

2.c) Following, only the measurements on the mean and standard deviation were extracted for each measurement, reducing the number of measurement variables from 561 to 86. 

2.d) Next, the name the activities in the dataset were inserted using descriptive activity names.

2.e) Following the dataset was labeled with descriptive variable names. 

The resulting dataset was named "transformedmainset.txt"

2.f) Finally, the "finalset.txt" results from grouping each of the 6 activities for each of the 30 subjects by calculating the average for each of the 180 (6 X 30) combinations.
