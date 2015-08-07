## the data should be in working directory in the
# "household_power_comsumption.txt"
# Set of scripts do make plots accrording to task in 
# Exploratory Data Analysis Coursera course
# With script names corresponding to output .png files.

# read data
padata <- read.table("household_power_consumption.txt", na.strings = "?",
                   sep = ";", dec = ".", header = TRUE,
                   colClasses = c(rep("character", 2), rep("numeric",7)))
padata$Date <- as.Date(padata$Date, format = "%d/%m/%Y")
# filter date
padataf <- padata[padata$Date == as.Date("2007-02-01")| 
                  padata$Date == as.Date("2007-02-02"),]
# combine date and time into single posix
padataf$DT <- strptime(paste(sep = " ", padataf$Date, padataf$Time),
                       format = "%Y-%m-%d %H:%M:%S")
Sys.setlocale(category = "LC_TIME", locale = "English")

# write png plot
png(file = "plot4.png")
# set quadrant
par(mfcol = c(2,2), cex = 0.75)
# 1st plot (from task part2)
plot(padataf$DT, padataf$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")
# 2nd plot (from task part3)
plot(padataf$DT, padataf$Sub_metering_1, type="n",
     xlab = "", ylab = "Energy sub metering")
points(padataf$DT, padataf$Sub_metering_1, type="l")
points(padataf$DT, padataf$Sub_metering_2, type="l", col="Red")
points(padataf$DT, padataf$Sub_metering_3, type="l", col="Blue")
legend("topright",names(padataf)[7:9],
       col=c("black","blue","red"), lwd=1, bty = "n")
# 3st plot
plot (padataf$DT, padataf$Voltage, type="l", 
                xlab = "datetime", ylab = "Voltage")
# 4th plot
plot (padataf$DT, padataf$Global_reactive_power, type="l", 
                xlab = "datetime", ylab = "Global_reactive_power")

       
# close file
dev.off()