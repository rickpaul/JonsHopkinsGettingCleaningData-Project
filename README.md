JonsHopkinsGettingCleaningData-Project
======================================
##Summary:
There is data available from the Smartlab at the University of Genoa that tracks human subjects in various states of movement (walking, standing, etc.), using sensors in a Samsung Galaxy phone that is kept on their person. From their description:
[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
~~"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually."~~

Raw data is a 561 column data set, sampled at 50hz, with movement data, 1 labeled set of subject data, and 1 labeled set of activity data (the latter two correspond to the first 561 data points appropriately)

The project is to summarize the mean and standard deviation datapoints (of which there were 66), by subject and movement, and to put that in a table.

Codebook:
1. For both training and test data, Subject and Activity labels were re-affixed to the dataset
2. The training and test data were recombined.
3. Any data columns not pertaining to mean or standard deviation measurements, or the Subject and Activity labels, were removed. There were 66 such data points (not including the Subject and Activity).
4. (The Activity labels were also given explicit labels, rather than numeric categories, for their 6 values, which were described in the summary above)
5. The data was averaged, by Subject and Activity. (e.g. Subject 1, Walking, was summarized along its 66 mean and standard deviation points)
6. The data was written out.