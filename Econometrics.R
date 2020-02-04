####Population Total
install.packages("reshape2")
install.packages("dplyr")
install.packages("readxl")
install.packageso("htmltab")

#Loading the required libraries
library(dplyr)
library(readxl)
library(htmltab)
library(reshape2)

#Reading a CSV file
Popf <- read.csv("C:\\Users\\Abhi\\Desktop\\Project files\\Structured datasets\\Population, Female.csv", header = F, strip.white = TRUE)

#Deleting a particular set of rows and columns
Popf <- Popf [c(3, 16, 19, 23, 101, 55, 56, 60, 73, 77, 79, 57, 91, 103, 113, 118, 147, 145, 146, 161, 178, 192, 196, 192, 196, 224, 72, 225, 83),] #KeepTheseRows
Popf <- Popf [-c(2, 4, 5:55)]
Popf <- Popf [-c(2)]
Popf <- Popf [-c(9,10)]

#Renaming Columns
names(Popf)[1] <- "Country"
names(Popf)[2] <- "2011"
names(Popf)[3] <- "2012"
names(Popf)[4] <- "2013"
names(Popf)[5] <- "2014"
names(Popf)[6] <- "2015"
names(Popf)[7] <- "2016"
names(Popf)[8] <- "2017"
Popf <- Popf[-c(1),]

#Using the melt function 
Popf<-melt(data=Popf, id.vars= "Country" , measure.vars = c("2011","2012","2013","2014","2015","2016","2017"))

#Renaming Columns
names(Popf)[2] ="Year"
names(Popf)[3] ="Population"

str(Popf)

Popf$Country <- as.character(Popf$Country) #Changing the type of Country column to char

Popf$Year <- as.character(Popf$Year)
Popf$Year <- as.numeric(Popf$Year)

#Adding a Region column

Popf$Region <- rep(" ", nrow(Popf))

#Adding a Gender column

Popf$Gender <- rep("F", nrow(Popf))
Df1 <- Popf
Df1[Df1$Country == "Austria", "Region"] <- "Central Europe"
Df1[Df1$Country == "Belgium", "Region"] <- "Southern Europe"
Df1[Df1$Country == "Croatia", "Region"] <- "Southern Europe"
Df1[Df1$Country == "Cyprus", "Region"] <- "Southern Europe"
Df1[Df1$Country == "Czech Republic", "Region"] <- "Central Europe"
Df1[Df1$Country == "Denmark", "Region"] <- "Northern Europe"
Df1[Df1$Country == "Estonia", "Region"] <- "Northern Europe"
Df1[Df1$Country == "Finland", "Region"] <- "Northern Europe"
Df1[Df1$Country == "France", "Region"] <- "Western Europe"
Df1[Df1$Country == "Germany", "Region"] <- "Central Europe"
Df1[Df1$Country == "Greece", "Region"] <- "Southern Europe"
Df1[Df1$Country == "Hungary", "Region"] <- "Central Europe"
Df1[Df1$Country == "Ireland", "Region"] <- "Northern Europe"
Df1[Df1$Country == "Italy", "Region"] <- "Southern Europe"
Df1[Df1$Country == "Latvia", "Region"] <- "Northern Europe"
Df1[Df1$Country == "Lithuania", "Region"] <- "Northern Europe"
Df1[Df1$Country == "Luxembourg", "Region"] <- "Central Europe"
Df1[Df1$Country == "Malta", "Region"] <- "Southern Europe"
Df1[Df1$Country == "Netherlands", "Region"] <- "Western Europe"
Df1[Df1$Country == "Poland", "Region"] <- "Central Europe"
Df1[Df1$Country == "Portugal", "Region"] <- "Southern Europe"
Df1[Df1$Country == "Romania", "Region"] <- "Central Europe"
Df1[Df1$Country == "Slovakia", "Region"] <- "Central Europe"
Df1[Df1$Country == "Slovenia", "Region"] <- "Central Europe"
Df1[Df1$Country == "Spain", "Region"] <- "Southern Europe"
Df1[Df1$Country == "Sweden", "Region"] <- "Northern Europe"
Df1[Df1$Country == "United Kingdom", "Region"] <- "Northern Europe"
Df1[Df1$Country == "Bulgaria", "Region"] <- "Southern Europe"

Popf <- Df1
#Checking data types
str(Popf)

#Reading a CSV file
Popm <- read.csv("C:\\Users\\Abhi\\Desktop\\Project files\\Structured datasets\\\\Population, Male.csv", header = F, strip.white = TRUE)

#Keep these rows
Popm <- Popm [c(3, 16, 19, 23, 101, 55, 56, 60, 73, 77, 79, 57, 91, 103, 113, 118, 147, 145, 146, 161, 178, 192, 196, 192, 196, 224, 72, 225, 83),] #KeepTheseRows

#Deleting unwanted rows
Popm <- Popm [-c(2, 4, 5:55)]
Popm <- Popm [-c(2)]
Popm <- Popm [-c(9,10)]

#Renaming Columns

names(Popm)[1] <- "Country"
names(Popm)[2] <- "2011"
names(Popm)[3] <- "2012"
names(Popm)[4] <- "2013"
names(Popm)[5] <- "2014"
names(Popm)[6] <- "2015"
names(Popm)[7] <- "2016"
names(Popm)[8] <- "2017"
Popm <- Popm[-c(1),]

