# load data
source("loadData.R")

# set to plot only 1 graphic
par(mfcol = c(1,1))

# plotting without x-axis ticks
with(powcon, 
     plot(Sub_metering_1,
          type = "n",
          xaxt = "n",
          xlab = "",
          ylab = "Energy sub metering")
)
# add x-axis ticks
with(powcon, 
     axis(1, at = c(grep("Thu", wday)[1],grep("Fri", wday)[1], grep("Sat", wday)[1]), 
          labels = c("Thu", "Fri", "Sat"))
)
# add lines
lines(powcon$Sub_metering_1, type = "l", col = "black")
lines(powcon$Sub_metering_2, type = "l", col = "red")
lines(powcon$Sub_metering_3, type = "l", col = "blue")
# add legends
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), #legend text
       col = c("black","red", "blue"), # color
       lty = rep(1,n=3),               #line type
       cex = 0.6,                      #character expansion
       y.intersp=0.3)                  #character interspacing factor for vertital(y)

# save to png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()