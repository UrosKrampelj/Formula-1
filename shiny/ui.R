library(shiny)

shinyUI(fluidPage(
  
  titlePanel("FORMULA 1"),
  
  tabsetPanel(
    
    
    tabPanel("Število dirk",
             sidebarLayout(
               sidebarPanel(
                 sliderInput("st.dirk",
                             "Izberi število dirk",
                             min = 1,
                             max = 21,
                             value = 21)
               ),
               
               mainPanel(
                 tableOutput("output$st.dirk") 
               )
             )
    )
    
  )
  
  )
  )