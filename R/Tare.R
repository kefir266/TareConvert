tare <- function(...,div=1) {
  files <- list.files(...,pattern = "*.csv",full.names = TRUE)
  for (name in files){
    message(name)
    tab <- read.csv2(name,header = FALSE)
    tab <- as.matrix(tab)
    tab <- rbind(tab[,c(1,2,3)],tab[,c(4,5,6)],tab[,c(7,8,9)])
    tab <- tab[complete.cases(tab),]
    tab <- tab[order(tab[,1]),]
    tab[,1] <- tab[,1]/div
    write.table(tab, file=paste0(name,".txt"),dec = ".", sep= ",", row.names = FALSE,col.names = FALSE,qmethod = c("double"))
  }
 
}