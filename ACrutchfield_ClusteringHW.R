#This code produces clusters for mental health data I got from Kaggle
#read in data
mental_health <- read.csv("CleanedData.csv")
mental_health

#using k-means example from , I'm not sure if I did this properly 

set.seed(2)
x=matrix(rnorm(50*2),ncol=2)
plot(x)
x[1:25,1]=x[1:25,1]+3
x[1:25,2]=x[1:25,2]-4
indx =rep(0,50)
indx[1:25]=1  
plot(x,col=indx+2,pch=10,lwd=3) #makes clusters

km.out=kmeans(x,2,nstart=20)
names(km.out)
km.out$centers
km.out$cluster
plot(x,col=km.out$cluster+1,pch=20,lwd=3)
km.out$tot.withinss

# change number of centers
set.seed(2)
km.out2=kmeans(x,centers=3,nstart=20)
km.out2
plot(x,col=km.out2$cluster+1,pch=10,lwd=3)
km.out2$tot.withinss


