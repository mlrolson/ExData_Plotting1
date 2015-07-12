## Exploratory Data Analysis Project 1  - Plot 4
## Electric Power Consumption Data, UC Irvine Machine Learning Repository
## Working directory data file name  "household_power_consumption.txt"
## Data file unzipped must be in your working directory

getwd()

##  Preprocess data to subset desired data and remove missing data "?".
pwrData <- read.table("household_power_consumption.txt",
                      header=TRUE, sep=";")
dim(pwrData)
dim(pwrData[!complete.cases(pwrData),])
head(pwrData)

#  select complete cases - not really necessary for this problem
pwrData1 <- pwrData[complete.cases(pwrData),]
dim(pwrData1)

#  select specified dates of February 1, 2007 through February 2, 2007
pwrData1S <- subset(pwrData1, as.character(pwrData1$Date) == "1/2/2007" 
                    | as.character(pwrData1$Date) == "2/2/2007")
dim(pwrData1S)  # finds number of cases, 
par(mfrow=c(1,1))  # set graphical parameters

##  Plot number 4
####  Select sample points from earlier plots
x2 <- c(1:length(pwrData1S$Date))
y2 <- as.numeric(as.character(pwrData1S$Global_active_power))
z1 <- as.numeric(as.character(pwrData1S$Sub_metering_1))
z2 <- as.numeric(as.character(pwrData1S$Sub_metering_2))
z3 <- as.numeric(as.character(pwrData1S$Sub_metering_3))

##  Output to screen device
par(mfrow=c(2,2), mar = c(5,5,1,1))
plot(x2, y2, type="l", ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-0.075, las=0, tck=-0.02)
w2 <- as.numeric(as.character(pwrData1S$Voltage))
plot(x2, w2, type="l", ylab="Voltage", xaxt="n", xlab="datetime")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=232.5, las=0, tck=-0.02)
plot(x2, z1, type="l", ylab="Energy sub metering", xaxt="n", xlab="")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-0.155, las=0, tck=-0.02)
lines(x2, z2, type="l", col="red")
lines(x2, z3, type="l", col="blue")
legend("topright", col= c("black", "red", "blue"), bty="n", lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
w4 <- as.numeric(as.character(pwrData1S$Global_reactive_power))
plot(x2, w4, type="l", ylab="Global_reactive_power", xaxt="n", xlab="datetime")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-0.02, las=0, tck=-0.02)


####  Create png output
png(file="plot4.png", width=480, height=480, units="px", res = NA)
##  Create 2 x 2 grid, adjust margins for plot fit
par(mfrow=c(2,2), mar = c(5,5,1,1))
plot(x2, y2, type="l", ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-0.075, las=0, tck=-0.02)
w2 <- as.numeric(as.character(pwrData1S$Voltage))
plot(x2, w2, type="l", ylab="Voltage", xaxt="n", xlab="datetime")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=232.5, las=0, tck=-0.02)
plot(x2, z1, type="l", ylab="Energy sub metering", xaxt="n", xlab="")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-0.155, las=0, tck=-0.02)
lines(x2, z2, type="l", col="red")
lines(x2, z3, type="l", col="blue")
legend("topright", col= c("black", "red", "blue"), bty="n", lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
w4 <- as.numeric(as.character(pwrData1S$Global_reactive_power))
plot(x2, w4, type="l", ylab="Global_reactive_power", xaxt="n", xlab="datetime")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-0.02, las=0, tck=-0.02)
dev.copy(png, file = "plot4.png")
dev.off()
par(mfrow=c(1,1))