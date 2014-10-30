JonsHopkinsGettingCleaningData-Project
======================================
##
Codebook:

    1. For both training and test data, Subject and Activity labels were re-affixed to the dataset
    2. The training and test data were recombined.
    3. Any data columns not pertaining to mean or standard deviation measurements, or the Subject and Activity labels, were removed. There were 66 such data points (not including the Subject and Activity).
    4. (The Activity labels were also given explicit labels, rather than numeric categories, for their 6 values, which were described in the summary above)
    5. The data was averaged, by Subject and Activity. (e.g. Subject 1, Walking, was summarized along its 66 mean and standard deviation points)
    6. The data was written out to a file named "summaryData.txt" in the same directory as the code.
    