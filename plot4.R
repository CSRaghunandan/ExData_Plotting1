# set the working direcetory to the cloned github directory
# the electric consumption data file should be
# placed inside the cloned directory for the code to work

# if sqldf is not installed, run this command in R console
# install.packages("sqldf")
library(sqldf)

# read.csv2.sql is instead of read.csv.sql as its default value of sep = ";"
# which is exactly what we need. 
# the sql query only selects the observations with Dates 1/2/2007 or 2/2/2007
power <- read.csv2.sql(file = "household_power_consumption.txt", header = TRUE, 
                       sql = 'select * from file where Date in ("1/2/2007","2/2/2007")')

# open a png graphics device
png(file = "plot4.png")

par(mfcol = c(2,2))

dateTime   <- as.POSIXlt(paste(as.Date(power$Date, format="%d/%m/%Y"), 
                               power$Time, sep=" "))
# plot the 1st graph
plot(dateTime, power$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")


# plot the 2nd graph
plot(dateTime, power$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "n")

lines(dateTime, power$Sub_metering_1)

lines(dateTime, power$Sub_metering_2, col = "red")

lines(dateTime, power$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3"), lty = 1)

# plot the 3rd graph
plot(dateTime, power$Voltage, type = "l", ylab = "Voltage")

# plot the 4th graph
plot(dateTime, power$Global_reactive_power,
     type = "l", ylab = "Global_reactive_power")

# close the png graphics device
dev.off()