#Using the Melt Function
Popm<-melt(data=Popm, id.vars= "Country" , measure.vars = c("2011","2012","2013","2014","2015","2016","2017"))
names(Popm)[2] ="Year"
names(Popm)[3] ="Population"

Popm$Country <- as.character(Popm$Country) #Changinng the type of Country column to char

Popm$Year <- as.character(Popm$Year)
Popm$Year <- as.numeric(Popm$Year)

#Adding a Region column

Popm$Region <- rep(" ", nrow(Popm))

#Adding a Gender column

Popm$Gender <- rep("M", nrow(Popm))

#Adding a region column
Df2 <- Popm
Df2[Df2$Country == "Austria", "Region"] <- "Central Europe"
Df2[Df2$Country == "Belgium", "Region"] <- "Southern Europe"
Df2[Df2$Country == "Croatia", "Region"] <- "Southern Europe"
Df2[Df2$Country == "Cyprus", "Region"] <- "Southern Europe"
Df2[Df2$Country == "Czech Republic", "Region"] <- "Central Europe"
Df2[Df2$Country == "Denmark", "Region"] <- "Northern Europe"
Df2[Df2$Country == "Estonia", "Region"] <- "Northern Europe"
Df2[Df2$Country == "Finland", "Region"] <- "Northern Europe"
Df2[Df2$Country == "France", "Region"] <- "Western Europe"
Df2[Df2$Country == "Germany", "Region"] <- "Central Europe"
Df2[Df2$Country == "Greece", "Region"] <- "Southern Europe"
Df2[Df2$Country == "Hungary", "Region"] <- "Central Europe"
Df2[Df2$Country == "Ireland", "Region"] <- "Northern Europe"
Df2[Df2$Country == "Italy", "Region"] <- "Southern Europe"
Df2[Df2$Country == "Latvia", "Region"] <- "Northern Europe"
Df2[Df2$Country == "Lithuania", "Region"] <- "Northern Europe"
Df2[Df2$Country == "Luxembourg", "Region"] <- "Central Europe"
Df2[Df2$Country == "Malta", "Region"] <- "Southern Europe"
Df2[Df2$Country == "Netherlands", "Region"] <- "Western Europe"
Df2[Df2$Country == "Poland", "Region"] <- "Central Europe"
Df2[Df2$Country == "Portugal", "Region"] <- "Southern Europe"
Df2[Df2$Country == "Romania", "Region"] <- "Central Europe"
Df2[Df2$Country == "Slovakia", "Region"] <- "Central Europe"
Df2[Df2$Country == "Slovenia", "Region"] <- "Central Europe"
Df2[Df2$Country == "Spain", "Region"] <- "Southern Europe"
Df2[Df2$Country == "Sweden", "Region"] <- "Northern Europe"
Df2[Df2$Country == "United Kingdom", "Region"] <- "Northern Europe"
Df2[Df2$Country == "Bulgaria", "Region"] <- "Southern Europe"

#Assigning Df2 to the object Popm
Popm <- Df2

#Checking data types
str(Popm)

P1 <- Popf
P2 <- Popm

#Using the reduce and merge functions to add the male and female populations to one table
PopT = Reduce(function(x, y) merge(x, y, all=TRUE), list(P1, P2))

View(PopT)
#Grouping the data by country and year
Population_Total <- PopT %>% group_by(Country,Year) %>% summarise(total = sum(Population)) 

PopulationX <- Reduce(function(x,y) merge(x,y, all = T), list(Population_Total, PopT)) 

#renaming a column
names(PopulationX)[3] <- "Total Population"

PopulationX<- PopulationX[!duplicated(PopulationX),]

#Writing the .csv file
write.csv(PopulationX, "PopulationX.csv",row.names=FALSE)#, na="", col.names=T, sep=",")

#### Education


#getwd()

setwd("C:/Users/Abhi/Desktop/Project files/Econometrics and the effects of Brexit")

#Reading the csv file from the local directory
Education <- read.csv(file = "C:/Users/Abhi/Desktop/Project files/Structured datasets/Gender wise Education.csv",header =F, strip.white = T)
Education <- Education[-c(1), -c(1, 4, 5, 6,8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 20, 21)]

#Removing blank values
Education <- Education[!(Education$V19 == ""),]

#Checking for missing values for verification purposes
#Education1 <- filter(Education, V20 == "x")
#Education2 <- filter(Education, (V20 == 'z'))
#Education3 <- filter(Education, (V20 == 'w'))

#Renaming column names
names(Education)[1] <- "Country"
names(Education)[4] <- "Year"
names(Education)[3] <- "Level"
names(Education)[5] <- "Education_in_Percent"
names(Education)[2] <- "Gender"

#Checking the data types
str(Education)

#Changing the data types
Education$Year <- as.character(Education$Year)
Education$Year <- as.numeric(Education$Year)

Education$Gender <- as.character(Education$Gender)
Education$Level <- as.character(Education$Level)

Education$Country <- as.character(Education$Country)

Education$Year <- as.character(Education$Year)
Education$Year <- as.numeric(Education$Year)

Education$Education_in_Percent <- as.character(Education$Education_in_Percent)
Education$Education_in_Percent <- as.numeric(Education$Education_in_Percent)

#Checking if Education is a  data frame
is.data.frame(Education)
str(Education)

Education<- Education[!duplicated(Education),]


#Writing the csv to your local directory
write.csv(Education, file = "Education.csv", row.names=FALSE) #na="", col.names=T, sep=",")


