# set working directory
setwd("C:/Users/ngboonpin/Documents")

# load sqldf library
library("sqldf")

# read data for 1st and 2nd Feb 2007
wp <- file("household_power_consumption.txt")
attr(wp, "file.format")<-list(sep=";",header=TRUE)

wp.df <-sqldf("select * from wp where Date='1/2/2007' or Date='2/2/2007'")

# add a new column DateTime
wp.df$Datetime <- strptime(paste(wp.df$Date, wp.df$Time, " "), format = "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width = 480, height = 480, bg = "transparent")

# plot graph
plot(wp.df$Datetime, wp.df$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatt)')

dev.off()