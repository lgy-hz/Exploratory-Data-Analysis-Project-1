

file<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(file, destfile= "data.zip",method="curl")

unzip("data.zip")

a<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings= "?",stringsAsFactors = FALSE)

b<-a[a$Date== "1/2/2007",]

b<-rbind(b,a[a$Date== "2/2/2007",])


png("plot1.png",width = 480, height = 480)

with(b,hist(Global_active_power,col="red",main= "Global Active Power"))

dev.off()



