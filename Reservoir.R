require(rvest)


dam<-read_html("http://www.chennaimetrowater.tn.nic.in/reserve.asp")



tab<-dam %>% 
  html_table(dam,header=FALSE)
tab<-data.frame(tab)


session<-html_session("http://www.chennaimetrowater.tn.nic.in/reserve.asp")


form<-html_form(dam)[[1]]

form<-set_values(form,ldate="08/12/2015")

h<-data.frame(html_table(submit_form(session, form)))



final<-data.frame()
d<-"01/11/2013"

start <- as.Date(d,format="%d/%m/%Y")
end<- start+60
d<-start

dam<-read_html("http://www.chennaimetrowater.tn.nic.in/reserve.asp")

session<-html_session("http://www.chennaimetrowater.tn.nic.in/reserve.asp")
while (d<=end)
{
  
  form<-html_form(dam)[[1]]
  m<-as.character(format(d,"%d/%m/%Y"))
  form<-set_values(form,ldate=m)
  
  h<-data.frame(html_table(submit_form(session, form))) 
  

  
  data<-cbind(d,h[6,])
  final<-rbind(final,data)
  d<-d+1
}

colnames(final)
headers<-tab[1,]
headers<-cbind("Date",headers)

colnames(final)<-headers

dam2008<-final
dam2009<-final
dam2010<-final
dam2011<-final
dam2012<-final
dam2013<-final
dam2005<-final
dam2014<-final
dam2015<-final
dam2016<-final
dam2017<-final

ho<-rbind(dam2005,dam2008,dam2009,dam2010,dam2011,dam2012,dam2013,dam2014,dam2015,dam2016,dam2017)

write.table(ho, file = "DamData.csv", sep = ",", col.names = c("Date","Reservoir", "Full Tank Level (ft)","Full Capacity mcft","Level (ft)", "Level (ft)","Storage Mcft","Inflow (cusecs)","Outflow (cusecs)","Rainfall (mm)","Storage as on same day last year (mcft)",""), row.names=FALSE)

plot(final[,1],final[,5],type='l',xlab="Date",ylab="Storage in Mcft")
library(ggplot2)
ggplot(data=h0, aes(final[,1],final[,5]))+geom_point()+geom_point(final$`
Rainfall (mm)
`)


