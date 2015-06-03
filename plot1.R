library(dplyr)
library(lubridate)


hpc <- read.csv("~/RCursera/household_power_consumption.txt",sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc <- mutate(hpc, Date = paste (Date,Time))
hpc$Date <- dmy_hms(hpc$Date)
data <- filter(hpc, year(Date) == 2007 , month(Date) == 02, (day(Date) == 2 | day(Date) == 1))

png(filename='plot1.png')

hist(data$Global_active_power, col = "red",main = "Global Active Power",
     xlab = "Global Active Power (kilowats)")


dev.off()
