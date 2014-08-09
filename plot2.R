library(data.table)
source("DataLoader.R")

downloadAndUnzipData()

data <- loadAndSubsetData()

data <- data[,Global_active_power:=as.numeric(Global_active_power)]

png(filename="./plots/plot2.png", height=480, width=480, bg="transparent")

plot(data$Timestamp, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
box(col = 'gray')

dev.off()