
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
  
  
})

#output$demo  <-renderTable({
 # Order<-grepl(input$industry,demodata$產業別)
  #demodata[Order,]
