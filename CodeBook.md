
CodeBook for smart phone data analysis
------------------------------------------------------------------------

Back Ground
-----------
	Human Activity Recognition Using Smartphones dataset by   UCI Machine Learning Repository.  Experiments were conducted on 30 subjects performing various activities while wearing smartphone (Samsung Galaxy S II) on the waist . 
	The embedded accelrometer and gyroscope reading were captured and supplied as a dataset for a "Getting and Cleaning Data Project". The raw data from accelerometer and gyroscope were sampled and transformed into 561 featrue vector in each sample.
	
	More information about the experiment, dataset, other minute details are available at :
	<b>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</b> 

Data source
-----------
   For this particular project the raw / pre-processed data is made available at 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   . 
   This zip file contains  experiment and pre-processing details. README.txt file is included to make sense of the dataset.
   


Tidy Data Features  
-----------------
	After a careful initial study of the dataset and given the requirement of the project work the following 73 
	(<b>72 features</b> and <b>subject id</b>)columns were selected  for final tidy dataset. These features have either "mean" or "std" in the feature name.<br>
	
	The data file "<b>column_subset_and_map_for_step2.txt</b>"  needs to be present in the same folder as "<b>run_analysis.R</b>" .
	"column_subset_and_map_for_step2.txt" is prepared by the student based on the preliminary output of "features.txt"  .
	"column_subset_and_map_for_step2.txt"  is very important for "subsetting" columns and "renaming" columns wtih descriptive names.<br><br><br><br>
	
	
	
ColumnIndex     ColumnName   ColumnNameDesc<br>
1     V1                    tBodyAcc_mean_X<br>
2     V2                    tBodyAcc_mean_Y<br>
3     V3                    tBodyAcc_mean_Z<br>
4     V4                     tBodyAcc_std_X<br>
5     V5                     tBodyAcc_std_Y<br>
6     V6                     tBodyAcc_std_Z<br>
41   V41                 tGravityAcc_mean_X<br>
42   V42                 tGravityAcc_mean_Y<br>
43   V43                 tGravityAcc_mean_Z<br>
44   V44                  tGravityAcc_std_X<br>
45   V45                  tGravityAcc_std_Y<br>
46   V46                  tGravityAcc_std_Z<br>
81   V81                tBodyAccJerk_mean_X<br>
82   V82                tBodyAccJerk_mean_Y<br>
83   V83                tBodyAccJerk_mean_Z<br>
84   V84                 tBodyAccJerk_std_X<br>
85   V85                 tBodyAccJerk_std_Y<br>
86   V86                 tBodyAccJerk_std_Z<br>
121 V121                   tBodyGyro_mean_X<br>
122 V122                   tBodyGyro_mean_Y<br>
123 V123                   tBodyGyro_mean_Z<br>
124 V124                    tBodyGyro_std_X<br>
125 V125                    tBodyGyro_std_Y<br>
126 V126                    tBodyGyro_std_Z<br>
161 V161               tBodyGyroJerk_mean_X<br>
162 V162               tBodyGyroJerk_mean_Y<br>
163 V163               tBodyGyroJerk_mean_Z<br>
164 V164                tBodyGyroJerk_std_X<br>
165 V165                tBodyGyroJerk_std_Y<br>
166 V166                tBodyGyroJerk_std_Z<br>
201 V201                   tBodyAccMag_mean<br>
202 V202                    tBodyAccMag_std<br>
214 V214                tGravityAccMag_mean<br>
215 V215                 tGravityAccMag_std<br>
227 V227               tBodyAccJerkMag_mean<br>
228 V228                tBodyAccJerkMag_std<br>
240 V240                  tBodyGyroMag_mean<br>
241 V241                   tBodyGyroMag_std<br>
253 V253              tBodyGyroJerkMag_mean<br>
254 V254               tBodyGyroJerkMag_std<br>
266 V266                    fBodyAcc_mean_X<br>
267 V267                    fBodyAcc_mean_Y<br>
268 V268                    fBodyAcc_mean_Z<br>
269 V269                     fBodyAcc_std_X<br>
270 V270                     fBodyAcc_std_Y<br>
271 V271                     fBodyAcc_std_Z<br>
345 V345                fBodyAccJerk_mean_X<br>
346 V346                fBodyAccJerk_mean_Y<br>
347 V347                fBodyAccJerk_mean_Z<br>
348 V348                 fBodyAccJerk_std_X<br>
349 V349                 fBodyAccJerk_std_Y<br>
350 V350                 fBodyAccJerk_std_Z<br>
424 V424                   fBodyGyro_mean_X<br>
425 V425                   fBodyGyro_mean_Y<br>
426 V426                   fBodyGyro_mean_Z<br>
427 V427                    fBodyGyro_std_Xv<br>
428 V428                    fBodyGyro_std_Y<br>
429 V429                    fBodyGyro_std_Z<br>
503 V503                   fBodyAccMag_mean<br>
504 V504                    fBodyAccMag_std<br>
516 V516           fBodyBodyAccJerkMag_mean<br>
517 V517            fBodyBodyAccJerkMag_std<br>
529 V529              fBodyBodyGyroMag_mean<br>
530 V530               fBodyBodyGyroMag_std<br>
542 V542          fBodyBodyGyroJerkMag_mean<br>
543 V543           fBodyBodyGyroJerkMag_std<br>
556 V556 angle_tBodyAccJerkMean__gravityMean<br>
557 V557     angle_tBodyGyroMean_gravityMean<br>
558 V558 angle_tBodyGyroJerkMean_gravityMean<br>
559 V559                 angle_X_gravityMean<br>
560 V560                 angle_Y_gravityMean<br>
561 V561                 angle_Z_gravityMean<br>
562 V562			  Subject_Id<br>	

      All other features (561 - 72) were removed from  the tidy datasets as they do not seem to be relevant for this project.
	  
