# set working dir
setwd("~/R/expdata/ExData_Plotting1")

library(dplyr)

# download and read if data frame object doesn't exist
if (!exists("powcon")) {
        # download and unzip data
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      "householdPowerConsumption.zip",
                      method = "curl")
        unzip("householdPowerConsumption.zip", exdir = "./")
        
        # load rows for from the dates 2007-02-01 and 2007-02-02 only
        powcon <- tbl_df(read.table("household_power_consumption.txt", 
                             header = TRUE, 
                             sep = ";",
                             na.strings = "?",
                             skip = 66637,
                             nrows = 2880))
        
        # col names
        names(powcon) = unlist(strsplit("Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3",
                                        ";"))
        
        
        # add a column to indicate the weekday
        library(lubridate)
        powcon <- mutate(powcon, wday = wday(dmy(Date), label = TRUE, abbr = TRUE))
}
