
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(magrittr)
library(shiny)
library(stringr)
library(dplyr)

source('Demodata.R')
randomVals <-5
# Define server logic required to draw a histogram
    urls   <- a("信義區", href="https://sin-yao.github.io/ML-Final-report/Shiny/HTML/truth.html")
    urlc   <- a("中正區", href="https://sin-yao.github.io/ML-Final-report/Shiny/HTML/zhong.html")
    urlr   <- a("仁愛區", href="https://sin-yao.github.io/ML-Final-report/Shiny/HTML/love.html")
    urlall <- a("基隆市", href="https://sin-yao.github.io/ML-Final-report/Shiny/HTML/all.html")
    route1 <- a("地圖", href="https://sin-yao.github.io/ML-Final-report/Shiny/HTML/route1.html")
    route1_d <- a("地圖", href="https://sin-yao.github.io/ML-Final-report/Shiny/HTML/route1_driving.html")
    route2_d <- a("地圖", href="https://sin-yao.github.io/ML-Final-report/Shiny/HTML/route2_driving.html")
shinyServer(function(input, output) {
    output$demo  <-renderTable({
      if(input$city=="基隆市"&input$industry==""&input$name==""&input$district=="") return(demodata)
        if(input$city=="基隆市"&input$insurance==""){demodata %>% 
          filter(str_detect(demodata$產業別,input$industry)&str_detect(demodata$名稱,input$name)&str_detect(demodata$地址,input$district))
          }  else if(input$city=="基隆市"&input$insurance=="火災保險"){demodata %>% 
          filter(str_detect(demodata$產業別,input$industry)&str_detect(demodata$名稱,input$name)&str_detect(demodata$地址,input$district)&demodata$火災保險=="True")  
                                      }
             else if(input$city=="基隆市"&input$insurance=="公共安全責任險"){demodata %>% 
          filter(str_detect(demodata$產業別,input$industry)&str_detect(demodata$名稱,input$name)&str_detect(demodata$地址,input$district)&demodata$公共安全責任險=="True")  
             }
   })
    output$demo2  <-renderTable({
      demodata %>%
        filter(input$capital<demodata$總資本額)
    })

    output$tab <- renderUI({
      if(input$city=="基隆市"&input$district==""){
        tagList("地圖:", urlall)
      }else if(input$city=="基隆市"&input$district=="中正區"){
        tagList("地圖:", urlc)
      }else if(input$city=="基隆市"&input$district=="信義區"){
        tagList("地圖:", urls)
      }else if(input$city=="基隆市"&input$district=="仁愛區"){
        tagList("地圖:", urlr)
      }
    
    })
    
    output$tab2 <- renderUI({
      if(randomVals()<1&str_detect(input$end,"南榮")&input$method=="大眾運輸"){
        tagList("地圖:", route1)
      }else if(randomVals()<1&str_detect(input$end,"南榮")&input$method=="開車"){
        tagList("地圖:", route1_d)
      }else if(randomVals()<1&str_detect(input$end,"中船")&input$method=="開車"){
        tagList("地圖:", route2_d)
      }
      
    })
    randomVals <- eventReactive(input$go, {
      runif(1)
    })
    output$demo3  <-renderTable({
      if(randomVals()<1&str_detect(input$end,"南榮")&input$method=="大眾運輸")  {
       route1data
      }else if(randomVals()<1&str_detect(input$end,"南榮")&input$method=="開車"){
        route1ddata
      }else if(randomVals()<1&str_detect(input$end,"中船")&input$method=="開車"){
        route2ddata
      }
    })
    
})


