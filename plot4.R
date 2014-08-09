library(data.table)
source("DataLoader.R")

downloadAndUnzipData()

data <- loadAndSubsetData()

data <- data[,`:=`(
  Global_active_power=as.numeric(Global_active_power), 
  Voltage=as.numeric(Voltage),
  Sub_metering_1=as.numeric(Sub_metering_1), 
  Sub_metering_2=as.numeric(Sub_metering_2), 
  Sub_metering_3=as.numeric(Sub_metering_3),
  Global_reactive_power=as.numeric(Global_reactive_power)
  )]

png(filename="./plots/plot4.png", height=480, width=480, bg="transparent")

par(mfrow = c(2, 2))

# plot(1,1)
plot(data$Timestamp, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
box(col = 'gray')

# plot(1,2)
plot(data$Timestamp, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
box(col = 'gray')

# plot(2,1)
plot(data$Timestamp, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Timestamp, data$Sub_metering_2, col="red")
lines(data$Timestamp, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, col=c("black","red","blue"));
box(col = 'gray')

#plot(2,2)
plot(data$Timestamp, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
box(col = 'gray')

dev.off()