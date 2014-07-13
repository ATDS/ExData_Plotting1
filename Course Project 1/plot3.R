data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Subset the electric power consumption to the required dates
data <- subset(data, Date=="1/2/2007" | Date =="2/2/2007")

## Convert numeric variables to numeric classes to overcom "'x' must be numeric" error
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

## Convert the Date and Time variables to Date/Time classes and prepare day variable
data$day <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S", tz="EST"))

## Open PNG device and create 'plot1.png' in current working directory
png("plot3.png", width=480, height=480)

## Create plot and send it to a PNG file
plot(data$day, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type= "n")

## Annotate the plot
lines(data$day, data$Sub_metering_1, type="l", col="black")
lines(data$day, data$Sub_metering_2, type="l", col="red")
lines(data$day, data$Sub_metering_3, type="l", col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="c")

## Close the PNG file device
dev.off()