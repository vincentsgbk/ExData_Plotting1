# load data
source("loadData.R")

# set the layout to plot 2x2 
par(mfcol = c(2,2))

# plotting graphic#1
with(powcon, c(
        plot(Global_active_power,
             type = "l",
             col = "black", 
             xaxt = "n",
             xlab = "",
             ylab = "Global Active Power"),
        axis(1, at = c(grep("Thu", wday)[1],grep("Fri", wday)[1], grep("Sat", wday)[1]), 
             labels = c("Thu", "Fri", "Sat"))
))

# plotting graphic#2
with(powcon, c(
        plot(Sub_metering_1,
             type = "n",
             xaxt = "n",
             xlab = "",
             ylab = "Energy sub metering"),
        # add x-axis ticks
        axis(1, at = c(grep("Thu", wday)[1],grep("Fri", wday)[1], grep("Sat", wday)[1]), 
             labels = c("Thu", "Fri", "Sat")),
        # add lines
        lines(Sub_metering_1, type = "l", col = "black"),
        lines(Sub_metering_2, type = "l", col = "red"),
        lines(Sub_metering_3, type = "l", col = "blue"),
        # add legends
        legend("topright", 
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), #legend text
               col = c("black","red", "blue"), #color
               bty = "n",                      #legend without box
               lty = rep(1,n=3),               #line type
               cex = 0.3,                      #character expansion
               y.intersp=0.3)                  #character interspacing factor for vertital(y)
))

# plotting graphic#3
with(powcon, c(
        plot(Voltage,
             type = "l",
             xaxt = "n",
             xlab = "datetime",
             ylab = "Voltage"),
        # add x-axis ticks
        axis(1, at = c(grep("Thu", wday)[1],grep("Fri", wday)[1], grep("Sat", wday)[1]), 
             labels = c("Thu", "Fri", "Sat"))
))


# plotting graphic#4
with(powcon, c(
        plot(Global_reactive_power,
             type = "l",
             xaxt = "n",
             xlab = "datetime"
             #ylab = "Voltage"
             ),
        # add x-axis ticks
        axis(1, at = c(grep("Thu", wday)[1],grep("Fri", wday)[1], grep("Sat", wday)[1]), 
             labels = c("Thu", "Fri", "Sat"))
))


# save to png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()