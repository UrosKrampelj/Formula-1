library(shiny)
library(shinythemes)
library(leaflet)

shinyUI(fluidPage(
  
  titlePanel("FORMULA 1"),
  
  tabsetPanel(


    tabPanel("Točke",
             sidebarLayout(
               sidebarPanel(
                 sliderInput("st.dirk",
                             "Izberi število dirk",
                             min = 1,
                             max = 21,
                             value = 21)
               ),

               mainPanel(
                 tableOutput("output$tocke")
               )
             )
    ),
    #######################################################
    
    tabPanel("Država/Dirkač",
             sidebarLayout(
               sidebarPanel(
                 selectInput("drzava", "Drzava:", 
                             choices= c("Australia", "Netherlands", "Brazil", "Mexico", "Spain", "Sweden",
                                        "Germany", "France", "Russia", "Denmark", "Finland", "Belgium", "United Kingdom", "Indonesia"
                                        )),
                 hr(),
                 helpText("Izbira države.")
               ),
               
               mainPanel(
                 tableOutput("country") 
               )
             )
    )
    
    
              )
  
  )
  )


