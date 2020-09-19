#reading the files from the directory "城市_20160101-20161231"
options(max.print=1000000)

##generating a vector of directories
dict_str <- vector()

for (i in 1:(length(name_str))){
  dict_str[i] <- paste("~/Desktop/课外活动/科研项目/论文项目/数据/PM2.5浓度数据/全国空气质量/城市_20160101-20161231/", name_str[i], sep = "")
}

dict_str

##reading and recording the data
dataframes <- list()

for (i in 1:(length(name_str))){
  if (!dict_str[i] == "~/Desktop/课外活动/科研项目/论文项目/数据/PM2.5浓度数据/全国空气质量/城市_20160101-20161231/china_cities_20160230.csv"){
    dataframes[i] <- list(read.csv(dict_str[i]))[1]
  }
}

class(dataframes[[1]])
dataframes[[320]][1,]
#unlist(dataframes[[320]][1,])
names(dataframes[[320]][1,])
#dfstest <- as.numeric(as.character(unlist(dataframes[[320]][1,])))
dfstest <- as.character(unlist(dataframes[[320]][1,]))
class(dfstest)
names(dfstest) <- names(dataframes[[320]][1,])
dfstest
#


determbig <- names(numdata2016) %in% names(dfstest)
determbig
length(numdata2016[determbig])  
numdata2016[determbig]  #xls gdp
#names(numdata2014[determ]) %in% names(dfstest)

determcsv <- names(dfstest) %in% names(numdata2016)
determcsv
length(dfstest[determcsv])
dfstest[determcsv]  #csv pollution

#library(ggplot2)
#ggplot(GDPpollution,aes(x=numdata2014[determbig],y=dfstest[determcsv]))+geom_point()

#plot(x=numdata2014[determbig],y=dfstest[determcsv])

csvlist201601 <- as.list(dfstest[determcsv])   #csv有用数据list
xlslist2016 <- as.list(numdata2016[determbig])   #xls有用数据list
xlslist2016[["台州"]]
csvlist201601[["上海"]]


newxlslist2016 <- list()
for (i in 1:length(csvlist201601)){  #排序xls数据
  newxlslist2016[i] <- xlslist2016[[names(csvlist201601)[i]]]
}
newxlslist2016  #和csv城市顺序一样的xlsGDP数据
length(newxlslist2016)

plot(newxlslist2016,dfstest[determcsv])

