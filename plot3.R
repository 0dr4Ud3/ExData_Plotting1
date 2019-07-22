
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

# Change weekdays to English
Sys.setlocale("LC_ALL","English")

#Plot3
plot(exdat$Time,exdat$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(exdat$Time,exdat$Sub_metering_1)
lines(exdat$Time,exdat$Sub_metering_2,col="red")
lines(exdat$Time,exdat$Sub_metering_3,col="blue")
legend("topright",lty=c("solid","solid","solid"),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))  
dev.copy(png, file = "plot3.png")
dev.off() 
