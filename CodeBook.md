Variables
-------------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeBodyGyroscope-XYZ. These time domain signals (prefix time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAcceleroemterJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAcceleroemterJerkMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timeBodyAccelerometer-XYZ
timeGravityAccelerometer-XYZ
timeBodyAccelerometerJerk-XYZ
timeBodyGyroscope-XYZ
timeBodyGyroscopeJerk-XYZ
timeBodyAccelerometerMagnitude
timeGravitimeyAccelerometerMagnitude
timeBodyAccelerometerJerkMagnitude
timeBodyGyroscopeMagnitude
timeBodyGyroscopeJerkMagnitude
frequencyBodyAccelerometer-XYZ
frequencyBodyAccelerometerJerk-XYZ
frequencyBodyGyroscope-XYZ
frequencyBodyAccelerometerMagnitude
frequencyBodyAccelerometerJerkMagnitude
frequencyBodyGyroscopeMagnitude
frequencyBodyGyroscopeJerkMagnitude

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

Treatment of the data
-----------------------------
These variables constitute the "data" data frame defined in the script. From this data frame, only columns corresponding to mean and std measurements are selected, to form the "meanstddata" data frame. 

These variables have been measured on 30 subject pursuing the following activities: "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING", defined as 1-2-3-4-5-6 levels in the factor vector obtained from reading and merging the files "y_test.txt" and "y_train.txt". Information on which subject performs the activity can be found in the "subject_test.txt" and "subject_train.txt" files that have been read and merged. 

A data set data comp is created, from merging the meanstddata data frame, the activity and the subject data frame. Out of this data frame, another tidy data frame is created, containing the average of each variable for each subject and for each activity, meaning that it contains 180 rows, ordered by subject, and for each subject there are 6 rows for each activity.