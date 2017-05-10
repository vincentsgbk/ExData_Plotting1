# load data
source("loadData.R")

# set the layout to plot 2x2 
par(mfcol = c(2,2))

# plotting graphic#1 
with(powcon, plot(DateTime,
                  Global_active_power,
                  type = "l",
                  col = "black", 
                  xlab = "",
                  ylab = "Global Active Power")
)

# plotting graphic#2
with(powcon, c(
        plot(DateTime,
             Sub_metering_1,
             type = "l",
             xlab = "",
             ylab = "Energy sub metering"),
        # add lines
        lines(DateTime,Sub_metering_2, type = "l", col = "red"),
        lines(DateTime,Sub_metering_3, type = "l", col = "blue"),
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
with(powcon, plot(DateTime,
                  Voltage,
                  type = "l",
                  xlab = "datetime",
                  ylab = "Voltage")
)

# plotting graphic#4
with(powcon, plot(DateTime,
                  Global_reactive_power,
                  type = "l",
                  xlab = "datetime")
)


# save to png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()