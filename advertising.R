rm(list=ls())
library(rio)
library(ggplot2) 
library(corrplot)
advertising=import("Advertising.csv")
ggplot(advertising, aes(x=print, y = sales)) +  geom_point()
ggplot(advertising, aes(x = tv, y = sales)) +  geom_point()
ggplot(advertising, aes(x = online, y = sales)) +  geom_point()
ggplot(advertising, aes(x = print, y = sales)) +  geom_point()
pairs(advertising)
cor(advertising)
corrplot(cor(advertising), method="circle")
regout = lm(sales~tv+online+(tv*online), data = advertising)
summary(regout)

plot(advertising$sales,regout$fitted.values,
     xlab="Sales", ylab="Fittled values",
     pch=19,main="Actuals v. Fitted")
abline(0,1,col="red",lwd=3)

abline(regout,col="red",lwd=3)
ggplot(data = advertising, aes(x = tv+online+(tv*online), y = sales)) + 
  geom_point(color='black') +
  geom_smooth(method = "lm", se = FALSE)
plot(regout)