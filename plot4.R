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

png(filename="plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))

# plot 1
plot(wp.df$Datetime,wp.df$Global_active_power,type='l',xlab='',ylab='Global Active Power')

# plot 2
plot(wp.df$Datetime,wp.df$Voltage,type='l',xlab='datetime',ylab='Voltage')

# plot 3
plot(wp.df$Datetime, wp.df$Sub_metering_1, type='l', xlab='', ylab='Energy sub-metering')

lines(wp.df$Datetime, wp.df$Sub_metering_2, type='l',col='red')
lines(wp.df$Datetime, wp.df$Sub_metering_3, type='l',col='blue')

legend("topright",legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black','red','blue'),lty=1)

#plot 4
plot(wp.df$Datetime,wp.df$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')

dev.off()