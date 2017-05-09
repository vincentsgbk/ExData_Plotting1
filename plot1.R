# load data
source("loadData.R")

# set to plot only 1 graphic
par(mfcol = c(1,1))

# plotting
hist(powcon$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# save to png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()