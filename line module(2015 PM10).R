dfstest <- vector()     #####take average of each city (AQI)
store <- vector()
for (i in 1:ncol(dataframes[[1]])){      
  for (j in 1:length(dataframes)){
    if (!j == 59 && !j == 60){
      store[j] <- dataframes[[j]][4,i]        ## change the '1' if want another pollutant ~~~~~~~~~~~~~
    }
  }
  dfstest[i] <- mean(na.omit(store))
}

#store

dfstest <- as.numeric(as.character(unlist(dfstest)))
class(dfstest)
names(dfstest) <- names(dataframes[[320]][1,])
dfstest
#



determbig <- names(numdata2015) %in% names(dfstest)
determbig
length(numdata2016[determbig])  
numdata2016[determbig]  #xls gdp
#names(numdata2014[determ]) %in% names(dfstest)

determcsv <- names(dfstest) %in% names(numdata2015)
determcsv
length(dfstest[determcsv])
dfstest[determcsv]  #csv pollution

#library(ggplot2)
#ggplot(GDPpollution,aes(x=numdata2014[determbig],y=dfstest[determcsv]))+geom_point()

#plot(x=numdata2014[determbig],y=dfstest[determcsv])

csvlist2015 <- as.list(dfstest[determcsv])   #csv有用数据list
xlslist2015 <- numdata2015[determbig]   #xls有用数据list---vector
xlslist2015[["台州"]]
csvlist2015[["上海"]]


newxlslist2015 <- list()
for (i in 1:length(csvlist2015)){  #排序xls数据
  newxlslist2015[i] <- xlslist2015[[names(csvlist2015)[i]]]
}
newxlslist2015  #和csv城市顺序一样的xlsGDP数据

newxlslist2015 <- as.numeric(newxlslist2015)  #newxlslist2016转变为numeric
newxlslist2015

length(newxlslist2015)
length(dfstest[determcsv])

newxlslist2015_sim <- newxlslist2015*1e-9

#plot(newxlslist2016_sim,dfstest[determcsv])  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class(newxlslist2015_sim)

class(dfstest[determcsv])
#lm2016AQI <- lm(newxlslist2016_sim~dfstest[determcsv])  #~~~~~~~~~~~~~~~~AQI2016
lm2015PM10 <- lm(dfstest[determcsv]~newxlslist2015_sim)  #~~~~~~~~~~~~~~~~PM10 2015

summary(lm2015PM2)
lm2015PM10


x <- c(0:1000)
y <- x * 0.03124 + 90.03757

ggplot(data = NULL, aes(x = newxlslist2015_sim, y = dfstest[determcsv])) +  #开始绘图
  geom_point(color = "darkred") +
  #ggplot(data = NULL, aes(x = x, y = y)) +
  geom_line(data = NULL, aes(x = x, y = y), color = "darkred")

