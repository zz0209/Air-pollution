#reading the files from the directory "城市_20160101-20161231"
options(max.print = 1000000)

##generating a vector of directories
dict_str <- vector()

for (i in 1:(length(name_str))){
  dict_str[i] <- paste("~/Desktop/课外活动/科研项目/论文项目/数据/PM2.5浓度数据/全国空气质量/城市_20140513-20141231/", name_str[i], sep = "")
}

dict_str   ## is a list of directories

##reading and recording the data
dataframes <- list()

#if(FALSE){  ##段注释
for (i in 1:(length(name_str))){
  #if (!dict_str[i] == "~/Desktop/课外活动/科研项目/论文项目/数据/PM2.5浓度数据/全国空气质量/城市_20140513-20141231/china_cities_2014.csv"){
  #  if(!dict_str[i] == "~/Desktop/课外活动/科研项目/论文项目/数据/PM2.5浓度数据/全国空气质量/城市_20140513-20141231/china_cities_20150230.csv"){
      dataframes[i] <- list(read.csv(dict_str[i]))[1]
  #  }
  #}
}
#}

dataframes    ## is a list of csv dataframes
class(dataframes[[1]])
dataframes[[200]][1,]
#unlist(dataframes[[320]][1,])
names(dataframes[[200]][1,])
#dfstest <- as.numeric(as.character(unlist(dataframes[[320]][1,])))


########## 
names(dataframes[[200]][1,]) == names(dataframes[[2]][1,])  #cheking if names are matching
############   这之前一直和污染物种类没有关系

dfstest <- vector()     #####take average of each city (AQI)
store <- vector()
for (i in 1:ncol(dataframes[[1]])){      
  for (j in 1:length(dataframes)){
    #if (!j == 59 && !j == 60){
      store[j] <- dataframes[[j]][1,i]        ## change the '1' if want another pollutant ~~~~~~~~~~~~~
    #}
  }
  dfstest[i] <- mean(na.omit(store))
}

#store

dfstest <- as.numeric(as.character(unlist(dfstest)))
class(dfstest)
names(dfstest) <- names(dataframes[[200]][1,])
dfstest
#



determbig <- names(numdata2014) %in% names(dfstest)
determbig
length(numdata2016[determbig])  
numdata2016[determbig]  #xls gdp
#names(numdata2014[determ]) %in% names(dfstest)

determcsv <- names(dfstest) %in% names(numdata2014)
determcsv
length(dfstest[determcsv])
dfstest[determcsv]  #csv pollution

#library(ggplot2)
#ggplot(GDPpollution,aes(x=numdata2014[determbig],y=dfstest[determcsv]))+geom_point()

#plot(x=numdata2014[determbig],y=dfstest[determcsv])

csvlist2014 <- as.list(dfstest[determcsv])   #csv有用数据list
xlslist2014 <- numdata2014[determbig]   #xls有用数据list---vector
xlslist2014[["台州"]]
csvlist2014[["上海"]]


newxlslist2014 <- list()
for (i in 1:length(csvlist2014)){  #排序xls数据
  #if (!i == 37){
    newxlslist2014[i] <- xlslist2014[[names(csvlist2014)[i]]]
  #}
}
newxlslist2014  #和csv城市顺序一样的xlsGDP数据

newxlslist2014 <- as.numeric(newxlslist2014)  #newxlslist2016转变为numeric
newxlslist2014

length(newxlslist2015)
length(dfstest[determcsv])
length(names(csvlist2014))
names(csvlist2014)[37]
xlslist2014[["绍兴"]]
xlslist2014


newxlslist2014_sim <- newxlslist2014*1e-9

#plot(newxlslist2016_sim,dfstest[determcsv])  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class(newxlslist2014_sim)

class(dfstest[determcsv])
#lm2016AQI <- lm(newxlslist2016_sim~dfstest[determcsv])  #~~~~~~~~~~~~~~~~AQI2016
lm2014AQI <- lm(dfstest[determcsv]~newxlslist2014_sim)  #~~~~~~~~~~~~~~~~AQI2016

summary(lm2014AQI)
lm2014AQI
#abline(lm2016AQI)





#################################


#Sys.setenv(R_MAX_VSIZE = 16e9)
#Sys.setenv('R_MAX_VSIZE'=32000000000)

#lines(x = dfstest[determcsv], y = dfstest[determcsv]*6.919e+08 + 8.117e+10)
#abline()
#abline(h = 1)
#abline(b,c)

library("ggplot2")


