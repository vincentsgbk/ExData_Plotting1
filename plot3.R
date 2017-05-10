# load data
source("loadData.R")

# set to plot only 1 graphic
par(mfcol = c(1,1))

# plotting to screen device
with(powcon, 
     c(plot(DateTime, #plot first line
          Sub_metering_1, 
          type = "l", 
          col = "black",
          xlab = "", 
          ylab = "Energy sub metering"),
       lines(DateTime,Sub_metering_2, type = "l", col = "red"), # add 2nd line
       lines(DateTime,Sub_metering_3, type = "l", col = "blue") # add 3rd line
))

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