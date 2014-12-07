## We read the data from source file. In this case separator is semicolon,
## NA-placeholder is question mark.

power<-read.table(file="household_power_consumption.txt", header=TRUE,
                  sep=";", na.strings="?")

## Lets transform Time variable to POSIXlt format also using the Date variable

power$Time<-strptime(paste(power$Date,power$Time,sep=" "),
                     format="%d/%m/%Y %H:%M:%S")

## Assign the right format for Date variable

power$Date<-as.Date(power$Date,"%d/%m/%Y")

## Subset the data frame with dates from task

power_feb07<-power[power$Date>="2007-02-01" & power$Date<="2007-02-02",]

## Set the graphic parameters for the plot

par(bg="transparent", mar=c(5.5, 4.5, 4.5, 2), oma = c(0, 0, 0, 0), cex=0.75)

## Draw the histogram with nessesary parameter of color and titles

hist(power_feb07$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Copy histogram to "another device" e.g. PNG-file with parameters for
## proper mapping

dev.copy(png, file="plot1.png", width=480, height=480, units = "px",
         pointsize = 14, antialias="none")

## Switch off the PNG-device

dev.off()