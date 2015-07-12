## Exploratory Data Analysis Project 1  - Plot 3
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

##  Plot number 3
####  Select sample points
x2 <- c(1:length(pwrData1S$Date))
####  select submetering data
z1 <- as.numeric(as.character(pwrData1S$Sub_metering_1))
z2 <- as.numeric(as.character(pwrData1S$Sub_metering_2))
z3 <- as.numeric(as.character(pwrData1S$Sub_metering_3))

####  plot to screen
plot(x2, z1, type="l", ylab="Energy sub metering", xaxt="n", xlab="")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-1.55, las=0, tck=-0.02)
lines(x2, z2, type="l", col="red")
lines(x2, z3, type="l", col="blue")

####  create png output
png(file="plot3.png", width=480, height=480, units="px", res = NA)
plot(x2, z1, type="l", ylab="Energy sub metering", xaxt="n", xlab="")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-1.55, las=0, tck=-0.02)
lines(x2, z2, type="l", col="red")
lines(x2, z3, type="l", col="blue")
dev.copy(png, file = "plot3.png")
dev.off()
##