#Reading an excel file
GDP_cleaned <- read.csv("C:\\Users\\Abhi\\Desktop\\Project files\\Structured datasets\\GDP per capita_PPS_EUROSTAT.csv", header = F, strip.white = TRUE)

GDP_cleaned <- GDP_cleaned[-c(1,2,4, 5, 6,7, 36:56),] #DeleteRows
GDP_cleaned <- GDP_cleaned[-c(2:11,13,15,17,19,21,23,25)] #DeleteColumns

#Renaming columns
names(GDP_cleaned)[1] <- "Country"
names(GDP_cleaned)[2] <- "2011"
names(GDP_cleaned)[3] <- "2012"
names(GDP_cleaned)[4] <- "2013"
names(GDP_cleaned)[5] <- "2014"
names(GDP_cleaned)[6] <- "2015"
names(GDP_cleaned)[7] <- "2016"
names(GDP_cleaned)[8] <- "2017"

#Removing white space from Country column:
GDP_cleaned$Country <- gsub("[[:space:]]", "", GDP_cleaned$Country)


#names(WHR_New)[3] <- "WHR Score"
GDP_cleaned[29,1] <- "United Kingdom"
GDP_cleaned[4, 1] <- "Czech Republic"
GDP_cleaned <- GDP_cleaned[-c(1),]

names(GDP_cleaned)[1] <- "Country"
names(GDP_cleaned)[2] <- "2011"
names(GDP_cleaned)[3] <- "2012"
names(GDP_cleaned)[4] <- "2013"
names(GDP_cleaned)[5] <- "2014"
names(GDP_cleaned)[6] <- "2015"
names(GDP_cleaned)[7] <- "2016"
names(GDP_cleaned)[8] <- "2017"


#Converting Chr to numeric
str(GDP_cleaned)
GDP_cleaned$'2011' <- as.character(GDP_cleaned$'2011')
GDP_cleaned$`2011` <-  as.numeric(GDP_cleaned$`2011`)

GDP_cleaned$'2012' <- as.character(GDP_cleaned$'2012')
GDP_cleaned$`2012` <-  as.numeric(GDP_cleaned$`2012`)

GDP_cleaned$'2013' <- as.character(GDP_cleaned$'2013')
GDP_cleaned$`2013` <-  as.numeric(GDP_cleaned$`2013`)

GDP_cleaned$'2014' <- as.character(GDP_cleaned$'2014')
GDP_cleaned$`2014` <-  as.numeric(GDP_cleaned$`2014`)

GDP_cleaned$'2015' <- as.character(GDP_cleaned$'2015')
GDP_cleaned$`2015` <-  as.numeric(GDP_cleaned$`2015`)

GDP_cleaned$'2016' <- as.character(GDP_cleaned$'2016')
GDP_cleaned$`2016` <-  as.numeric(GDP_cleaned$`2016`)

GDP_cleaned$'2017' <- as.character(GDP_cleaned$'2017')
GDP_cleaned$`2017` <-  as.numeric(GDP_cleaned$`2017`)

GDP_cleaned<-melt(data=GDP_cleaned, id.vars= "Country" , measure.vars = c("2011","2012","2013","2014","2015","2016","2017"))

names(GDP_cleaned)[2]= "Year"
names(GDP_cleaned)[3]= "GDP Per capita PPS"


#Adding a Region columns 

GDP_cleaned$Region <- rep(" ", nrow(GDP_cleaned))


#Assigning values to the Region columns
Df3 <- GDP_cleaned
Df3[Df3$Country == "Austria", "Region"] <- "Central Europe"
Df3[Df3$Country == "Belgium", "Region"] <- "Southern Europe"
Df3[Df3$Country == "Croatia", "Region"] <- "Southern Europe"
Df3[Df3$Country == "Cyprus", "Region"] <- "Southern Europe"
Df3[Df3$Country == "Czech Republic", "Region"] <- "Central Europe"
Df3[Df3$Country == "Denmark", "Region"] <- "Northern Europe"
Df3[Df3$Country == "Estonia", "Region"] <- "Northern Europe"
Df3[Df3$Country == "Finland", "Region"] <- "Northern Europe"
Df3[Df3$Country == "France", "Region"] <- "Western Europe"
Df3[Df3$Country == "Germany", "Region"] <- "Central Europe"
Df3[Df3$Country == "Greece", "Region"] <- "Southern Europe"
Df3[Df3$Country == "Hungary", "Region"] <- "Central Europe"
Df3[Df3$Country == "Ireland", "Region"] <- "Northern Europe"
Df3[Df3$Country == "Italy", "Region"] <- "Southern Europe"
Df3[Df3$Country == "Latvia", "Region"] <- "Northern Europe"
Df3[Df3$Country == "Lithuania", "Region"] <- "Northern Europe"
Df3[Df3$Country == "Luxembourg", "Region"] <- "Central Europe"
Df3[Df3$Country == "Malta", "Region"] <- "Southern Europe"
Df3[Df3$Country == "Netherlands", "Region"] <- "Western Europe"
Df3[Df3$Country == "Poland", "Region"] <- "Central Europe"
Df3[Df3$Country == "Portugal", "Region"] <- "Southern Europe"
Df3[Df3$Country == "Romania", "Region"] <- "Central Europe"
Df3[Df3$Country == "Slovakia", "Region"] <- "Central Europe"
Df3[Df3$Country == "Slovenia", "Region"] <- "Central Europe"
Df3[Df3$Country == "Spain", "Region"] <- "Southern Europe"
Df3[Df3$Country == "Sweden", "Region"] <- "Northern Europe"
Df3[Df3$Country == "United Kingdom", "Region"] <- "Northern Europe"
Df3[Df3$Country == "Bulgaria", "Region"] <- "Southern Europe"

