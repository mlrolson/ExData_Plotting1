## Exploratory Data Analysis Project 1  - Plot 2
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

##  Plot number 2
####  convert data to numeric and create data series
y2 <- as.numeric(as.character(pwrData1S$Global_active_power))
x2 <- c(1:length(pwrData1S$Date))

####  create plot to screen device
plot(x2, y2, type="l", ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-0.075, las=0, tck=-0.02)

####  create png output
png(file="plot2.png", width=480, height=480, units="px", res = NA)
plot(x2, y2, type="l", ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), pos=-0.075, las=0, tck=-0.02)
dev.copy(png, file = "plot2.png")
dev.off()
##  