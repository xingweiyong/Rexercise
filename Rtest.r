#read.table批量读取txt
fileName <- dir("E:/hylanda/20151116/2/邢伟永/邢伟永")
dataList <- vector("list",length(fileName))
for(i in 1:length(dataList)){
  data<-read.table(paste("E:/hylanda/20151116/2/邢伟永/邢伟永",fileName[i],sep = "/"),
                   header =F,encoding = 'UTF-8',fill = T,blank.lines.skip = T)
  dataList[[i]]<-list(fileName=fileName[i],data=data)
}
#列表合并
data1<-vector()
for(i in 1:length(dataList)){
  data1<-rbind(dataList[[i]]$data,data1)
}
write.table(data1$V1,"abc.txt")
#read.lines批量读取txt
get.msg<-function(path){
  con<-file(path,open = "rt")
  msg<-readLines(con)
  n<-grep("各位代表",msg)
 msg<-msg[seq(n[1],length(msg),1)]
 close(con)
 return(paste(msg,collapse = ""))
}
path="E:/资料/docs"
docs<-dir(path)
docs<-docs[which(docs!="cmds")]
msg<-sapply(docs,function(p) get.msg(paste(path,p,sep="/")))
msg<-as.data.frame(cbind(names(msg),unlist(msg)),stringAsFactor=F)
colnames(msg)<-c("id","sentence")
#rownames(msg)<-null

#随机抽取txt
urldata<-read.table("",header = F)
selecturl<-dpt$V1[sample(length(dpt$V1)/2,130)]

write.csv(selecturl,file="./dpt.csv")
#读取xlx
require(RODBC)
odbcConnectExcel()
sqlFetch()
library(rJava)
library(xlsx)
read.xlsx("论坛数据检查(1).xlsx",sheetanme="sheet1")
#读取csv
ab<-read.csv("./ab.csv",header = F)


#安装Rjava
install.packages("rJava")
install.packages("xlsx")
library(rJava)
library(xlsx)






if(!suppressWarnings(require("plyr"))){
  install.packages("plyr")
  require("plyr")
}

a<-read.table("clipboard",header = F)
lever_now<-a$V1[sample(length(a$V1),100)]
write.table(lever_now,"career_loc1.txt")

n<-sample(length(a$url),100)
sel_wdpt<-data.frame(a$url[n],a$阅读数[n],a$回复数[n])
sel_temp<-cbind(sel_wdpt,a$阅读数[n]>a$回复数[n])
write.table(sel_temp,"sel_wdpt1.txt")


a<-read.table("clipboard",header = T)
b<-read.table("clipboard",header = T)
c<-read.table("clipboard",header = T)
for(i in length(a$V1)){
  ifelse(any(a$V1[i]==b$V1),a$V2[i]<-"1",a$V2[i]<-"0")
}

e<-merge(a,d,by.x ="a",by.y = "b",all.x = T)
unique()#去重函数可直接应用于数据框

a<-read.table("clipboard")
n<-sample(length(a$profile_url),50)
b<-a$profile_url[n]
write.table(b,"select_q.txt")

#向量重复个数汇总得到table，并转化为data.frame
d<-as.data.frame(table(unlist(a)))
n<-sample(length(d$Var1),200)
write.table(data.frame(d$Var1[n],d$Freq[n]),"select_q.txt")

n<-which(d$Freq>200)
m<-sample(n,10)

#拼接URL
a<-read.table("clipboard")
a<-as.matrix(a)
temp=""
for(i in 1:length(a[,1])){
  for(j in 1:length(a[1,])){
    temp<-rbind(temp,a[i,j])
  }
}
write.table(temp,"sum.txt")

a<-read.table("clipboard")
a<-as.vector(a$V1)
b<-read.table("clipboard")
b<-as.vector(b$V1)
temp=""
for(i in 1:length(a)){
  for(j in 1:length(b)){
    temp<-rbind(temp,gsub("aaaaa",a[i],b[j]))
  }
}
write.table(temp,"final.txt")


library(plyr)
for(j in 1:length(b)){
  aaply(a,.margin=1,function(x){
    temp<-rbind(temp,gsub("a",x,b[j]))
  })
}



