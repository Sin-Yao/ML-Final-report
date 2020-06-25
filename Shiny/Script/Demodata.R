#demodata <- read.csv("https://sin-yao.github.io/ML-Final-report/Shiny/Data/real_final.csv")
#demodata = demodata[,c(1,2,3,4,5,9,10,11,13,17,18,19,20,21)]
#colnames(demodata)<-c("統一編號","名稱","地址","總資本額","核准日","產業別","標準化資本","同產業中成立順序","配發公司",
#                      "推薦保險一","推薦保險二","公共安全責任險","火災保險","接近嫌惡設施加油站")
demodata <- read.csv("https://sin-yao.github.io/ML-Final-report/Shiny/Data/NEW2.csv")
demodata = demodata[,c(2,3,4,5,6,10,11,12,17,18,19,20)]
colnames(demodata)<-c("統一編號","名稱","地址","總資本額","核准日","產業別","標準化資本","同產業中成立順序","配發公司",
                      "接近嫌惡設施加油站","公共安全責任險","火災保險")
