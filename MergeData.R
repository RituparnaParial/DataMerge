# Load data from previous session
column_names <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

# Enter data into vectors before constructing the data frame
date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99) # 99 is one of the values in the age attribute - will require recoding
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

# Construct a data frame using the data from all vectors above
managers <- data.frame(date_col, country_col, gender_col, age_col, q1_col, q2_col, q3_col, q4_col, q5_col)

# Add column names to data frame using column_names vector
colnames(managers) <- column_names

# Recode the incorrect 'age' data to NA
managers$Age[managers$Age == 99] <- NA

# Create a new attribute called AgeCat and set valuess
# in AgeCat to the following if true:
# <= 25 = Young
# >= 26 & <= 44 = Middle Aged
# >= 45 = Elderly
# We will also recode age 'NA' to Elder

managers$AgeCat[managers$Age >= 45] <- "Elder"
managers$AgeCat[managers$Age >= 26 & managers$Age <= 44] <- "Middle Aged"
managers$AgeCat[managers$Age <= 25] <- "Young"
managers$AgeCat[is.na(managers$Age)] <- "Elder"

# Recode AgeCat so that is ordinal and factored with the
# order Young, Middle aged, Elder
# We'll srore the ordinal factored data in variable 'AgeCat'
AgeCat <- factor(managers$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

# Replace managers's AgeCat attribute with newly ordinal foctored data
managers$AgeCat <- AgeCat

# Create a new column called 'summary_col' that
# contains a summary of each row
summary_col <- managers$Q1 + managers$Q2 + managers$Q3 + managers$Q4 + managers$Q5
summary_col

# Add summary_col to the end of the data frame
managers <- data.frame(managers, summary_col)


# Calculate mean value for each row
mean_value <- rowMeans(managers[5:9])

# Add mean_value to end of managers data frame
managers <- data.frame(managers, mean_value)

# Show data frame contents
managers

# Change the name of this column to "mean value"
names(managers)[12] <- "mean value"

# Change name of summary_col to "Answer total"
names(managers)[11] <- "Answer total"


# Loading data into dataframe
new_managers_data <- read.csv("MoreData.csv")
new_managers_data

include_list <- subset(new_managers_data, select = c(6,3,7,4,8:12))
str(include_list)

# Seeing structure of dataframe
str(new_managers_data)
# Show 
str(managers)

#library(dplyr)
#new_managers_data <- select(new_managers_data, Country, Age, Date, Gender, Q1, Q2, 
                            Q3, Q4, Q5  )
#include_list <- new_managers_data[c("Date", "Country"....)]
#include_list <- new_managers_data(c(6,3,7,4,8:12))
#include_list <- subset(new_managers_data, select = c(6,3,7,4,8:12))

#str(new_managers_data)  
str(managers)  
# Recode the incorrect 'age' data to NA
#new_managers_data$Age[new_managers_data$Age == 99] <- NA

# Create a new attribute called AgeCat and set valuess
# in AgeCat to the following if true:
# <= 25 = Young
# >= 26 & <= 44 = Middle Aged
# >= 45 = Elderly
# We will also recode age 'NA' to Elder

#new_managers_data$AgeCat[new_managers_data$Age >= 45] <- "Elder"
#new_managers_data$AgeCat[new_managers_data$Age >= 26 & new_managers_data$Age <= 44] <- "Middle Aged"
#new_managers_data$AgeCat[new_managers_data$Age <= 25] <- "Young"
#new_managers_data$AgeCat[is.na(new_managers_data$Age)] <- "Elder"

# Recode AgeCat so that is ordinal and factored with the
# order Young, Middle aged, Elder
# We'll srore the ordinal factored data in variable 'AgeCat'
#AgeCat <- factor(new_managers_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

# Replace managers's AgeCat attribute with newly ordinal foctored data
#new_managers_data$AgeCat <- AgeCat  
# Calculate mean value for each row
#mean_value <- rowMeans(new_managers_data[5:9])

# Add mean_value to end of managers data frame
#new_managers_data <- data.frame(new_managers_data, mean_value)
# contains a summary of each row
#summary_col <- new_managers_data$Q1 + new_managers_data$Q2 + 
#              new_managers_data$Q3 + new_managers_data$Q4 + new_managers_data$Q5
#summary_col

# Add summary_col to the end of the data frame
#new_managers_data <- data.frame(new_managers_data, summary_col)


# Show data frame contents
#new_managers_data

# Change the name of this column to "mean value"
#names(new_managers_data)[11] <- "mean value"

# Change name of summary_col to "Answer total"
#names(new_managers_data)[12] <- "Answer total"
#head(new_managers_data)
#str(new_managers_data)
# Changing date format of new_managers_data
#attach(new_managers_data)
#converted_date <- as.Date(Date, "%m/%d/%Y")
#converted_date <- format(converted_date, "%d/%m/%Y")

#detach(new_managers_data)

#new_managers_data$Date <- converted_date
#new_managers_data$Date <- as.Date(new_managers_data$Date)
#str(new_managers_data)

# Changing date format of managers
#attach(managers)
#converted_date <- as.Date(managers$Date, "%Y-%d-%m")
#changed_date <- format(converted_date, "%d/%m/%Y")
#converted_date

#detach(managers)

#managers$Date <- converted_date

#str(managers)



blank_vectors <- c("AgeCat", "Answer Total", "Mean Value")
include_list[,blank_vectors] <- NA

attach(include_list)
include_list$AgeCat[Age >= 45] <- "Elder"
include_list$AgeCat[include_list$Age >= 26 & include_list$Age <= 44] <- "Middle Aged"
include_list$AgeCat[include_list$Age <= 25] <- "Young"
include_list$AgeCat[is.na(include_list$Age)] <- "Elder"
detach(include_list)

# Calculating Answer Total column
include_list$`Answer Total` <- include_list$Q1 + include_list$Q2 + 
                include_list$Q3 + include_list$Q4 + include_list$Q5

# Calculating Mean Value column
include_list$`Mean Value` <- rowMeans(include_list[5:9])

# Default of date format in R is yyyy-mm-dd
# Define the position of date contents
# in the imported dataframe using %d %m %y etc
# R then puts the date format to default yyy-mm-dd
# Format when using Date datatype

# Convert date structure for include list data frame
restructured_date <- as.Date(include_list$Date, "%m/%d/%Y")
restructured_date

# Convert date_structure for managers dataframe
restructured_date1 <- as.Date(managers$Date, "%Y-%d-%m")
restructured_date1

