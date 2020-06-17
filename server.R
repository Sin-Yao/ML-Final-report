
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
# Define server logic required to draw a histogram
    urls <- a("信義區地圖", href="https://www.google.com/")
    urlc <- a("中正區地圖", href="https://ithelp.ithome.com.tw/m/users/20121116/ironman/2860?page=2")
    urlr <- a("仁愛區地圖", href="https://www.google.com/")
shinyServer(function(input, output) {
    output$demo  <-renderTable({
      if(input$industry==""&input$name==""&input$district=="全部") return(demodata)
        if(input$district=="全部"){demodata %>% 
          filter(str_detect(demodata$產業別,input$industry)&str_detect(demodata$名稱,input$name))
          }  else{demodata %>% 
          filter(str_detect(demodata$產業別,input$industry)&str_detect(demodata$名稱,input$name)&str_detect(demodata$地址,input$district))  
                                      }
                              
   })
    output$demo2  <-renderTable({
      demodata %>%
        filter(input$capital<demodata$總資本額)
    })

    output$tab <- renderUI({
      if(input$district=="中正區"){
        tagList("Map link:", urlc)
      }else if(input$district=="信義區"){
        tagList("Map link:", urls)
      }else if(input$district=="仁愛區"){
        tagList("Map link:", urlr)
      }
    
    })
  
})

#output$demo  <-renderTable({
 # Order<-grepl(input$industry,demodata$產業別)
  #demodata[Order,]
