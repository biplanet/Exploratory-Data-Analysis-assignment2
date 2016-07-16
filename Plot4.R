#Reading dataset
summaryData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")
# subsetting SCC for coal
coal  <- grepl("coal", sccData$Short.Name, ignore.case=TRUE)
subsetCoal <- sccData[coal, ]
# merging datasets
mergedata <- merge(summaryData, subsetCoal, by="SCC")
# total emissions per year
totalEmissions <- tapply(mergedata$Emissions, mergedata$year, sum)
#PNG Plot
png("plot4.png")
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", main = "Total Emission from coal sources")
dev.off()