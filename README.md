# Accelerometers: Summary
A summary example for data collected from the accelerometers from the Samsung Galaxy S smartphone

## Assignment Resolution - General Comments

<b>Author</b>: Patricia Chavez

This content including the generated code and plots is my answer to the <b>Getting and Cleaning Data Course Project</b> assignment for the course <b>Getting and Cleaning Data</b>
of the <b>Data Science Specialization</b> offered in <b>Coursera</b> by<b>Johns Hopkins University</b>

For details on the assignment please refer to the ![Assignment.md](Assignment.md) file in this repository

<hr>
### Deliverables of the assignment are all available in this repository as follows:

* ![README.md](README.md) 
* ![CodeBook.md](CodeBook.md) 
* ![R code, solution of the assignment](Scripts/downloadAndRead.R) 
* ![Test file with results](Results/ASGS%20Tidy%20Summary.txt)


<hr>
### Quick tips on reproducing the file (from download until summary file generation)

Before I start explaining my approach I want to give you some details that can become relevant if you want to reproduce the results:

* <b>Environment</b>:                                  
     * platform       x86_64-w64-mingw32          
     * language       R                           
     * version.string R version 3.2.0 (2015-04-16)

* <b>Reproducing Results</b>:
     * fork this repository and clone it in a local directory
	 * set your working directory in R as the clone repository directory
	 * source the R code located in the <b>Scripts</b> sub-directory of the clone repository directory
	 * after executing the R program, the result file, <b>ASGS Tidy Summary</b>, should be located under the <b>Results</b> sub-directory of the clone repository directory

* <b>Source</b>: As per the assignment:
     * zip file available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	 * Data collected from the accelerometers from the Samsung Galaxy S smartphone:  Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
	 * A full description of the files contained in the zip is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	 
<hr>
### The Approach

I performed the steps requested in the assignment, but decided to execute them in an order that I consider a more clear approach.  For that reason I am explaining my approach and cross-referencing the steps listed on the assignment as «Assignment Step X».

###### A. Download and unzip
In this step, a <b>Downloads</b> directory is created, the zip file pointed by the url; then the files where unzip.

###### B. Read labels and rename necessary labels
* The activity_labels.txt file is read into a data frame.  This file contains the translation from activity numeric code to factors
* The features.txt file is read into a data frame.  This files contains the label for each column (number of the column) on the files that contains the sets of metrics of each observation.
* <b>«Assignment Step 4»</b> The column labels provided where cleaned as they required cleaning as follows:
     * Remove the symbols <b>()</b>
	 * For feature labels: 303 thru 316 labels were repeated 3 times: first in 303 thru 316, second in 317 thru 330, and finally in 331 thru 344.  Since the they are estimated for each signal, I am adding the -X -Y -Z to the label because they should not be combine as they measure a different axial signal.
	 
	 *Note: the repetition on labels was an assumption on my side, based on the description of the features.  For actual publication of my analysis I would have confirm my findings with the authors, if possible
	 
###### C. Read and Merges test and train data
<b>«Assignment Step 1»</b>
* The subjects id, the activity id and the features files for the test set are read and stored them in one data frame. All files have the same number of rows, and a given row-number on the three files correspond to the same observation.  For this reason the data frames can be combined with a cbind command.  Please note that when reading the features, I am using the already cleaned labels to label the columns.
* The subjects id, the activity id and the features files for the training set are read and stored them in one data frame. (all explained in previous item applies to this item)
* The data frames for test and training have the same columns; so, finally they are combined in one data frame without loosing to which group each observation belongs (this is accomplished by adding a column, labelled as group,  with value either test or train)  


###### D.  Produce a summarize and tiny data frame with the average of each mean or standard measurements for each activity and each subject.
* <b>«Assignment Step 3»</b> The data frame with train and test data is enhanced by adding a column that has the activity name «Assignment Step 3» (based on the activity id of the observation and the translation file read in step B)
* <b>«Assignment Step 2»</b> From the resulting data frame, a new data frame is built only the columns of interest are selected (subject_id, activity, group and all mean or std measures) 
* From the resulting data frame, a new data frame is built by creating a thin data frame using melt with subject_id, activity and group as ids, and all the other columns as measures
* <b>«Assignment Step 5»</b> From the resulting data frame, the final data frame is created by summarizing the thin data frame, averaging measures (calculating the mean) by subject_id, activity and group the mean of each meassure

###### E. Create file with results
In this step, a <b>Results</b> directory is created and the resulting data frame is written in a file called <b>ASGS Tidy Summary.txt</b>

<hr>
Thank you for taking the time to review this assignment!