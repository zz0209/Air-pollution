dfstest <- vector()     #####take average of each city (CO)
store <- vector()
for (i in 1:ncol(dataframes[[1]])){      
  for (j in 1:length(dataframes)){
    #if (!j == 59 && !j == 60){
    store[j] <- dataframes[[j]][14,i]        ## change the '1' if want another pollutant ~~~~~~~~~~~~~
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

csvlist2014 <- as.list(dfstest[determcsv])   #csv有用数据list
xlslist2014 <- numdata2014[determbig]   #xls有用数据list---vector
xlslist2015[["台州"]]
csvlist2015[["上海"]]


newxlslist2014 <- list()
for (i in 1:length(csvlist2014)){  #排序xls数据
  newxlslist2014[i] <- xlslist2014[[names(csvlist2014)[i]]]
}
newxlslist2014  #和csv城市顺序一样的xlsGDP数据

newxlslist2014 <- as.numeric(newxlslist2014)  #newxlslist2014转变为numeric
newxlslist2014

length(newxlslist2014)
length(dfstest[determcsv])

newxlslist2014_sim <- newxlslist2014*1e-9

#plot(newxlslist2016_sim,dfstest[determcsv])  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class(newxlslist2014_sim)

class(dfstest[determcsv])
#lm2016AQI <- lm(newxlslist2016_sim~dfstest[determcsv])  #~~~~~~~~~~~~~~~~AQI2016
lm2014CO <- lm(dfstest[determcsv]~newxlslist2014_sim)  #~~~~~~~~~~~~~~~~CO 2014

summary(lm2014CO)
lm2014CO


x <- c(0:1000)
y <- x * -0.0003342 + 1.2266557

ggplot(data = NULL, aes(x = newxlslist2014_sim, y = dfstest[determcsv])) +  #开始绘图
  geom_point(color = "darkred") +
  #ggplot(data = NULL, aes(x = x, y = y)) +
  geom_line(data = NULL, aes(x = x, y = y), color = "darkred")

