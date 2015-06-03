library(dplyr)
library(lubridate)

## Load data
hpc <- read.csv("./household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE)

## Create Date and filter data
hpc <- mutate(hpc, Date = paste (Date,Time))
hpc$Date <- dmy_hms(hpc$Date)
data <- filter(hpc, year(Date) == 2007 , month(Date) == 02, (day(Date) == 2 | day(Date) == 1))

## Open png device
png("plot1.png", height=480, width=480, units = "px")

## Build plot
hist(data$Global_active_power, col = "red",main = "Global Active Power",
     xlab = "Global Active Power (kilowats)")

## Device off
dev.off()
