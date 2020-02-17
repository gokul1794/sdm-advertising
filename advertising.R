rm(list=ls())
library(rio)
library(ggplot2) 
advertising=import("Advertising.csv")
ggplot(advertising, aes(x=print)) +  geom_density()
ggplot(advertising, aes(x = tv, y = sales)) +  geom_point()
ggplot(advertising, aes(x = online, y = sales)) +  geom_point()
ggplot(advertising, aes(x = print, y = sales)) +  geom_point()
regout = lm(sales~tv+online, data = advertising)
summary(regout)
abline(regout,col="red",lwd=3)
ggplot(data = advertising, aes(x = tv+online, y = sales)) + 
  geom_point(color='black') +
  geom_smooth(method = "lm", se = FALSE)