#Changing the data to the appropriate data type
GDP_cleaned <- Df3
GDP_cleaned$'Year' <- as.character(GDP_cleaned$'Year')
str(GDP_cleaned)
GDP_cleaned$'Year' <- as.numeric(GDP_cleaned$'Year')

GDP_cleaned<- GDP_cleaned[!duplicated(GDP_cleaned),]

#Writing the .csv file to the local directory
write.table(GDP_cleaned, file = "GDP_cleaned.csv",row.names=FALSE, na="", col.names=TRUE, sep=",")

#### Unemployment

#Reading CSV
Unemployment <- read.csv("C:/Users/Abhi/Desktop/Project files/Structured datasets/WEO_Data _Unemployment.csv", header =F, strip.white = T)

Unemployment <- Unemployment[-c(1, 30, 31) ,-c(2, 3, 11)]

colnames(Unemployment) <- c("Country", "2011", "2012", "2013", "2014", "2015", "2016", "2017")

#Setting Country as Year
Unemployment$Country <- as.character(Unemployment$Country)

#Renaming a cell for consistency purposes
Unemployment[24, 1] <- "Slovakia"

Unemployment <-melt(data=Unemployment, id.vars= "Country" , measure.vars = c("2011","2012","2013","2014","2015","2016","2017"))

#Renaming Columns
names(Unemployment)[2] <- "Year"
names(Unemployment)[3] <- "Unemployment_Rate"

#Setting the right data types 
str(Unemployment)
Unemployment$Year <- as.character(Unemployment$Year)
Unemployment$Year <- as.numeric(Unemployment$Year)

#Adding a region column
Unemployment$Region <- rep(" ", nrow(Unemployment))

Df4 <- Unemployment
#Assigning values to the Region as per the geographic location
str(Df4)
Df4[Df4$Country == "Austria", "Region"] <- "Central Europe"
Df4[Df4$Country == "Belgium", "Region"] <- "Southern Europe"
Df4[Df4$Country == "Croatia", "Region"] <- "Southern Europe"
Df4[Df4$Country == "Cyprus", "Region"] <- "Southern Europe"
Df4[Df4$Country == "Czech Republic", "Region"] <- "Central Europe"
Df4[Df4$Country == "Denmark", "Region"] <- "Northern Europe"
Df4[Df4$Country == "Estonia", "Region"] <- "Northern Europe"
Df4[Df4$Country == "Finland", "Region"] <- "Northern Europe"
Df4[Df4$Country == "France", "Region"] <- "Western Europe"
Df4[Df4$Country == "Germany", "Region"] <- "Central Europe"
Df4[Df4$Country == "Greece", "Region"] <- "Southern Europe"
Df4[Df4$Country == "Hungary", "Region"] <- "Central Europe"
Df4[Df4$Country == "Ireland", "Region"] <- "Northern Europe"
Df4[Df4$Country == "Italy", "Region"] <- "Southern Europe"
Df4[Df4$Country == "Latvia", "Region"] <- "Northern Europe"
Df4[Df4$Country == "Lithuania", "Region"] <- "Northern Europe"
Df4[Df4$Country == "Luxembourg", "Region"] <- "Central Europe"
Df4[Df4$Country == "Malta", "Region"] <- "Southern Europe"
Df4[Df4$Country == "Netherlands", "Region"] <- "Western Europe"
Df4[Df4$Country == "Poland", "Region"] <- "Central Europe"
Df4[Df4$Country == "Portugal", "Region"] <- "Southern Europe"
Df4[Df4$Country == "Romania", "Region"] <- "Central Europe"
Df4[Df4$Country == "Slovakia", "Region"] <- "Central Europe"
Df4[Df4$Country == "Slovenia", "Region"] <- "Central Europe"
Df4[Df4$Country == "Spain", "Region"] <- "Southern Europe"
Df4[Df4$Country == "Sweden", "Region"] <- "Northern Europe"
Df4[Df4$Country == "United Kingdom", "Region"] <- "Northern Europe"
Df4[Df4$Country == "Bulgaria", "Region"] <- "Southern Europe"
Unemployment <- Df4

#Removing duplicate rows
Unemployment<- Unemployment[!duplicated(Unemployment),]

#Writing the csv on the working directory

write.table(Unemployment, file = "Unemployment_Rate.csv",row.names=FALSE, na="", col.names=T, sep=",")

#### HDI

#Loading the necessary libraries

#Reading a CSV file
HDI <- read.csv("C:\\Users\\Abhi\\Desktop\\Project files\\Structured datasets\\Human Development Index (HDI)_undp.hdr.csv", header = F, strip.white = TRUE)
HDI <- HDI[c(2, 22, 19, 53, 48, 34, 29, 13, 32, 17, 26, 7, 33, 47, 6, 30, 43, 38, 23, 31, 12, 35, 44, 54, 40, 27, 28, 10, 16),]
HDI <- HDI[-c (3:44, 46, 48, 50, 52, 54, 56)]

#To check and set the required working directory
getwd()
setwd("C:\\Users\\Abhi\\Desktop\\Project files\\Econometrics and the effects of Brexit")

