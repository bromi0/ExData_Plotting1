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
png(file = "plot2.png")
plot(padataf$DT, padataf$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")

# close file
dev.off()