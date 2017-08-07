hh_powercons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

hh_power2007 <- subset(hh_powercons, Date %in% c("1/2/2007", "2/2/2007"))
hh_power2007$Date <- as.Date(hh_power2007$Date, format = "%d/%m/%Y")
DateTime <- paste(as.Date(hh_power2007$Date), hh_power2007$Time)
hh_power2007$DateTime <- as.POSIXct(DateTime)

# Plot 1
hist(hh_power2007$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()