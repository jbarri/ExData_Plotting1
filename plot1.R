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

## Open png device
png("plot1.png", height=480, width=480, units = "px")

## Build plot

with(data, hist(Global_active_power, col = "red",main = "Global Active Power",
               xlab = "Global Active Power (kilowats)"))

## Device off
dev.off()
