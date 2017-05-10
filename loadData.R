# set working dir
setwd("~/R/expdata/ExData_Plotting1")

library(dplyr)
library(lubridate)

# if the object doesn't exist
if (!exists("powcon")) {
        # download and unzip data
        url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, "householdPowerConsumption.zip", method = "curl")
        unzip("householdPowerConsumption.zip", exdir = "./")
        
        # load rows for from the dates 2007-02-01 and 2007-02-02 only
        powcon <- tbl_df(read.table("household_power_consumption.txt", 
                             sep = ";",
                             na.strings = "?",
                             skip = 66637,
                             nrows = 2880,
                             col.names = colnames(read.table(
                                     "household_power_consumption.txt",
                                     nrows=1,
                                     sep = ";",
                                     header=TRUE))))

        # combine date & time into POSITct
        powcon = mutate(powcon, DateTime = dmy_hms(paste(Date,Time))) %>%
                select(-c(Date, Time))
}
