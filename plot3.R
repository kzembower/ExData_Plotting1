## Exploratory Data Analysis
## Project 1

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "household_power_consumption.zip"
download.file(url, destfile=destfile, method='curl')

unzip(destfile)

df <- read.csv('household_power_consumption.txt',
               sep=';',
               header=TRUE,
               na='?',
               colClasses=c('Date',
                   'factor',
                   'numeric',
                   'numeric',
                   'numeric',
                   'numeric',
                   'numeric',
                   'numeric',
                   'numeric')
               )

df <- read.csv('household_power_consumption.txt',
               sep=';',
               header=TRUE,
               na='?'
               )

df$DateTime <- strptime(paste(df$Date, df$Time, sep=' '),
                        format= "%d/%m/%Y %H:%M:%S")

## Select only 2/1/07 and 2/2/07:
df2 <- subset(df, DateTime >= as.POSIXlt('2007-02-01 00:00:00') &
                  DateTime <  as.POSIXlt('2007-02-02 23:59:59'))

## Plot 3:
png('plot3.png')

with(df2, plot(DateTime, Sub_metering_1,
               type='l',
               col='black',
               ylab='Energy Sub metering',
               xlab=''))
with(df2, lines(DateTime, Sub_metering_2,
                type='l',
                col='red'))
with(df2, lines(DateTime, Sub_metering_3,
                type='l',
                col='blue'))
legend('topright',
       c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'),
       lty='solid')

dev.off()
