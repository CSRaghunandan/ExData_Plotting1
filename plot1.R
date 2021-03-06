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
png(file = "plot1.png")

# plots the histogram
hist(power2$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

# closet the png graphics device
dev.off()