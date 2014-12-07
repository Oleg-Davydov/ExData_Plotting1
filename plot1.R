## We read the data from the source file. In this case, the separator is a semicolon,
## NA-placeholder is the question mark.

power<-read.table(file="household_power_consumption.txt", header=TRUE,
                  sep=";", na.strings="?")

## Let's transform the Time variable to POSIXlt format while using the Date variable

power$Time<-strptime(paste(power$Date,power$Time,sep=" "),
                     format="%d/%m/%Y %H:%M:%S")

## Assign the right format for the Date variable

power$Date<-as.Date(power$Date,"%d/%m/%Y")

## Subset the data frame with dates from the task

power_feb07<-power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

## Set the graphic parameters for the plot

par(bg="transparent", mar=c(5.5, 4.5, 4.5, 2), oma = c(0, 0, 0, 0), cex=0.75)

## Draw the histogram with the required parameter of color and titles

hist(power_feb07$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Copy histogram to "another device" e.g. PNG-file with parameters for
## the proper mapping

dev.copy(png, file="ExData_Plotting1/plot1.png", width=480, height=480, units = "px",
         pointsize = 14, antialias="none")

## Turn off the PNG-device

dev.off()