result<-T
content<-list()
a<-read.table("clipboard")
for(i in 1:length(a$V1)){
  content[[i]]<-readLines("http://news.so.com/ns?rank=pdate&q=site:(sxredcross.org.cn)",
                     encoding ="UTF-8")
  for(j in 1:length(content[[i]])){
    if(content[[i]][j]%in%"<strong>建议您：</strong>")result[i]<-F
    else result[i]<-T
  }
}
#between()获取小写字母个数，charToRaw()获取字符ASCII码
library(data.table)
sum(between(charToRaw("98sknnshb0ki987s"),charToRaw("a"),charToRaw("z")))
#调用网络版金山词霸
ciba<-function(x){
  link<-url(paste("http://dict.youdao.com/m/search?keyfrom=dict.mindex&vendor=&q=",iconv(x,to='UTF-8')),encoding = 'UTF-8')
  a<-readLines(link)
  a<-gsub('(<[^<>]*>)|(^ )|(\t)','',a)
  a<-gsub(' {2,}','',a)
  a<-head(a,-11)
  a<-tail(a,-35)
  a<-a[a!='']
  a<-paste(a,collapse='\n')
  a<-gsub('(\n *){2,}','\n',a)
  a<-gsub(' *\n *','\n',a)
  cat(a)
}
ciba('中国')

#lapply(X, FUN, ...)和sapply(X, FUN,..., simplify = TRUE, USE.NAMES = TRUE)
x<-list(a=1:10,beta=exp(-3:3),locic=c(TRUE,FALSE,FALSE,TRUE))
lapply(x,quantile)
sapply(x,quantile,simplify = T)#simplify=T结果返回矩阵形式
#r启动是自动载入.r文件，在etc/Rprofile.site中加入如下代码
setwd("d:/我的文档/documents")
myfun<-lapply(list.files(path = "d:/我的文档/documents",,pattern='\\.r$'),source)
#intersect()求交集,可以实现求n列中相同的元素/%in%
a<-1:100
b<-7:78
c<-30:200
intersect(intersect(a,b),c)
a%in%b
a[a%in%b]
a[a%in%b]%in%c
a[a%in%b][a[a%in%b]%in%c]#效果一样求n列相同元素

imax<-c(10)
#字符形式的进度条
pb <- txtProgressBar(min = 0, max = imax, style = 3)
for(i in 1:imax) {
  Sys.sleep(1)
  # 更新进度
  setTxtProgressBar(pb, i)
}
cat("\n")
#管道操作
plot(diff(log(sample(rnorm(10000,mean=10,sd=1),size=100,replace=FALSE))),col="red",type="l")
library("magrittr")
rnorm(10000,mean=10,sd=1) %>%
  sample(size=100,replace=FALSE) %>%
  abs %>%
  log %>%
  diff %>%
  plot(col="red",type="l")
library("pipeR")
rnorm(10000,mean=10,sd=1) %>>%
  sample(.,size=length(.)*0.2,replace=FALSE) %>>%
  log %>>%
  diff %>>%
  plot(.,col="red",type="l",main=sprintf("length: %d",length(.)))
  
  #筛选
setwd("E:/hylanda/20160112")
u<-read.table("weiboDPT0107.txt",header = F)
num1<-which((u$V2>100)&(u$V3>100)&(u$V4>100))
num2<-which((u$V2==0)&(u$V3==0)&(u$V4==0))
num3<-which((1:length(u$V1))%in%(num1+num2))
num_1<-sample(num1,50)
num_2<-sample(num2,50)
num_3<-sample(num3,100)
temp1<-cbind.data.frame(u$V1[num_1],u$V2[num_1],u$V3[num_1],u$V4[num_1])
temp2<-cbind.data.frame(u$V1[num_2],u$V2[num_2],u$V3[num_2],u$V4[num_2])
temp3<-cbind.data.frame(u$V1[num_3],u$V2[num_3],u$V3[num_3],u$V4[num_3])
for(i in 1:3){
  temp<-paste("temp",i,sep="")
  temp<-as.factor(temp)
  print(temp)
  #write.table(temp,paste(temp,".txt",sep=""))
}#如何将字符串转化为变量？？？？

setwd("E:/hylanda/20160112")
u<-read.table("bj10.txt",header = F)
temp<-u$V1[sample(length(u$V1),500)]
write.table(temp,"select1.txt")




















