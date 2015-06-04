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
png("plot2.png", height=480, width=480, units = "px")

## Build plot
with(data, plot(Date, Global_active_power, type = "line", ylab = "Global Active Power (kilowats)",
                xlab = ""))

## Device off
dev.off()
