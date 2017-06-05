FileAdress <- "./data/household_power_consumption.txt"
data <- read.table(FileAdress, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
relevant.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(relevant.data$Date, relevant.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(relevant.data$Global_active_power)

SubMeter1 <- as.numeric(relevant.data$Sub_metering_1)
SubMeter2 <- as.numeric(relevant.data$Sub_metering_2)
SubMeter3 <- as.numeric(relevant.data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, SubMeter1, type="l", ylab="Energy SubMeter", xlab="")
lines(datetime, SubMeter2, type="l", col="red")
lines(datetime, SubMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
