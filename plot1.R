household_power_consumption <- read.csv2("household_power_consumption.txt")

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
household_power_consumption$Time <- strptime(household_power_consumption$Time, format = "%H:%M:%S")
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)
household_power_consumption_2007 <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Creating plot 1:
png("plot1.png")

hist(household_power_consumption_2007$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()


