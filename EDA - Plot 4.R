hh_powercons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

hh_power2007 <- subset(hh_powercons, Date %in% c("1/2/2007", "2/2/2007"))
hh_power2007$Date <- as.Date(hh_power2007$Date, format = "%d/%m/%Y")
DateTime <- paste(as.Date(hh_power2007$Date), hh_power2007$Time)
hh_power2007$DateTime <- as.POSIXct(DateTime)

# Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hh_power2007, {
    plot(Global_active_power ~ DateTime, type = "l", 
         xlab = "", ylab="Global Active Power (kilowatts)")
    plot(Voltage ~ DateTime, type= "l", 
         xlab = "", ylab="Voltage (volt)")
    plot(Sub_metering_1 ~ DateTime, type = "l", 
         xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(Sub_metering_2 ~ DateTime,col = 'Red')
    lines(Sub_metering_3 ~ DateTime,col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty="n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ DateTime, type = "l", 
         xlab = "", ylab = "Global Reactive Power (kilowatts)")
})

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()