library(ggplot2)
#Reading dataset
summaryData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")
#subset data for baltimore
balsubset <- subset(summaryData, fips == "24510")
# subsetting SCC for vehicle
vehicle  <- grepl("vehicle", sccData$SCC.Level.Two, ignore.case=TRUE)
subsetVehicle <- sccData[vehicle, ]
#subset data for losanglos
lossubset <- subset(summaryData, fips == "06037")
# baltimore merging datasets
balmergedata <- merge(balsubset, subsetVehicle, by="SCC")
balmergedata$city <- "Baltimore City"
# los merging datasets
losmergedata <- merge(lossubset, subsetVehicle, by="SCC")
losmergedata$city <- "Los Angeles County"
#merge bal & los data
databind <- rbind(balmergedata, losmergedata)
# summing emission data per year per type
databind <- aggregate(Emissions ~ year + city, databind, sum)
#PNG Plot
png("plot6.png")
g <- ggplot(databind, aes(year, Emissions, color = city))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions from motor sources in Baltimore and Los Angeles")
dev.off()