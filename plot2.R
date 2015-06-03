library(dplyr)
library(lubridate)


hpc <- read.csv("~/RCursera/household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc <- mutate(hpc, Date = paste (Date,Time))
hpc$Date <- dmy_hms(hpc$Date)
data <- filter(hpc, year(Date) == 2007 , month(Date) == 02, (day(Date) == 2 | day(Date) == 1))

Sys.setlocale("LC_TIME", "en_US.UTF-8")

png(filename='plot2.png')
plot(data$Date, data$Global_active_power, type = "line", ylab = "Global Active Power (kilovats)", xlab = "")


dev.off()
