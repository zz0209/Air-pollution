
########### take average

dfstest <- vector()     #####take average of each city (PM2.5)
store <- vector()
for (i in 1:ncol(dataframes[[1]])){      
  for (j in 1:length(dataframes)){
    if (!j == 61){
      store[j] <- dataframes[[j]][2,i]        ## change the '1' if want another pollutant ~~~~~~~~~~~~~
    }
  }
  dfstest[i] <- mean(na.omit(store))
}


dfstest <- as.numeric(as.character(unlist(dfstest)))
class(dfstest)
names(dfstest) <- names(dataframes[[320]][1,])
dfstest  # 已被更改为PM2.5数据

########


determcsv <- names(dfstest) %in% names(numdata2016)
determcsv
length(dfstest[determcsv])
dfstest[determcsv]  #csv pollution 有用的

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

#plot(newxlslist2016_sim,dfstest[determcsv])  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class(newxlslist2016_sim)

class(dfstest[determcsv])
#lm2016AQI <- lm(newxlslist2016_sim~dfstest[determcsv])  #~~~~~~~~~~~~~~~~AQI2016
lm2016PM2 <- lm(dfstest[determcsv]~newxlslist2016_sim)  #~~~~~~~~~~~~~~~~AQI2016

summary(lm2016PM2)
lm2016PM2

#####尝试制作dataframe进行ggplot####xxx

lm(newxlslist2016_sim~dfstest[determcsv])

x <- c(0:1000)
y <- x * 0.019 + 49.261

ggplot(data = NULL, aes(x = newxlslist2016_sim, y = dfstest[determcsv])) +  #开始绘图
  geom_point(color = "darkred") +
  #ggplot(data = NULL, aes(x = x, y = y)) +
  geom_line(data = NULL, aes(x = x, y = y), color = "darkred")

citation("ggplot2")



################## 2015 GDP vs 2016 PM2.5  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

## combining 2015 GDP
usedata2015 <- combin(data2015) #checking
usedata2015[c(1:20),]

## eliminating the sufixes

usedata2015
elimdusedata2015 <- elim(usedata2015)

## eliminating the atonomous states

elimsusedata2015 <- elims(elimdusedata2015)
elimsusedata2015
elimsusedata2016

## assigning name attributes

numdata2015 <- as.data.frame(lapply(elimsusedata2015[,5],as.numeric))
chrdata2015 <- as.data.frame(lapply(elimsusedata2015[,1],as.character))
numdata2015
chrdata2015

chrdata2015 <- as.character(unlist(chrdata2015))

class(chrdata2015)#checking
numdata2015 <- as.numeric(as.character(unlist(numdata2015)))
class(numdata2015)#checking
numdata2015
chrdata2015

length(chrdata2015)
length(numdata2015)

names(numdata2015) <- chrdata2015 #naming
numdata2015


####~~~~_____------     记住 xls用2015！！！！！

########


determcsv <- names(dfstest) %in% names(numdata2015)
determcsv
#determcsv <- names(dfstest) %in% names(numdata2016)
determbig <- names(numdata2015) %in% names(dfstest)
names(dfstest)

length(dfstest[determcsv])
dfstest[determcsv]  #csv pollution

###
names(dfstest[determcsv]) %in% names(numdata2015)
names(dfstest[determcsv]) %in% names(xlslist2015)
###

#library(ggplot2)
#ggplot(GDPpollution,aes(x=numdata2014[determbig],y=dfstest[determcsv]))+geom_point()

#plot(x=numdata2014[determbig],y=dfstest[determcsv])

csvlist2016 <- as.list(dfstest[determcsv])   #csv有用数据list
xlslist2015 <- numdata2015[determbig]   #xls有用数据list---vector
length(xlslist2015)
xlslist2015
xlslist2015[["宿迁"]]
csvlist2016[["上海"]]


newxlslist2015 <- list()
for (i in 1:length(csvlist2016)){  #排序xls数据
  newxlslist2015[i] <- xlslist2015[[names(csvlist2016)[i]]]  ##下标出界 ？？？？？？？？？？？？？？？？？~~~~~！
}
newxlslist2015  #和csv城市顺序一样的xlsGDP数据

#
xlslist2015[[names(csvlist2016)[13]]]    ## 问题：为什么xlslist2015的GDP文件里面没有处理过的空气污染csvlist2016中的很多城市
                                            
#

newxlslist2015 <- as.numeric(newxlslist2015)  #newxlslist2015转变为numeric
newxlslist2015
newxlslist2016

length(newxlslist2015)
length(dfstest[determcsv])

newxlslist2015_sim <- newxlslist2015*1e-9

#plot(newxlslist2016_sim,dfstest[determcsv])  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class(newxlslist2015_sim)

class(dfstest[determcsv])
#lm2016AQI <- lm(newxlslist2016_sim~dfstest[determcsv])  #~~~~~~~~~~~~~~~~PM2.5  2016
lm2015PM2 <- lm(dfstest[determcsv]~newxlslist2015_sim)  #~~~~~~~~~~~~~~~~PM2.5  2016

summary(lm2016PM2)
lm2015PM2
lm2016PM2

#####尝试制作dataframe进行ggplot####xxx

#lm(newxlslist2016_sim~dfstest[determcsv])

x <- c(0:1000)
y <- x * 0.01904 + 49.6395

ggplot(data = NULL, aes(x = newxlslist2015_sim, y = dfstest[determcsv])) +  #开始绘图
  geom_point(color = "darkred") +
  #ggplot(data = NULL, aes(x = x, y = y)) +
  geom_line(data = NULL, aes(x = x, y = y), color = "darkred")
  
  citation("ggplot2")
