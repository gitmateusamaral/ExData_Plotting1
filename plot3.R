setwd("C:\\Users\\reicl\\Downloads\\Cursos\\Coursera\\Data Science John Hopkins\\Exploratory Data Analysis\\Week1")
household_power_consumption <- read.csv2("household_power_consumption.txt")

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
household_power_consumption_2007 <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
household_power_consumption_2007$Full_Date <- paste(household_power_consumption_2007$Date, household_power_consumption_2007$Time, sep=" ")
household_power_consumption_2007$Full_Date <- strptime(household_power_consumption_2007$Full_Date, format = "%Y-%m-%d %H:%M:%S")
household_power_consumption_2007$Global_active_power <- as.numeric(household_power_consumption_2007$Global_active_power)
household_power_consumption_2007$Sub_metering_1 <- as.numeric(household_power_consumption_2007$Sub_metering_1)
household_power_consumption_2007$Sub_metering_2 <- as.numeric(household_power_consumption_2007$Sub_metering_2)
household_power_consumption_2007$Sub_metering_3 <- as.numeric(household_power_consumption_2007$Sub_metering_3)

#Creating plot 3:
png("plot3.png")

plot(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Sub_metering_1,
     col = rgb(red = 0, green = 0, blue = 0, alpha = 0),
     main = NULL, xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Sub_metering_1)
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Sub_metering_2, col = "red")
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 2)

dev.off()

#OBS: The system language changed the x axis to be qui, sex, sáb instead of Thu, Fri, Sat
