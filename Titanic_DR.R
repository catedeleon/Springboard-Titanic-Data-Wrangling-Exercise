library(dplyr)
library(tidyr)

titanic_original <- read.csv("titanic_original.csv", na.strings = c("", "NA"))

# Replace empty "embarked" values with "S"

titanic_original$embarked[is.na(titanic_original$embarked)] <- "S"

# Replace empty "age" values with age mean

titanic_original$age[is.na(titanic_original$age)] <- mean(titanic_original$age, na.rm = TRUE)

# Fill empty "boat" values with "None"

titanic_original$boat <- as.character(titanic_original$boat)
titanic_original$boat[is.na(titanic_original$boat)]<- "None"

# Create binary variable has_cabin_number to keep track of passengers w/ and w/o cabin numbers

titanic_original$has_cabin_number <- ifelse(is.na(titanic_original$cabin),"0","1")

# Write cleaned up csv file

write.csv(titanic_original, file = "titanic_clean.csv")
