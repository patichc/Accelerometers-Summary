
File name: <b>ASGS Tidy Summary.txt</b>

This files contains the average of a set of mean and standard measures taken for individuals while performing a type of activity while wearing a Samsung Galaxy S smartphone.  A detail of the experiment can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* subject_id:  An identifier of the subject who carried out the experiment.
* activity:  Type of activity perfromed: 
     * WALKING
     * WALKING_UPSTAIRS
     * WALKING_DOWNSTAIRS
     * SITTING
     * STANDING
     * LAYING"
* group:  Group to which the subject observations were assign to: test or training

For the following measures, the mean of that measure among all observations for the same subject and activity was calculated.  Please not that the labels correspond to the measure that was averaged
A description of these measures is available at the bottom <b>Features Description</b> section of this document; such description was taken from the features.txt file available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  These set of files correspond to data collected from the accelerometers from the Samsung Galaxy S smartphone:  Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  A full description of the files contained in the zip is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* tBodyAcc.mean.X	
* tBodyAcc.mean.Y	
* tBodyAcc.mean.Z	
* tBodyAcc.std.X	
* tBodyAcc.std.Y	
* tBodyAcc.std.Z	
* tGravityAcc.mean.X	
* tGravityAcc.mean.Y	
* tGravityAcc.mean.Z	
* tGravityAcc.std.X	
* tGravityAcc.std.Y	
* tGravityAcc.std.Z	
* tBodyAccJerk.mean.X	
* tBodyAccJerk.mean.Y	
* tBodyAccJerk.mean.Z	
* tBodyAccJerk.std.X	
* tBodyAccJerk.std.Y	
* tBodyAccJerk.std.Z	
* tBodyGyro.mean.X	
* tBodyGyro.mean.Y	
* tBodyGyro.mean.Z	
* tBodyGyro.std.X	
* tBodyGyro.std.Y	
* tBodyGyro.std.Z	
* tBodyGyroJerk.mean.X	
* tBodyGyroJerk.mean.Y	
* tBodyGyroJerk.mean.Z	
* tBodyGyroJerk.std.X	
* tBodyGyroJerk.std.Y	
* tBodyGyroJerk.std.Z	
* tBodyAccMag.mean	
* tBodyAccMag.std	
* tGravityAccMag.mean	
* tGravityAccMag.std	
* tBodyAccJerkMag.mean	
* tBodyAccJerkMag.std	
* tBodyGyroMag.mean	
* tBodyGyroMag.std	
* tBodyGyroJerkMag.mean	
* tBodyGyroJerkMag.std	
* fBodyAcc.mean.X	
* fBodyAcc.mean.Y	
* fBodyAcc.mean.Z	
* fBodyAcc.std.X	
* fBodyAcc.std.Y	
* fBodyAcc.std.Z	
* fBodyAcc.meanFreq.X	
* fBodyAcc.meanFreq.Y	
* fBodyAcc.meanFreq.Z	
* fBodyAccJerk.mean.X	
* fBodyAccJerk.mean.Y	
* fBodyAccJerk.mean.Z	
* fBodyAccJerk.std.X	
* fBodyAccJerk.std.Y	
* fBodyAccJerk.std.Z	
* fBodyAccJerk.meanFreq.X	
* fBodyAccJerk.meanFreq.Y	
* fBodyAccJerk.meanFreq.Z	
* fBodyGyro.mean.X	
* fBodyGyro.mean.Y	
* fBodyGyro.mean.Z	
* fBodyGyro.std.X	
* fBodyGyro.std.Y	
* fBodyGyro.std.Z	
* fBodyGyro.meanFreq.X	
* fBodyGyro.meanFreq.Y	
* fBodyGyro.meanFreq.Z	
* fBodyAccMag.mean	
* fBodyAccMag.std	
* fBodyAccMag.meanFreq	
* fBodyBodyAccJerkMag.mean	
* fBodyBodyAccJerkMag.std	
* fBodyBodyAccJerkMag.meanFreq	
* fBodyBodyGyroMag.mean	
* fBodyBodyGyroMag.std	
* fBodyBodyGyroMag.meanFreq	
* fBodyBodyGyroJerkMag.mean	
* fBodyBodyGyroJerkMag.std	
* fBodyBodyGyroJerkMag.meanFreq	
	
<hr>
## Features Description	
#### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

*Note:  there were more estimated variables in the original files (like correlations, etc) but they were not considered for the summary presented in this file

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
