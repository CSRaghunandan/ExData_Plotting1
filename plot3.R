# set the working direcetory to the cloned github directory
# the household_power_consumption.txt data file should be
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
png(file = "plot3.png")

# plot the graph
plot(dateTime, power$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "n")

lines(dateTime, power$Sub_metering_1)

lines(dateTime, power$Sub_metering_2, col = "red")

lines(dateTime, power$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3"), lty = 1)

# close the png graphics device
dev.off()