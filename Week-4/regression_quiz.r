dat <- read.table("http://www.stat.ufl.edu/~winner/data/pgalpga2008.dat", 
           header=FALSE)

names(dat)[1:3] <- c("Avg_Driv_Dist", "Accuracy", "Gender")

datF <- subset(dat, Gender==1, select=1:2)
datM <- subset(dat, Gender==2, select=1:2)

plot(datF[,1], datF[,2])
plot(datM[,1], datM[,2])

model_F <- lm(Accuracy ~ Avg_Driv_Dist, data = datF)

summary(model_F)

round(130.89331 -0.25649*260, 2)

predict(model_F,data.frame(Avg_Driv_Dist=260),interval="predict")
