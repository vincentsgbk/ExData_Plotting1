# load data
source("loadData.R")

# set to plot only 1 graphic
par(mfcol = c(1,1))

# plotting without x-axis ticks
with(powcon, 
     plot(Global_active_power,
          type = "l",
          col = "black", 
          xaxt = "n",
          xlab = "",
          ylab = "Global Active Power (kilowatts)")
)
# add x-axis ticks
with(powcon, 
     axis(1, at = c(grep("Thu", wday)[1],grep("Fri", wday)[1], grep("Sat", wday)[1]), 
          labels = c("Thu", "Fri", "Sat"))
)

# save to png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()