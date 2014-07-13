data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Subset the electric power consumption to the required dates
data <- subset(data, Date=="1/2/2007" | Date =="2/2/2007")

## Convert "Global_active_power" to numeric to overcom "'x' must be numeric" error
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

## Convert the Date and Time variables to Date/Time classes and prepare day variable
data$day <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S", tz="EST"))

## Open PNG device and create 'plot1.png' in current working directory
png("plot2.png", width=480, height=480)

## Create plot and send it to a PNG file
plot(data$day, data$Global_active_power, type="l", xlab="", ylab ="Global Active Power (kilowatts)")

## Close the PNG file device
dev.off()