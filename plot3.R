library(dplyr)
library(lubridate)


hpc <- read.csv("~/RCursera/household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc <- mutate(hpc, Date = paste (Date,Time))
hpc$Date <- dmy_hms(hpc$Date)
data <- filter(hpc, year(Date) == 2007 , month(Date) == 02, (day(Date) == 2 | day(Date) == 1))

Sys.setlocale("LC_TIME", "en_US.UTF-8")

png(filename='plot2.png')

plot(data$Date, data$Sub_metering_1, type = "line", col = "black", ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_2, col = "red") 
lines(data$Date, data$Sub_metering_3, col = "blue")

legend("topright" , lty = c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .8, y.intersp = 0.6)


dev.off()
