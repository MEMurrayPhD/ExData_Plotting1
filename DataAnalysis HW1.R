##Data import and clean
PowerCons <- read.table('household_power_consumption.txt', sep=";", header=T, na.strings = "?")
PowerCons2007 <-subset(PowerCons, Date =="1/2/2007" | Date == "2/2/2007")
PowerCons2007$x <- paste(PowerCons2007$Date,PowerCons2007$Time)
PowerCons2007$x <- strptime(PowerCons2007$x, format = "%d/%m/%Y %H:%M:%S")

#Plot 1
par(mfrow=c(1,1))
hist(PowerCons2007$Global_active_power, col ="red", main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.copy(png,'plot1.png')
dev.off()

##Plot 2
par(mfrow=c(1,1))
plot(PowerCons2007$x, PowerCons2007$Global_active_power, "l", ylab = 'Global Active Power (kilowatts)', xlab=' ')
dev.copy(png,'plot2.png')
dev.off()

##Plot 3
par(mfrow=c(1,1))
plot(PowerCons2007$x, PowerCons2007$Sub_metering_1, "l", ylab = 'Energy sub metering', xlab=' ')
lines(PowerCons2007$x, PowerCons2007$Sub_metering_2, col = 'red')
lines(PowerCons2007$x, PowerCons2007$Sub_metering_3, col = 'blue')
legnames <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
legend('topright', legnames, col = c('black', 'red', 'blue'), lty=1)
dev.copy(png,'plot3.png')
dev.off()

## Plot 4
par(mfrow=c(2,2))
plot(PowerCons2007$x, PowerCons2007$Global_active_power, "l", ylab = 'Global Active Power', xlab=' ')
plot(PowerCons2007$x, PowerCons2007$Voltage, "l", ylab = 'Voltage', xlab='datetime')
plot(PowerCons2007$x, PowerCons2007$Sub_metering_1, "l", ylab = 'Energy sub metering', xlab=' ')
lines(PowerCons2007$x, PowerCons2007$Sub_metering_2, col = 'red')
lines(PowerCons2007$x, PowerCons2007$Sub_metering_3, col = 'blue')
legnames <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
legend('topright', legnames, col = c('black', 'red', 'blue'), lty=1, bty="n", cex=0.5)
plot(PowerCons2007$x, PowerCons2007$Global_reactive_power, "l", xlab='datetime', ylab = "Global_reactive_power")
dev.copy(png,'plot4.png')
dev.off()
