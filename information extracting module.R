#install.packages("xlsx")
#library(xlsx)
#a <- read.xlsx("~/Desktop/课外活动/科研项目/论文项目/数据/区县层面数据库/str_area_cnt_e0.xlsx", sheetIndex = 1)

######first using Microsoft Office Excel to arrange the data by cityname such that data for the same city goes together

options(max.print = 1000000)

#extracting the useful information

##installing readxl
#install.packages("readxl")
library(readxl)

##reading the GDP file
data = read_excel("~/Desktop/课外活动/科研项目/论文项目/数据/区县层面数据库/str_area_cnt_e0.xlsx",sheet = 1) 

nrow(data) #check if read fully
data[32372,]
class(data)
data

##extracting the columns
datacol <- data[,c(3,4,5,12,21)]
datacol[c(1:16),]
class(datacol)

##modify the data, scale

###scaling population
datacol$totalpopulation <- datacol$totalpopulation * 10000

###scaling gdp
datacol$gdp <- datacol$gdp * 10000

##extracting the rows 2014~2016
datarow <- split(datacol, datacol$year, drop = F)

data2014 <- datarow$`2014`
data2015 <- datarow$`2015`
data2016 <- datarow$`2016`

data2015

#combining the GDP
combin <- function(df){
  dfc <- df
  dfcount <- vector()
  for (i in 2:(nrow(df))){
    if (dfc[i,1] == dfc[i-1,1]){
      dfc[i,5] <- dfc[i,5] + dfc[i-1,5]
      dfcount <- c(dfcount, i-1)
    }
  }
  dfc[-dfcount,]
}

usedata2014 <- combin(data2014) #checking
usedata2014[c(1:20),]

#matching the data of the two forms

##eliminating the suffixes      ##############要加县级！！
elim <- function(df){
  for (i in 1:(nrow(df))){
    df[i,1] <- sub("市$","",df[i,1])
    df[i,1] <- sub("地区$","",df[i,1])
    df[i,1] <- sub("盟$","",df[i,1])
    df[i,1] <- sub("自治州$","",df[i,1])
    if (df[i,1] == "省直辖县级行政单位"){
      df[i,1] <- sub("市$","",df[i,2])
      df[i,1] <- sub("自治县$","",df[i,2])
      df[i,1] <- sub("自治州$","",df[i,2])
      df[i,1] <- sub("林区$","",df[i,2])
      df[i,1] <- sub("县$","",df[i,2])
    } else if (df[i,1] == "自治区直辖县级行政单位"){
      df[i,1] <- sub("市$","",df[i,2])
      df[i,1] <- sub("自治县$","",df[i,2])
      df[i,1] <- sub("自治州$","",df[i,2])
      df[i,1] <- sub("林区$","",df[i,2])
      df[i,1] <- sub("县$","",df[i,2])
      df[i,1] <- sub("市$","",df[i,2])
    }
  }
  df
}

usedata2014
elimdusedata2014 <- elim(usedata2014)

##eliminating the atonomous states
elims <- function(df){
  dfcount <- vector()
  for (i in 1:(nrow(df))){
    if (grepl("族$",df[i,1])){
      dfcount <- c(dfcount,i)
    }
  }
  df[-dfcount,]
}

elimsusedata2014 <- elims(elimdusedata2014)
elimsusedata2014

##deleting the cities that are not in the csv

###assigning name attributes
numdata2014 <- as.data.frame(lapply(elimsusedata2014[,5],as.numeric))
chrdata2014 <- as.data.frame(lapply(elimsusedata2014[,1],as.character))
numdata2014
chrdata2014

chrdata2014 <- as.character(unlist(chrdata2014))
class(chrdata2014)#checking
numdata2014 <- as.numeric(as.character(unlist(numdata2014)))
class(numdata2014)#checking
numdata2014
chrdata2014

length(chrdata2014)
length(numdata2014)

names(numdata2014) <- chrdata2014 #naming
numdata2014


