FileAdress <- "./data/household_power_consumption.txt"
data <- read.table(FileAdress, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
relevant.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(relevant.data$Date, relevant.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(relevant.data$Global_active_power)
globalReactivePower <- as.numeric(relevant.data$Global_reactive_power)
Voltage <- as.numeric(relevant.data$Voltage)
SubMeter1 <- as.numeric(relevant.data$Sub_metering_1)
SubMeter2 <- as.numeric(relevant.data$Sub_metering_2)
SubMeter3 <- as.numeric(relevant.data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, SubMeter1, type="l", ylab="Energy SubMeter", xlab="")
lines(datetime, SubMeter2, type="l", col="red")
lines(datetime, SubMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
