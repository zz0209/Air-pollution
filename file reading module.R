#reading the files from the directory "城市_20160101-20161231"
options(max.print = 1000000)

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


##########
names(dataframes[[320]][1,]) == names(dataframes[[2]][1,])  #cheking if names are matching
############

dfstest <- vector()     #####take average of each city (AQI)
store <- vector()
for (i in 1:ncol(dataframes[[1]])){
  for (j in 1:length(dataframes)){
    if (!j == 61){
      store[j] <- dataframes[[j]][1,i]        #~~~~~~~~~~~~~
    }
  }
  dfstest[i] <- mean(na.omit(store))
}



dfstest <- as.numeric(as.character(unlist(dfstest)))
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

csvlist2016 <- as.list(dfstest[determcsv])   #csv有用数据list
xlslist2016 <- numdata2016[determbig]   #xls有用数据list---vector
xlslist2016[["台州"]]
csvlist2016[["上海"]]


newxlslist2016 <- list()
for (i in 1:length(csvlist2016)){  #排序xls数据
  newxlslist2016[i] <- xlslist2016[[names(csvlist2016)[i]]]
}
newxlslist2016  #和csv城市顺序一样的xlsGDP数据

newxlslist2016 <- as.numeric(newxlslist2016)  #newxlslist2016转变为numeric
newxlslist2016

length(newxlslist2016)
length(dfstest[determcsv])

newxlslist2016_sim <- newxlslist2016*1e-9

plot(newxlslist2016_sim,dfstest[determcsv])

class(newxlslist2016_sim)

class(dfstest[determcsv])
lm2016AQI <- lm(newxlslist2016_sim~dfstest[determcsv])  #~~~~~~~~~~~~~~~~AQI2016
lm2016AQI <- lm(dfstest[determcsv]~newxlslist2016_sim)  #~~~~~~~~~~~~~~~~AQI2016

summary(lm2016AQI)
lm2016AQI

#Sys.setenv(R_MAX_VSIZE = 16e9)
Sys.setenv('R_MAX_VSIZE'=32000000000)

#lines(x = dfstest[determcsv], y = dfstest[determcsv]*6.919e+08 + 8.117e+10)
#abline()
#abline(h = 1)
#abline(b,c)

library("ggplot2")



df <- data.frame(x = 0:1000, y = x*0.05043 + 177.31916)

x <- 0:1000
y <- x*0.05043 + 177.31916


  
ggplot(df, mapping = aes(x = x, y = y)) + geom_point(color = "darkred")
lines(x,y,type='l')
