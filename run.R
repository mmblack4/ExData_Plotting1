
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


#plot 1

#open a file
png("plot1.png")

#ploting a global active power
hist(household$Global_active_power, xlab="Global Active Power (Kilowatts)",
     col = "red",
     main = "Global Active Power")

#close a drive
dev.off()


#plot 2
png("plot2.png")

#ploting global active power and time
with(household, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)"))

dev.off()

#plot 3
png("plot3.png")

#ploting time and Energy sub
with(household, plot(Time, Sub_metering_1, type = "l", xlab = '', ylab = "Energy sub metering"))
with(household, points(Time, Sub_metering_2, type = "l", col = 'red'))
with(household, points(Time, Sub_metering_3, type = "l", col = 'blue'))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = names(household[7:9]))

dev.off()

#plot4
png("plot4.png")
par(mfcol = c(2,2), mar = c(4.5, 5, 2, 2))

#ploting global active power and time
with(household, plot(Time, Global_active_power, type = "l", xlab = '', ylab = "Global Active Power"))

#ploting time and Energy sub
with(household, plot(Time, Sub_metering_1, type = "l", xlab = '', ylab = "Energy sub metering"))
with(household, points(Time, Sub_metering_2, type = "l", col = 'red'))
with(household, points(Time, Sub_metering_3, type = "l", col = 'blue'))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = names(household[7:9]))

#ploting a voltage
with(household, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "voltage"))

#ploting time and Global_reactive_power
with(household, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()


