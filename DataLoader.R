## This file defines functions used to download and load the data set.

library(data.table)

downloadAndUnzipData <- function()
{
  downloadFileName <- "./data/household_power_consumption.zip"
  dataUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  if(!file.exists(downloadFileName))
  {
    download.file(dataUrl, destfile=downloadFileName, method="curl")  
  }
  
  unzip(downloadFileName, exdir="./data", overwrite=FALSE)
}

loadAndSubsetData <- function()
{
  startDate <- as.Date("2007-02-01")
  stopDate <- as.Date("2007-02-02")
  
  suppressWarnings(data <- fread("./data/household_power_consumption.txt"))
  data <- data[, Date:=as.Date(Date, "%d/%m/%Y")]  
  data <- subset(data, Date %in% startDate:stopDate)
  data <- data[, Timestamp:=as.POSIXct(paste(Date, Time))]
  
  data
}