#write.table(HDI, file = "HDI_cleaned.csv",row.names=FALSE, na="", col.names=FALSE, sep=",")
#data <- read.csv("C:\\Users\\Abhi\\Desktop\\Project files\\Econometrics and the effects of Brexit\\HDI_CSV.csv")
#data <- data[-c(1), ]

#write.table(data, file = "HDI_01.csv",row.names=FALSE, na="")

names(HDI)[1] <- "HDI RANK"
names(HDI)[2] <- "Country"
names(HDI)[3] <- "2011"
names(HDI)[4] <- "2012"
names(HDI)[5] <- "2013"
names(HDI)[6] <- "2014"
names(HDI)[7] <- "2015"
names(HDI)[8] <- "2016"
names(HDI)[9] <- "2017"
HDI <- HDI[-c(1),]

str(HDI)

HDI$Country <- as.character(HDI$Country)

HDI[6, 2] <- "Czech Republic"

#Using the melt function
HDI<-melt(data=HDI, id.vars= "Country" , measure.vars = c("2011","2012","2013","2014","2015","2016","2017"))

#Renaming Columns
names(HDI)[2] <- "Year"
names(HDI)[3] <- "HDI Value"
HDI$Country <- as.character(HDI$Country)

#Assigning the right data types
HDI$Year <- as.character(HDI$Year)
HDI$Year <- as.numeric(HDI$Year)
str(HDI)

#Ading a Region Column
HDI$Region <- rep(" ", nrow(HDI))

#Adding values to the Region column
Df <- HDI

Df[Df$Country == "Austria", "Region"] <- "Central Europe"
Df[Df$Country == "Belgium", "Region"] <- "Southern Europe"
Df[Df$Country == "Croatia", "Region"] <- "Southern Europe"
Df[Df$Country == "Cyprus", "Region"] <- "Southern Europe"
Df[Df$Country == "Czech Republic", "Region"] <- "Central Europe"
Df[Df$Country == "Denmark", "Region"] <- "Northern Europe"
Df[Df$Country == "Estonia", "Region"] <- "Northern Europe"
Df[Df$Country == "Finland", "Region"] <- "Northern Europe"
Df[Df$Country == "France", "Region"] <- "Western Europe"
Df[Df$Country == "Germany", "Region"] <- "Central Europe"
Df[Df$Country == "Greece", "Region"] <- "Southern Europe"
Df[Df$Country == "Hungary", "Region"] <- "Central Europe"
Df[Df$Country == "Ireland", "Region"] <- "Northern Europe"
Df[Df$Country == "Italy", "Region"] <- "Southern Europe"
Df[Df$Country == "Latvia", "Region"] <- "Northern Europe"
Df[Df$Country == "Lithuania", "Region"] <- "Northern Europe"
Df[Df$Country == "Luxembourg", "Region"] <- "Central Europe"
Df[Df$Country == "Malta", "Region"] <- "Southern Europe"
Df[Df$Country == "Netherlands", "Region"] <- "Western Europe"
Df[Df$Country == "Poland", "Region"] <- "Central Europe"
Df[Df$Country == "Portugal", "Region"] <- "Southern Europe"
Df[Df$Country == "Romania", "Region"] <- "Central Europe"
Df[Df$Country == "Slovakia", "Region"] <- "Central Europe"
Df[Df$Country == "Slovenia", "Region"] <- "Central Europe"
Df[Df$Country == "Spain", "Region"] <- "Southern Europe"
Df[Df$Country == "Sweden", "Region"] <- "Northern Europe"
Df[Df$Country == "United Kingdom", "Region"] <- "Northern Europe"
Df[Df$Country == "Bulgaria", "Region"] <- "Southern Europe"

str(Df)
HDI_final <- Df


#Writing the csv on the working directory

write.table(HDI_final, file = "HDI_cleaned.csv",row.names=FALSE, na="", col.names=T, sep=",")

####

FDI <- read.csv("C:\\Users\\Abhi\\Desktop\\Project files\\Structured datasets\\FDI.csv", header = F, strip.white =TRUE)

FDI <- FDI [-c(1, 3:10, 12:17, 19:26, 28:42, 46, 48:55, 57:59, 62:64, 66, 68:75, 77:81, 83, 85:94, 96:99, 102:106, 108:121, 123:136, 139, 141:153, 156:159, 161:163, 165:181, 183:191), ] #DeleteRows
FDI <- FDI [-c(3:12, 14, 16, 18, 20, 22, 24, 26)] #DeleteColumns
FDI <- FDI [-c(1)] #DeleteColumns

names(FDI)[1] <- "Country"
names(FDI)[2] <- "2011"
names(FDI)[3] <- "2012"
names(FDI)[4] <- "2013"
names(FDI)[5] <- "2014"
names(FDI)[6] <- "2015"
names(FDI)[7] <- "2016"
names(FDI)[8] <- "2017"
FDI <- FDI[-c(1),]


#Removing white space from Country column:
FDI$Country <- gsub("[[:space:]]", "", FDI$Country)
str(FDI)

FDI$Country <- as.character(FDI$Country)
FDI[28,1] <- "United Kingdom"
FDI[6, 1] <- "Czech Republic"

#Using the melt function 
FDI <- melt(data=FDI, id.vars= "Country" , measure.vars = c("2011","2012","2013","2014","2015","2016","2017"))

#Renaming Columns
names(FDI)[2] ="Year"
names(FDI)[3] ="FDI"

str(FDI)

