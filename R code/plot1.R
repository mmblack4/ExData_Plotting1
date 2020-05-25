source("R code/run.R")
#plot 1
#open a file
png("PNG/plot1.png")

#ploting a global active power
hist(household$Global_active_power, xlab="Global Active Power (Kilowatts)",
     col = "red",
     main = "Global Active Power")

#close a drive
dev.off()