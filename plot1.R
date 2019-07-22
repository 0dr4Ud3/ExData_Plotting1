
# Set the working directory
setwd("~/ExData_Plotting1")

# Read the dataset and remove the corresponding rows 
exdat<-read.table("household_power_consumption.txt",na.strings="?", header=T, sep=";", as.is = T)
exdat$Date<-as.Date(exdat$Date,"%d/%m/%Y")
ind<-which(exdat$Date<as.Date("2007-02-01","%Y-%m-%d") | exdat$Date>as.Date("2007-02-02","%Y-%m-%d"))
exdat<-exdat[-ind,]

# Let R know that date and time variables are in date and time format
dt<-paste(as.character(exdat$Date), exdat$Time)
exdat$Time<-strptime(dt,"%Y-%m-%d %H:%M:%S")

#Plot 1
with(exdat,hist(as.numeric(Global_active_power),main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png")
dev.off() 