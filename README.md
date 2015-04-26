# tidy
Tidy Data R script
Rogelio Guzman <roygual@hotmail.com>

R script for generating a dataset with the principles of tidy data with data obtained from Samsung wearable computing data files


One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.



Package Requirements
--------------------

You need:

						*doBy
						
						*reshape
						
						*internet connection


Installing Requirements
-----------------------
execute on an R console:

						*install.packages("doBy")
						
						*install.packages("reshape")
						



Running the script
------------------
executing on console:

						*Rscript run_analysis.R






Returning file
--------------
The processed and returned file is called "tidyData.txt" and is gonna be located in the working directory; if you run the script from the console the working directory will be the same folder where is located the file "run_analysis.R" and and there you can find the returned file; if the script was executed from an IDE , then the returned file will be located in the working directory of the IDE.

Apart from dependencies on packages the script is made to be as independent as possible; This script download, reads and processes the data files.



Files path
----------

Returned file tidyData.txt			working directory/UCI/

Zipped file Dataset.Zip   			working directory/UCI/

Working data text files  			  working directory/UCI/UCI HAR Dataset/


Notes
-----
This script was tested and working on:

	* Ubuntu 15.04 x64 Linux OS.
	* Revolution R Open 3.1.1 for x64
	* gcc version 4.9.2
