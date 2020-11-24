household_power_consumption <- read.csv2("household_power_consumption.txt")

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
household_power_consumption_2007 <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
household_power_consumption_2007$Full_Date <- paste(household_power_consumption_2007$Date, household_power_consumption_2007$Time, sep=" ")
household_power_consumption_2007$Full_Date <- strptime(household_power_consumption_2007$Full_Date, format = "%Y-%m-%d %H:%M:%S")
household_power_consumption_2007$Global_active_power <- as.numeric(household_power_consumption_2007$Global_active_power)

#Creating plot 2:
png("plot2.png")

plot(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Global_active_power, 
     col = rgb(red = 0, green = 0, blue = 0, alpha = 0),
     main = NULL, xlab = "", ylab = "Global Active Power (kilowatts)")
lines(household_power_consumption_2007$Full_Date, household_power_consumption_2007$Global_active_power)

dev.off()

#OBS: The system language changed the x axis to be qui, sex, sáb instead of Thu, Fri, Sat