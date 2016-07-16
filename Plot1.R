#Reading dataset
summaryData <- readRDS("summarySCC_PM25.rds")
sccData <- readRDS("Source_Classification_Code.rds")
#get total emissons
totalEmissions <- tapply(summaryData$Emissions, summaryData$year, sum)
#PNG Plot
png("plot1.png")
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", main = "Total Emission per year")
dev.off()