Getting Data 
--------------
		 Data is downloaded to the working directory if the zip file is absent.   
		 The zip file is unzipped  if the file "UCI HAR Dataset/train/X_train.txt" is missing.
		 i.e. download/unzip will be done once only.
		 
		 
Cleaning Data
--------------
      The following process is followed to arrive at the final tiday dataset .
	  * Load the train/x_train.txt  features data file.
	  * Load the train/subject_train.txt with  30 participants ( or train/y_train.txt with 6 participants )
	  * Load the test/x_test.txt  features data file.
	  * Load the test/subject_test.txt with  30 participants ( or train/y_train.txt with 6 participants )
	  * cbind subject_id's to  train and test data frames.
	  * merge train & test dataset with rbind (xx_test_and_train.tab <- rbind(xx_train.tab, xx_test.tab) 
	  * xx_test_and_train.tab has all the features of tidy dataset.
	  * read the prepared data file to aid/help in subsetting / renaming columns 
	     col_subset_map <- read.table("column_subset_and_map_for_step2.txt", header=TRUE, colClasses=c("integer", "character", "character"))
	  * subset selected columns (xx_test_and_train_subset.tab <- xx_test_and_train.tab[,col_names_subset])
	  * rename selected columns ( colnames(xx_test_and_train_subset.tab) <- col_names_desc)
	  * group by subject_id so we can run summarise for each subject_id
	    ( xxx_test_and_train_subset.tab <- group_by(xx_test_and_train_subset.tab, Subject_Id))
	   * summarise the results as per project requirement . 
	      i.e. group rows by subject_id and then apply mean functin to each column.
	     (xxxx_test_and_train_subset.tab <- xxx_test_and_train_subset.tab %>% summarise_each(funs(mean)))
		 
Tidy Dataset
-------------
		<b>xxxx_test_and_train_subset.tab</b>  data frame has one row per <b>subject/volunteer</b> . Each row has <b>subject_id + 72 features</b> . 
		The value in each feature column  represents the <b>mean value calculated for this subject/volunteer</b> alone.
		Our generated dataset will have 30 rows if we use subject_test.txt  or subject_train.txt files. 
		It will have only 6 rows if we use y_train.txt or y_test.txt files.   
		
	  

	  
	  
