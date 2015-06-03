library(dplyr)
library(lubridate)

## Load data
hpc <- read.csv("./household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE)

## Create Date and filter data
hpc <- mutate(hpc, Date = paste (Date,Time))
hpc$Date <- dmy_hms(hpc$Date)
data <- filter(hpc, year(Date) == 2007 , month(Date) == 02, (day(Date) == 2 | day(Date) == 1))

## Select local time, my local time is "es_ES.UTF-8"
Sys.setlocale("LC_TIME", "en_US.UTF-8")

## Open png device
png("plot4.png")


# Build plot
par(mfrow = c(2,2))

plot(data$Date, data$Global_active_power, type = "line", ylab = "Global Active Power", xlab = "")

plot(data$Date, data$Voltage, type = "line", ylab = "Voltage", xlab = "datetime")

plot(data$Date, data$Sub_metering_1, type = "line", col = "black", ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_2, col = "red") 
lines(data$Date, data$Sub_metering_3, col = "blue")

## Add legend
legend("topright" , lty = c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = .95)

plot(data$Date, data$Global_reactive_power, type = "line",ylab = "Global_reactive_power", xlab = "datetime")

## Device off
dev.off()
