


#####尝试制作dataframe进行ggplot####xxx

ggplot(data = NULL, aes(x = newxlslist2016_sim, y = dfstest[determcsv])) +  #开始绘图
  geom_point(color = "darkred") +
  #ggplot(data = NULL, aes(x = x, y = y)) +
  geom_line(data = NULL, aes(x = x, y = y), color = "darkred")

x <- c(3:40)
y <- x * 1.43454 + 0.01641

ggplot(data = NULL, aes(x = x, y = y)) +
  geom_abline(color = "darkred")

geom_line(data = NULL, aes(x = x, y = y), color = "darkred")
