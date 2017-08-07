hh_powercons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

hh_power2007 <- subset(hh_powercons, Date %in% c("1/2/2007", "2/2/2007"))
hh_power2007$Date <- as.Date(hh_power2007$Date, format = "%d/%m/%Y")
DateTime <- paste(as.Date(hh_power2007$Date), hh_power2007$Time)
hh_power2007$DateTime <- as.POSIXct(DateTime)

# Plot 3
with(hh_power2007, {
    plot(Sub_metering_1 ~ DateTime, type="l",
         xlab="", ylab="Global Active Power (kilowatts)")
    lines(Sub_metering_2 ~ DateTime, col = 'Red')
    lines(Sub_metering_3 ~ DateTime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()