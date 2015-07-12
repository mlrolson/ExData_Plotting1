## Exploratory Data Analysis Project 1  - Plot 1
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

##  Plot number 1, Histogram
####  create png output
hist(as.numeric(as.character(pwrData1S$Global_active_power)), breaks = 12, col="red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
##

##  Plot number 1, Histogram as png
####  create png output
png(file="plot1.png", width=480, height=480, units="px", res = NA)
hist(as.numeric(as.character(pwrData1S$Global_active_power)), breaks = 12, col="red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
##
