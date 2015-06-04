library(dplyr)
library(lubridate)

## Load data
hpc <- read.csv("./household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE)

## Filter hpc and create data
data <-
  hpc %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate(Date = paste(Date, Time))
data$Date <- dmy_hms(data$Date)


## Select local time, my local time is "es_ES.UTF-8"
Sys.setlocale("LC_TIME", "en_US.UTF-8")

## Open png device
png("plot4.png", height=480, width=480, units = "px")


# Build plot
par(mfrow = c(2,2))

with(data, {
  plot(Date, Global_active_power, type = "line", ylab = "Global Active Power", xlab = "")

  plot(Date, Voltage, type = "line", ylab = "Voltage", xlab = "datetime")

  plot(Date, Sub_metering_1, type = "line", col = "black", ylab = "Energy sub metering", xlab = "")
  lines(Date, Sub_metering_2, col = "red") 
  lines(Date, Sub_metering_3, col = "blue")

  ## Add legend
  legend("topright" , lty = c(1,1,1), col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = .95)

  plot(Date, Global_reactive_power, type = "line",ylab = "Global_reactive_power", xlab = "datetime")
})

## Device off
dev.off()
