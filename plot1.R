## reading data into 'data' variable
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)

data_subset <- subset(data, data$Date >= as.Date("2007-02-01") &
                        data$Date <= as.Date("2007-02-02"))

png(filename = "plot1.png",
    width = 480, height = 480, units = 'px')

hist(data_subset$Global_active_power, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Global Active Power")

dev.off()