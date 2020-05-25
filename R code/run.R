filename <- "exdata_data_household_power_consumption.zip"

#Checking if archieve already exists
if(!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}

#Checking if folder exists
if(!file.exists("exdata_data_household_power_consumption")){
  unzip(filename)
}

#read a Dataset
household <- read.table(file = "household_power_consumption.txt", 
                        header = T, sep= ";",
                        na.strings = c("?"),
                        colClasses = c("character", "character", "numeric", "numeric",
                                       "numeric", "numeric", "numeric",
                                       "numeric", "numeric"))

#convert character data class to data class
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")

#convert character time class to time class
household$Time <- strptime(paste(household$Date, household$Time), "%F %T")

#select a date on 2007-02-01 and 2007-02-01
household <- subset(household, Date %in% as.Date(c("2007-02-01","2007-02-02")))