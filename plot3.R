file<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(file, destfile= "data.zip",method="curl")

unzip("data.zip")

a<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings= "?",stringsAsFactors = FALSE)

b<-a[a$Date== "1/2/2007",]

b<-rbind(b,a[a$Date== "2/2/2007",])

b$Date <- as.Date(b$Date, format = "%d/%m/%Y")

b$DateTime <- as.POSIXct(paste(b$Date, b$Time))


png("plot3.png",width = 480, height = 480)

plot(b$DateTime, b$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(b$DateTime, b$Sub_metering_2, type="l", col="red")
lines(b$DateTime, b$Sub_metering_3, type="l", col="blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, col=c("black", "red", "blue"))


dev.off()