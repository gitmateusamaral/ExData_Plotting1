household_power_consumption <- read.csv2("household_power_consumption.txt")

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
household_power_consumption_2007 <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
household_power_consumption_2007$Full_Date <- paste(household_power_consumption_2007$Date, household_power_consumption_2007$Time, sep=" ")
household_power_consumption_2007$Full_Date <- strptime(household_power_consumption_2007$Full_Date, format = "%Y-%m-%d %H:%M:%S")
household_power_consumption_2007$Global_active_power <- as.numeric(household_power_consumption_2007$Global_active_power)
household_power_consumption_2007$Sub_metering_1 <- as.numeric(household_power_consumption_2007$Sub_metering_1)
household_power_consumption_2007$Sub_metering_2 <- as.numeric(household_power_consumption_2007$Sub_metering_2)
household_power_consumption_2007$Sub_metering_3 <- as.numeric(household_power_consumption_2007$Sub_metering_3)
household_power_consumption_2007$Voltage <- as.numeric(household_power_consumption_2007$Voltage)
household_power_consumption_2007$Global_reactive_power <- as.numeric(household_power_consumption_2007$Global_reactive_power)

#Creating the major plot:
png("plot4.png")

par(mfrow = c(2,2))

#Plot 1:
plot(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Global_active_power, 
     col = rgb(red = 0, green = 0, blue = 0, alpha = 0),
     main = NULL, xlab = "", ylab = "Global Active Power (kilowatts)")
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Global_active_power)

#Plot 2:
plot(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Voltage,
     col = rgb(red = 0, green = 0, blue = 0, alpha = 0),
     main = NULL, xlab = "datetime", ylab = "Voltage")
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Voltage)

#Plot 3:
plot(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Sub_metering_1,
     col = rgb(red = 0, green = 0, blue = 0, alpha = 0),
     main = NULL, xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Sub_metering_1)
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Sub_metering_2, col = "red")
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 2, bty = "n")

#Plot 4:
plot(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Global_reactive_power,
     col = rgb(red = 0, green = 0, blue = 0, alpha = 0),
     main = NULL, xlab = "datetime", ylab = "Voltage")
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Global_reactive_power)

dev.off()

#OBS: The system language changed the x axis to be qui, sex, sáb instead of Thu, Fri, Sat
