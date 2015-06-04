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
png("plot3.png", height=480, width=480, units = "px")

## Build plot
with(data, {
  plot(Date, Sub_metering_1, type = "line", col = "black", ylab = "Energy sub metering", xlab = "")
  lines(Date, Sub_metering_2, col = "red") 
  lines(Date, Sub_metering_3, col = "blue")
})

## Add legend
legend("topright" , lty = c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Device off
dev.off()
