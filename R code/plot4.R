source("R code/run.R")

#plot4
png("PNG/plot4.png")
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