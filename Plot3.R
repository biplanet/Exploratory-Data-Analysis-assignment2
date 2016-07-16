library(ggplot2)
#Reading dataset
summaryData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")
# #subset data & sum per year & type
subset <- subset(summaryData, fips == "24510") 
data <- aggregate(Emissions ~ year + type, subset, sum)
#PNG Plot
png("plot3.png")
g <- ggplot(data, aes(year, Emissions, color = type))
g + geom_line() +xlab("Year") +ylab(expression("Total PM"[2.5]*" Emissions")) + ggtitle("Total Emissions per type in Baltimore")
dev.off()