FDI$Country <- as.character(FDI$Country) #Changing the type of Country column to char

FDI$Year <- as.character(FDI$Year)
FDI$Year <- as.numeric(FDI$Year)

#names(WHR_New)[3] <- "WHR Score"

#GDP_cleaned <- GDP_cleaned[-c(1),]


#Adding a new column
FDI$Region <- rep(" ", nrow(FDI))

Df5 <- FDI
#Adding appropriate values to the Region column
Df5[Df5$Country == "Austria", "Region"] <- "Central Europe"
Df5[Df5$Country == "Belgium", "Region"] <- "Southern Europe"
Df5[Df5$Country == "Croatia", "Region"] <- "Southern Europe"
Df5[Df5$Country == "Cyprus", "Region"] <- "Southern Europe"
Df5[Df5$Country == "Czech Republic", "Region"] <- "Central Europe"
Df5[Df5$Country == "Denmark", "Region"] <- "Northern Europe"
Df5[Df5$Country == "Estonia", "Region"] <- "Northern Europe"
Df5[Df5$Country == "Finland", "Region"] <- "Northern Europe"
Df5[Df5$Country == "France", "Region"] <- "Western Europe"
Df5[Df5$Country == "Germany", "Region"] <- "Central Europe"
Df5[Df5$Country == "Greece", "Region"] <- "Southern Europe"
Df5[Df5$Country == "Hungary", "Region"] <- "Central Europe"
Df5[Df5$Country == "Ireland", "Region"] <- "Northern Europe"
Df5[Df5$Country == "Italy", "Region"] <- "Southern Europe"
Df5[Df5$Country == "Latvia", "Region"] <- "Northern Europe"
Df5[Df5$Country == "Lithuania", "Region"] <- "Northern Europe"
Df5[Df5$Country == "Luxembourg", "Region"] <- "Central Europe"
Df5[Df5$Country == "Malta", "Region"] <- "Southern Europe"
Df5[Df5$Country == "Netherlands", "Region"] <- "Western Europe"
Df5[Df5$Country == "Poland", "Region"] <- "Central Europe"
Df5[Df5$Country == "Portugal", "Region"] <- "Southern Europe"
Df5[Df5$Country == "Romania", "Region"] <- "Central Europe"
Df5[Df5$Country == "Slovakia", "Region"] <- "Central Europe"
Df5[Df5$Country == "Slovenia", "Region"] <- "Central Europe"
Df5[Df5$Country == "Spain", "Region"] <- "Southern Europe"
Df5[Df5$Country == "Sweden", "Region"] <- "Northern Europe"
Df5[Df5$Country == "United Kingdom", "Region"] <- "Northern Europe"
Df5[Df5$Country == "Bulgaria", "Region"] <- "Southern Europe"

FDI <- Df5

#Writing the CSV file to your local directory
write.table(FDI, file = "FDI_cleaned.csv",row.names=FALSE, na="", col.names=T, sep=",")

####Exchange Rate of Euro to Pound

#Loading the dataset from a .xlsx file

Exchange_Rate <- read_excel("C:\\Users\\Abhi\\Desktop\\Project files\\Structured datasets\\euro-to-british-pound-monthly-exchange-rate-2014-2019.xlsx", sheet = 'Data')

#Deleting unnecessary rows

Exchange_Rate <- Exchange_Rate[-c(1, 2),]


#Renaming columns
names(Exchange_Rate)[1] <- "Year"
names(Exchange_Rate)[2] <- "Euro to Pound"

#Keeping the necessary columns
Exchange_Rate <- Exchange_Rate [c(1, 13, 25, 37, 49),]

#Changing December 14 to 2014 and so on
Exchange_Rate$Year <- gsub(".*?'", "20", Exchange_Rate$Year)

#Converting Data to the right data types
#Exchange_Rate$Year <- as.list(Exchange_Rate$Year)
str(Exchange_Rate)
Exchange_Rate$Year <- as.numeric(Exchange_Rate$Year)
Exchange_Rate$`Euro to Pound` <- as.numeric(Exchange_Rate$`Euro to Pound`)


#Adding a country column
Exchange_Rate$Country <- rep("Ireland", nrow(Exchange_Rate))

#Adding a country column
Exchange_Rate$Country <- rep("Ireland", nrow(Exchange_Rate))


str(Exchange_Rate)
#Writing the csv file on the local disk
write.table(Exchange_Rate, file = "Exchange_Rate.csv",row.names=FALSE, na="", col.names=T, sep=",")

#### Trade Balance

#library(readxl)
#Loading the dataset from a .xlsx file

Trade_Balance <- read_excel("C:/Users/Abhi/Desktop/Project files/Structured datasets/trade-balance-of-ireland.xlsx", sheet = 'Data')

#Deleting unnecessary rows

Trade_Balance <-Trade_Balance [-c(1, 2),]


#Renaming columns
names(Trade_Balance)[1] <- "Year"
names(Trade_Balance)[2] <- "Trade_Balance_in_Billion_USD"

#Keeping the necessary columns
Trade_Balance <- Trade_Balance [-c(1:7),]

#Converting Data to the right data types

str(Trade_Balance)
Trade_Balance$Year <- as.numeric(Trade_Balance$Year)
Trade_Balance$Trade_Balance_in_Billion_USD <- as.numeric(Trade_Balance$Trade_Balance_in_Billion_USD)


#Adding a country column
Trade_Balance$Country <- rep("Ireland", nrow(Trade_Balance))

