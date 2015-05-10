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

png(filename = "plot4.png",
    width = 480, height = 480, units = 'px')
## setting graphic parameters
par(mfcol = c(2,2), mar = c(3,3,1,1), mai = c(0.5,0.5,0.4,0.4), cex = 0.6)

## first plot
plot(data_subset$Time, data_subset$Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)", type = "n")
lines(data_subset$Time, data_subset$Global_active_power)

##second plot
plot(data_subset$Time, data_subset$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "n")
lines(data_subset$Time, data_subset$Sub_metering_1)
lines(data_subset$Time, data_subset$Sub_metering_2, col = "red")
lines(data_subset$Time, data_subset$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## third plot
plot(data_subset$Time, data_subset$Voltage, xlab = "datetime", ylab = "Voltage",
     type = "n")
lines(data_subset$Time, data_subset$Voltage)

## forth plot
plot(data_subset$Time, data_subset$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "n")
lines(data_subset$Time, data_subset$Global_reactive_power)

dev.off()