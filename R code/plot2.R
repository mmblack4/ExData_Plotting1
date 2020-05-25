source("R code/run.R")

#plot 2
png("PNG/plot2.png")

#ploting global active power and time
with(household, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)"))

dev.off()