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


determbig <- names(numdata2014) %in% names(dfstest)
determbig
length(numdata2014[determbig])  
numdata2014[determbig]  #xls gdp
#names(numdata2014[determ]) %in% names(dfstest)

determcsv <- names(dfstest) %in% names(numdata2014)
determcsv
length(dfstest[determcsv])
dfstest[determcsv]  #csv pollution

#library(ggplot2)
#ggplot(GDPpollution,aes(x=numdata2014[determbig],y=dfstest[determcsv]))+geom_point()

#plot(x=numdata2014[determbig],y=dfstest[determcsv])

csvlist201401 <- as.list(dfstest[determcsv])   #csv有用数据list
xlslist2014 <- as.list(numdata2014[determbig])   #xls有用数据list
xlslist2014[["上海"]]
csvlist201401[["上海"]]


newxlslist2014 <- list()
for (i in 1:length(csvlist201401)){  #排序xls数据
  newxlslist2014[i] <- xlslist2014[[names(csvlist201401)[i]]]
}
newxlslist2014  #和csv城市顺序一样的xlsGDP数据

plot(newxlslist2014,dfstest[determcsv])

