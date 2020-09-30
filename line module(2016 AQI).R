#####尝试制作dataframe进行ggplot####xxx

lm(newxlslist2016_sim~dfstest[determcsv])

x <- c(0:1000)
y <- x * 0.01641 + 75.43454

ggplot(data = NULL, aes(x = newxlslist2016_sim, y = dfstest[determcsv])) +  #开始绘图
  geom_point(color = "darkred") +
  #ggplot(data = NULL, aes(x = x, y = y)) +
  geom_line(data = NULL, aes(x = x, y = y), color = "darkred")

citation("ggplot2")
