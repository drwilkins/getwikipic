list.of.packages<-c("WikipediR","rvest")
new.packages<-list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
require(WikipediR); require(rvest)

#titles= vector of page name(s)
#res= desired width in pixels (220 px thumbnail by default)
#savedest= save destination (w terminal '/'); wd by default

getwikipic<-function(titles,res,savedest){
    if(missing(res)){res=220}
    if(missing(savedest)){savedest=NA}
  lapply(titles, function (ttl,...){
  d<-page_info("en","wikipedia",page=ttl,clean_response=T)
  url<-d[[1]]$fullurl
  wikipage<-html_session(url)
  imginfo<-wikipage %>% html_nodes("tr:nth-child(2) img")
  
  img.url<- imginfo[1] %>% html_attr("src")
  
  img.url<-paste0("https:",img.url)
  
  if(is.na(savedest)){
    savefilename<-paste0(ttl,".jpg")
    }else{savefilename<-paste0(savedest,ttl,".jpg")}
  
  if(res!=220){img.url<-gsub(220,res,img.url)}  
  
  download.file(img.url,savefilename)
  return(paste0("orig.file: ",basename(img.url)))#tell user original filename (or error)
  
  },res,savedest)#End lapply
}#End function


