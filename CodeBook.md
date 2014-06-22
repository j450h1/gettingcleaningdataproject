CodeBook

*This codebook describes the various transformations that I performed to the completed dataset which I arrived at (described in the readme.)

*I used grepl and regular expressions to subset only the columns which had the terms mean or std in them. Since the instructions did not specify, I chose to err on the side of caution and include all data which met this criteria.

*I then combined this data with the original 2 columns to get the tidy data set before melting.

*I used the melt and dcast functions from the reshape and reshape2 libraries respectively to make the data tall and narrow and only get the three measures I needed to look at SUBJECT, ACTIVITY, mean(finds the average of all the variables we were looking at).

*I decided that the chosen column names were sufficient to describe the data as there were was no obvious pattern to the naming. I would consider this tidy data as each column has a descriptive column name instead of V1, V2, etc. The instructions were very vague as well.
