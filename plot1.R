# set working directory
setwd("C:/Users/ngboonpin/Documents")

# load sqldf library
library("sqldf")

# read data for 1st and 2nd Feb 2007
wp <- file("household_power_consumption.txt")
attr(wp, "file.format")<-list(sep=";",header=TRUE)

wp.df <-sqldf("select * from wp where Date='1/2/2007' or Date='2/2/2007'")

# create png file
png(filename="plot1.png", width = 480, height = 480, bg = "transparent")

# hist()
hist(wp.df$Global_active_power,
     col='red',
     xlab='Global Active Power (kilowatt)',
     main='Global Actlve Power')

dev.off()