library(data.table)
source("DataLoader.R")

downloadAndUnzipData()

data <- loadAndSubsetData()

data <- data[,`:=`(Sub_metering_1=as.numeric(Sub_metering_1), Sub_metering_2=as.numeric(Sub_metering_2), Sub_metering_3=as.numeric(Sub_metering_3))]

png(filename="./plots/plot3.png", height=480, width=480, bg="transparent")

plot(data$Timestamp, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Timestamp, data$Sub_metering_2, col="red")
lines(data$Timestamp, data$Sub_metering_3, col="blue")
box(col = 'gray')
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"));

dev.off()