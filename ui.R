
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(magrittr)
library(shiny)
library(stringr)
library(dplyr)

shinyUI(navbarPage("公司資訊",
                   tabPanel("查詢",fluidRow(    column(2,selectInput('district', '行政區域', 
                                                            c("全部","中正區", "信義區", "仁愛區") )),
                                                column(2,textInput("industry",label = "產業別" ,value = "" )),
                                                column(2,textInput("name",label = "公司名稱" ,value = "" )),
                                                column(12,wellPanel(tableOutput('demo')))
                                                )),
                   tabPanel("資本額",fluidRow(
                     column(12, h4("篩選"),
                            sliderInput('capital', '總資本多少以上',
                                        min=0, max=5000000, value=500000,
                                        step=1000000, round=0)),
                     column(12,wellPanel(tableOutput('demo2')))
                   ))

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
))