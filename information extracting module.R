#install.packages("xlsx")
#library(xlsx)
#a <- read.xlsx("~/Desktop/课外活动/科研项目/论文项目/数据/区县层面数据库/str_area_cnt_e0.xlsx", sheetIndex = 1)

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

##extracting the columns
datacol <- data[,c(3,4,5,12,21)]
datacol[c(1:16),]
class(datacol)

##modify the data, scale

###scaling population
datacol$totalpopulation <- datacol$totalpopulation * 10000

###scaling gdp
datacol$gdp <- datacol$gdp * 10000

