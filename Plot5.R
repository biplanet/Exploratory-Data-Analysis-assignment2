#Reading dataset
summaryData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")
#subset data for baltimore
balsubset <- subset(summaryData, fips == "24510")
# subsetting SCC for vehicle
vehicle  <- grepl("vehicle", sccData$SCC.Level.Two, ignore.case=TRUE)
subsetVehicle <- sccData[vehicle, ]
# merging datasets
mergedata <- merge(balsubset, subsetVehicle, by="SCC")
# total emissions per year per type for datasets
totalEmissions <- tapply(mergedata$Emissions, mergedata$year, sum)
#PNG Plot
png("plot5.png")
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", main = "Total Emission from motor sources in Baltimore")
dev.off()