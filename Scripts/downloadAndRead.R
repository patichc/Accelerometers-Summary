library(dplyr)
library(reshape2)

## Note: as naming convention on objects names in this script I will use the prefix ASGS to signify
##       objets related to the Accelerometers from the Samsung Galaxy S smartphone

## A.  Download and unzip
## A.1 Set download directory if the directory does not exists it is created
DownloadDirectory <- "Downloads"
if (!(file.exists(DownloadDirectory))) dir.create(DownloadDirectory)

## A.2 Set the working directory to the folder where the Project Downloads will be stored
entrywd<-getwd()
setwd(paste(entrywd,"/Downloads",sep=""))

## A.3 Downloads zip with data collected from the accelerometers from the Samsung Galaxy S smartphone
ASGS.url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
ASGS.zipFileName="ASGS.zip"
download.file(
        url = ASGS.url,
        destfile = ASGS.zipFileName,
        mode = "wb")
ASGS.downloadDate <- date

## A.4 Unzip the file on the working directory and sets working directory to where unzipped files reside
ASGS.fileName <- unzip(zipfile = ASGS.zipFileName)
setwd(paste(entrywd,"/Downloads/UCI HAR Dataset", sep=""))

## B.  Read labels and rename necessary labels
## B.1 Reads the activity numeric code to factor translation file 
ASGS.activity_labels = read.table(file = "activity_labels.txt",
                                  header = FALSE,
                                  sep = "",
                                  col.names=c("id","label"))

## B.2 Reads the labels for features 
ASGS.features = read.table(file = "features.txt",
                           header = FALSE,
                           sep = "",
                           col.names=c("position","label"))

## B.3 Cleaning labels
##   a.Removing () from lables
##   b.additional cleaning for feature labels: 303 thru 316 labels are repeated 3 times: 
##     first in 303 thru 316, second in 317 thru 330, and finally in 331 thru 344
##     Since the they are estimated for each signal, I am adding the -X -Y -Z to the label
##     because they should not be combine as they measure a different axial signal

ASGS.Cleanfeatures <- mutate(ASGS.features,
                             better.label =ifelse(((position>=303)&(position<=316)),gsub("\\(\\)-","-X",label),
                                                  ifelse(((position>=317)&(position<=330)),gsub("\\(\\)-","-Y",label),
                                                         ifelse(((position>=331)&(position<=344)),gsub("\\(\\)-","-Z",label),
                                                                gsub("\\(\\)","",label)))))

## C   Read and Merges test and train data
## C.1 Reads and binds columns for the test data on 
##     * subject_test.txt:  subject id, a number identifying for the individual who perform the activity
##     * y_test.txt: activity id, a numeric code of the activity performed (1 thru 6)
##     * X_test.txt: measurements summaries for the activity performed by the subject

setwd(paste(entrywd,"/Downloads/UCI HAR Dataset/test",sep=""))
ASGS.raw.test = cbind(read.table(file = "subject_test.txt",
                                 header = FALSE,
                                 sep = "",
                                 col.names="subject_id"),
                      read.table(file = "y_test.txt",
                                 header = FALSE,
                                 col.names="activity_id"),
                      read.table(file = "X_test.txt",
                                 header = FALSE,
                                 sep = "",
                                 col.name=ASGS.Cleanfeatures[,3]))

## C.2 Reads and binds columns for the training data on 
##     * subject_train.txt:  subject id, a number identifying for the individual who perform the activity
##     * y_train.txt: activity id, a numeric code of the activity performed (1 thru 6)
##     * X_train.txt: measurements summaries for the activity performed by the subject

setwd(paste(entrywd,"/Downloads/UCI HAR Dataset/train",sep=""))
ASGS.raw.train = cbind(read.table(file = "subject_train.txt",
                                  header = FALSE,
                                  sep = "",
                                  col.names="subject_id"),
                       read.table(file = "y_train.txt",
                                  header = FALSE,
                                  col.names="activity_id"),
                       read.table(file = "X_train.txt",
                                  header = FALSE,
                                  sep = "",
                                  col.name=ASGS.Cleanfeatures[,3]))

## C.3 Merges the test and train raw data set, without loosing to which group
##     each observation belongs (by adding the group column)

ASGS.raw.all=rbind(mutate(ASGS.raw.test,group="test"),mutate(ASGS.raw.train,group="train"))

## D.  Finally, produces the tiny data in four steps
## D.1 Decodes activities 
##     using the ASGS.raw.all data frame, decode activity Id into activity column (as a factor)
## D.2 Selects only mean or std measures
##     using the resulting data frame from previous step, creates a smaller data frame not 
##     summarized yet but only with mean or standard messures
## D.3 Melts all measures by subject and activity
##     using the resulting data frame from previous step, creates a thin data frame by using
##     melt with subject_id, activity and group as ids, and all the other columns as measures
## D.4 summarizes aggregating measures with mean
##     using the resulting data frame from previous step, creates a summary data frame by using
##     summarize calculating by subject_id, activity and group the mean of each measure
## all steps D.1 thru D.4 are done using data frame piping as follows

ASGS.tidySummary  <- 
        ASGS.raw.all %>%
        ##  D.1. Decodes activities
        mutate(activity = ASGS.activity_labels[,"label"][activity_id]) %>%
        ##  D.2. Select only mean or std measures
        select (c(subject_id,activity,group),
                ASGS.Cleanfeatures[grepl("-mean|-std",ASGS.Cleanfeatures$better.label),][[1]]+2) %>%
        ##  D.3. melt all measures by subject and activity
        melt(id.vars=1:3, measure.vars = 4:82) %>% 
        ##  D.4 summarize aggregating measures with mean
        dcast(subject_id + activity + group ~ variable,mean) 

## E.  Create file with results
## E.1 Sets results directory if the directory does not exists it is created
setwd(entrywd)
if (!(file.exists("Results"))) dir.create("Results")
setwd(paste(entrywd,"/Results",sep=""))
## E.2 Saves the result file
write.table(ASGS.tidySummary, file = "ASGS Tidy Summary.txt",row.name=FALSE)

## leaves the user in the original working directory
setwd(entrywd)
## END