#Writing the csv file on the local disk
write.table(Trade_Balance, file = "Trade_Balance.csv",row.names=FALSE, na="", col.names=T, sep=",")

####WHR

#WHR15

#library(dplyr)

#Reading a csv 
WHR_15 <- read.csv("C://Users//Abhi//Desktop//Project files//Econometrics and the effects of Brexit//World-Happiness-Report-master//2015.csv", header = F, strip.white = TRUE)
WHR_15 <- WHR_15[c(9, 14, 21, 36, 37, 38, 39, 45, 47, 48, 51, 53, 59, 65, 67, 78, 83, 84, 90, 101, 115, 116, 118, 126, 127, 131, 136, 151), c(1, 3, 4, 8, 9)]

#Creating a new row
WHR_15$Year <- rep("2015", nrow(WHR_15))
#str(W18)
#Changing the row names
names(WHR_15)[1] <- "Country"
names(WHR_15)[2] <- "Overall Rank"
names(WHR_15)[3] <- "WHR Score"
names(WHR_15)[4] <- "Healthy life expectancy"
names(WHR_15)[5] <- "Freedom to make life choices"
names(WHR_15)[6] <- "Year"

#Assigning the appropriate data types
#WHR_15$'Overall Rank' <- as.double(WHR_15$'Overall Rank')
#WHR_15$'WHR Score' <- as.numeric(WHR_15$'WHR Score')
#WHR_15$'Healthy life expectancy' <- as.double(WHR_15$'Healthy life expectancy')
#WHR_15$'Healthy life expectancy' <- as.double(WHR_15$'Healthy life expectancy')
#WHR_15$'Freedom to make life choices' <- as.double(WHR_15$'Freedom to make life choices')

WHR_15 <- WHR_15[,c(6, 1, 2, 3, 4, 5)]

#WHR16

#library(dplyr)
WHR_16 <- read.csv("C://Users//Abhi//Desktop//Project files//Econometrics and the effects of Brexit//World-Happiness-Report-master//2016.csv", header = F, strip.white = TRUE)
WHR_16 <- WHR_16[c(9, 14, 22, 36, 37, 38, 39, 44, 46, 47, 50, 52, 58, 64, 66, 77, 81, 82, 88, 99, 112, 113, 116, 124, 125, 131, 135, 150), c(1, 3, 4, 9, 10)]

#Creating a new column
WHR_16$Year <- rep("2016", nrow(WHR_16))

#Assigning names to various columns
names(WHR_16)[1] <- "Country"
names(WHR_16)[2] <- "Overall Rank"
names(WHR_16)[3] <- "WHR Score"
names(WHR_16)[4] <- "Healthy life expectancy"
names(WHR_16)[5] <- "Freedom to make life choices"
names(WHR_16)[6] <- "Year"
str(WHR_16)
#Changing the data to appropriate data types
#WHR_16$'Overall Rank' <- as.character(as.numeric(WHR_16$'Overall Rank'))
#WHR_16$'WHR Score' <- as.numeric(WHR_16$'WHR Score')
#WHR_16$'Healthy life expectancy' <- as.character(as.numeric(WHR_16$'Healthy life expectancy'))
#WHR_16$'Healthy life expectancy' <- as.character(as.numeric(WHR_16$'Healthy life expectancy'))
#WHR_16$'Freedom to make life choices' <- as.character(as.numeric(WHR_16$'Freedom to make life choices'))


WHR_16 <- WHR_16[,c(6, 1, 2, 3, 4, 5)]

#library(htmltab)
WHR <- as.data.frame(htmltab(doc = "https://en.wikipedia.org/wiki/World_Happiness_Report", which=5))
#library(dplyr)

########Adding WHR_New dataframe to remove white space from Country/Region column:#########

#library('readxl')

WHR_New <- WHR
WHR_New <- WHR [c(12, 16, 100, 82, 61, 21, 3, 63, 1, 23, 16, 79, 69, 14, 47,53, 50, 17, 22, 6, 42, 77, 52, 39, 51, 36, 9, 19),]
is.character(WHR_New$`Country/Region`)

#Change the column names of Country/Region to Country:
names(WHR_New)[2] <- "Country"
str(WHR_New)

#Remove extra character from the Country column:
WHR_New$Country <- trimws(gsub("Â", " ", WHR_New$Country))

#Removing white space from Country column#
WHR_New$Country <- gsub("[[:space:]]", "", WHR_New$Country)

str(WHR_New)

#WHR_New$'Overall Rank' <- as.numeric(WHR_New$'Overall Rank')
#WHR_New$'Score' <- as.numeric(WHR_New$'Score')
#WHR_New$'GDP per capita' <- as.numeric(WHR_New$'GDP per capita')
#WHR_New$'Social support' <- as.numeric(WHR_New$'Social support')
#WHR_New$'Healthy life expectancy' <- as.numeric(WHR_New$'Healthy life expectancy')
#WHR_New$'Freedom to make life choices' <- as.numeric(WHR_New$'Freedom to make life choices')
#WHR_New$'Generosity' <- as.numeric(WHR_New$'Generosity')
#WHR_New$'Perceptions of corruption' <- as.numeric(WHR_New$'Perceptions of corruption')

names(WHR_New)[3] <- "WHR Score"
WHR_New[28,2] <- "United Kingdom"
WHR_New[6, 2] <- "Czech Republic"

