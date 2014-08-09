library(data.table)
source("DataLoader.R")

downloadAndUnzipData()

data <- loadAndSubsetData()

data <- data[,Global_active_power:=as.numeric(Global_active_power)]

png(filename="./plots/plot1.png", height=480, width=480, bg="transparent")

hist(data$Global_active_power, col="red", ylim = c(0, 1200), main="Global Active Power", xlab= "Global Active Power (kilowatts)")

dev.off()