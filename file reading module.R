#reading the files from the directory "城市_20150101-20141231"
options(max.print=1000000)

##generating a vector of directories
dict_str <- vector()

for (i in 1:(length(name_str))){
  dict_str[i] <- paste("~/Desktop/课外活动/科研项目/论文项目/数据/PM2.5浓度数据/全国空气质量/城市_20150101-20141231/", name_str[i], sep = "")
}

dict_str


a <- read.csv("~/Desktop/课外活动/科研项目/论文项目/数据/PM2.5浓度数据/全国空气质量/城市_20150101-20141231/china_cities_20150102.csv")
a

setwd("/Lexar/研究空气污染/论文项目/PM2.5浓度数据/全国空气质量/城市_20150101-20141231")
