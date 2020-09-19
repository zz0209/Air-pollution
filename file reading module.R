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
unlist(dataframes[[320]][1,])
names(dataframes[[320]][1,])
dfstest <- as.numeric(as.character(unlist(dataframes[[320]][1,])))
dfstest <- as.character(unlist(dataframes[[320]][1,]))
class(dfstest)
dfstest
#


