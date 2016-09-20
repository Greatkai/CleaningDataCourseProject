# CodeBook

 subject 

​	identifier of the subject who carried out the experiment

​		1..30



activity
​	contains 6 kinds of activities

​		"WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","WALKING","STANDING","SITTING","LAYING"



 Measurements

​	The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tacc[xyz] and tgyo[xyz]. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyacc[xyz] and tgravityacc[xyz]) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

​	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tbodyaccjerk[xyz] and tbodygyrojer[xyz]). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

​	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyacc[xyz], fbodyaccjerk[xyz], fbodygyro[xyz], fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag. 

​	The set of variables that were estimated from mean value (mean), standard deviation (std) and mea



The complete list of variables of each feature vector:

"tbodyaccmeanx"                "tbodyaccmeany"                "tbodyaccmeanz"               
"tbodyaccstdx"                 "tbodyaccstdy"                 "tbodyaccstdz"                
"tgravityaccmeanx"             "tgravityaccmeany"             "tgravityaccmeanz"            
"tgravityaccstdx"              "tgravityaccstdy"              "tgravityaccstdz"             
"tbodyaccjerkmeanx"            "tbodyaccjerkmeany"            "tbodyaccjerkmeanz"           
"tbodyaccjerkstdx"             "tbodyaccjerkstdy"             "tbodyaccjerkstdz"            
"tbodygyromeanx"               "tbodygyromeany"               "tbodygyromeanz"              
"tbodygyrostdx"                "tbodygyrostdy"                "tbodygyrostdz"               
"tbodygyrojerkmeanx"           "tbodygyrojerkmeany"           "tbodygyrojerkmeanz"          
"tbodygyrojerkstdx"            "tbodygyrojerkstdy"            "tbodygyrojerkstdz"           
"tbodyaccmagmean"              "tbodyaccmagstd"               "tgravityaccmagmean"          
"tgravityaccmagstd"            "tbodyaccjerkmagmean"          "tbodyaccjerkmagstd"          
"tbodygyromagmean"             "tbodygyromagstd"              "tbodygyrojerkmagmean"        
"tbodygyrojerkmagstd"          "fbodyaccmeanx"                "fbodyaccmeany"               
"fbodyaccmeanz"                "fbodyaccstdx"                 "fbodyaccstdy"                
"fbodyaccstdz"                 "fbodyaccmeanfreqx"            "fbodyaccmeanfreqy"           
"fbodyaccmeanfreqz"            "fbodyaccjerkmeanx"            "fbodyaccjerkmeany"           
"fbodyaccjerkmeanz"            "fbodyaccjerkstdx"             "fbodyaccjerkstdy"            
"fbodyaccjerkstdz"             "fbodyaccjerkmeanfreqx"        "fbodyaccjerkmeanfreqy"       
"fbodyaccjerkmeanfreqz"        "fbodygyromeanx"               "fbodygyromeany"              
"fbodygyromeanz"               "fbodygyrostdx"                "fbodygyrostdy"               
"fbodygyrostdz"                "fbodygyromeanfreqx"           "fbodygyromeanfreqy"          
"fbodygyromeanfreqz"           "fbodyaccmagmean"              "fbodyaccmagstd"              
"fbodyaccmagmeanfreq"          "fbodybodyaccjerkmagmean"      "fbodybodyaccjerkmagstd"      
"fbodybodyaccjerkmagmeanfreq"  "fbodybodygyromagmean"         "fbodybodygyromagstd"         
"fbodybodygyromagmeanfreq"     "fbodybodygyrojerkmagmean"     "fbodybodygyrojerkmagstd"     
"fbodybodygyrojerkmagmeanfreq"