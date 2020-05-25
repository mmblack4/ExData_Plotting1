source("R code/run.R")

#plot 3
png("PNG/plot3.png")

#ploting time and Energy sub
with(household, plot(Time, Sub_metering_1, type = "l", xlab = '', ylab = "Energy sub metering"))
with(household, points(Time, Sub_metering_2, type = "l", col = 'red'))
with(household, points(Time, Sub_metering_3, type = "l", col = 'blue'))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = names(household[7:9]))

dev.off()