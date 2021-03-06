# load data
source("loadData.R")

# set to plot only 1 graphic
par(mfcol = c(1,1))

# plotting to screen device
with(powcon, 
     plot(DateTime,
          Global_active_power,
          type = "l",
          col = "black", 
          xlab = "",
          ylab = "Global Active Power (kilowatts)")
)

# save to png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()