WHR_New[WHR_New$Country == "Austria", "Region"] <- "Central Europe"
WHR_New[WHR_New$Country == "Belgium", "Region"] <- "Southern Europe"
WHR_New[WHR_New$Country == "Croatia", "Region"] <- "Southern Europe"
WHR_New[WHR_New$Country == "Cyprus", "Region"] <- "Southern Europe"
WHR_New[WHR_New$Country == "Czech Republic", "Region"] <- "Central Europe"
WHR_New[WHR_New$Country == "Denmark", "Region"] <- "Northern Europe"
WHR_New[WHR_New$Country == "Estonia", "Region"] <- "Northern Europe"
WHR_New[WHR_New$Country == "Finland", "Region"] <- "Northern Europe"
WHR_New[WHR_New$Country == "France", "Region"] <- "Western Europe"
WHR_New[WHR_New$Country == "Germany", "Region"] <- "Central Europe"
WHR_New[WHR_New$Country == "Greece", "Region"] <- "Southern Europe"
WHR_New[WHR_New$Country == "Hungary", "Region"] <- "Central Europe"
WHR_New[WHR_New$Country == "Ireland", "Region"] <- "Northern Europe"
WHR_New[WHR_New$Country == "Italy", "Region"] <- "Southern Europe"
WHR_New[WHR_New$Country == "Latvia", "Region"] <- "Northern Europe"
WHR_New[WHR_New$Country == "Lithuania", "Region"] <- "Northern Europe"
WHR_New[WHR_New$Country == "Luxembourg", "Region"] <- "Central Europe"
WHR_New[WHR_New$Country == "Malta", "Region"] <- "Southern Europe"
WHR_New[WHR_New$Country == "Netherlands", "Region"] <- "Western Europe"
WHR_New[WHR_New$Country == "Poland", "Region"] <- "Central Europe"
WHR_New[WHR_New$Country == "Portugal", "Region"] <- "Southern Euarope"
WHR_New[WHR_New$Country == "Romania", "Region"] <- "Central Europe"
WHR_New[WHR_New$Country == "Slovakia", "Region"] <- "Central Europe"
WHR_New[WHR_New$Country == "Slovenia", "Region"] <- "Central Europe"
WHR_New[WHR_New$Country == "Spain", "Region"] <- "Southern Europe"
WHR_New[WHR_New$Country == "Sweden", "Region"] <- "Northern Europe"
WHR_New[WHR_New$Country == "United Kingdom", "Region"] <- "Northern Europe"
WHR_New[WHR_New$Country == "Bulgaria", "Region"] <- "Southern Europe"

WHR_New$Year <- rep("2018", nrow(WHR_New))

WHR_New <- WHR_New[, c(11, 2, 1, 3, 6, 7)]


#Write the file in csv format:
write.csv(WHR_New, file = "WHR_New.csv", row.names = F)


#WHR final 
#WHR_2017


WHR_17 <- as.data.frame(htmltab(doc = "https://en.wikipedia.org/wiki/World_Happiness_Report", which=7))


#Change the column names of Country/Region to Country:
names(WHR_17)[3] <- "Country"
str(WHR_17)

#Remove extra character from the Country column:
WHR_17$Country <- trimws(gsub("Â", "", WHR_17$Country))


#WHR_17$Country <- trimws(WHR_17$Country, which = c("left"))#

#Removing white space from Country column#
WHR_17$Country <- gsub("[[:space:]]", "", WHR_17$Country)

#Deleting unnecessary rows and columns

WHR_17 <- WHR_17[c(1, 2, 5, 6, 10, 13, 15, 16, 17, 18, 19, 23, 27, 31, 34, 40, 47, 49, 53, 55, 58, 63, 66, 76, 79, 89, 91, 108, 109), c(1, 3,4, 8, 9)]
WHR_17 <- WHR_17[-c(29),]

#Converting to the right data type
WHR_17$'Overall Rank' <- as.numeric(WHR_17$'Overall Rank')
WHR_17$'Score' <- as.numeric(WHR_17$'Score')
#WHR_17$'GDP per capita' <- as.numeric(WHR_17$'GDP per capita')
#WHR_17$'Social support' <- as.numeric(WHR_17$'Social support')
WHR_17$'Healthy life expectancy' <- as.numeric(WHR_17$'Healthy life expectancy')
WHR_17$'Freedom to make life choices' <- as.numeric(WHR_17$'Freedom to make life choices')
#WHR_17$'Generosity' <- as.numeric(WHR_17$'Generosity')
#WHR_17$'Perceptions of corruption' <- as.numeric(WHR_17$'Perceptions of corruption')

#Adding a year row
WHR_17$Year <- rep("2017", nrow(WHR_17))
names(WHR_17)[3] <- "WHR Score"

#Reordering the columns
WHR_17 <- WHR_17[,c(6, 1, 2, 3, 4, 5)]

#Renaming cells on R
WHR_17[11, 3] <- "United Kingdom"
WHR_17[12, 3] <- "Czech Republic"

#ASsigning the different objects to W values
W17 <- WHR_17
W17 <- W17[,c(1,3,2,4,5,6)]
W18 <- WHR_New
W16 <- WHR_16
W15 <- WHR_15

#binding rows
W <- merge(W17,W18,all=T)
W <- merge(W,W16,all = T)
W <- merge(W,W15,all = T)


WHR_final <- W
#Writing the cleaned file to a csv
write.table(WHR_final, file = "WHR_final.csv", row.names=FALSE, na="", col.names=T, sep=",")
