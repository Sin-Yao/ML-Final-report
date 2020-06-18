demodata <- read.csv("https://sin-yao.github.io/ML-Final-report/final.csv")
demodata = demodata[,c(4,5,6,7,8,12,13,14,16,17)]
colnames(demodata)<-c("統一編號","名稱","地址","總資本額","核准日","產業別","標準化資本","同產業中成立順序","配發公司","配發公司地址")
