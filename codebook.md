STUDY DESIGN

The collection of information is done based on specific instructions, the dataset.zip https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip site file was downloaded.

In its content is the "test", "train" and some file folders in which its use is explained below:

activity_labels.txt
describes the activities that correspond to each number.

Features.txt
Contains the names of the variables sorted in order of each table in a row

Subject_test.txt
Contains the people represented by a number from 1 to 30 each in order according to the table row.

y_test.txt
contains the activities represented by a number that is collated with activity_labels.txt.

X_test.txt
Dataset with entrnamientos

Subject_train.txt
Contains the people represented by a number from 1 to 30 each in order according to the table row.

y_train.txt
contains the activities represented by a number that is collated with activity_labels.txt.

X_train.txt
Dataset with entrnamientos


Codebook
The final dataset, and processing has the name "t1" and is described, the other datasets were generated for manipulation and final generation of "t"

features.- training is conducted loaded from features.txt
y_test.- represents those in the experiment represented by 1:30 dedse subject_test.txt
test_subject represents the exercises represented by 1: 6 from subject_test.txt
test.dataset represents the entire training dataset from X_test.txt

y_train represents those in the experiment represented by 1:30 dedse subject_train.txt
train_subject represents the exercises represented by 1: 6 from subject_train.txt
train.dataset represents the entire training dataset from X_train.txt

merged.df the merged dataset of the six datasets of subjects, training and exercicse from test and training respectively

t resulting dataset accommodate each variable in training as row to match it nothing individual, training and exercises.
-
t1 end dataset compacted to display an average for exercise, person and train
-

Variables:
subject.- categorical, it is 1 of the 30 people used in the research, each represented by a number from 1 to 30.

activity.- categorical type, in her are one of six different types of exercise per row, I make the subject of the row above.


variable.- categorical type shows training conducted in reads:
-acc- 	accelerometer
-jerk-	 jerk
-gyro- 	giroscpio
-m- 	mean
-s- 	standard deviation
-f- 	frequency
-x-y-z



Mean.- count rate shows the mean of the person avtividad by entailment.
Traductor de Google para empresas:Translator Toolkit