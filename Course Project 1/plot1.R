## Load only the first 100000 records to improve loading of dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=100000)

## Subset the electric power consumption to the required dates
data <- subset(data, Date=="1/2/2007" | Date =="2/2/2007")

## Convert "Global_active_power" to numeric to overcom "'x' must be numeric" error
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

## Open PNG device and create 'plot1.png' in current working directory
png("plot1.png", width=480, height=480)

## Create plot and send it to a PNG file
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## Close the PNG file device
dev.off()