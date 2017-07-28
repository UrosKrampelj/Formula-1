library(shiny)
library(shinythemes)
library(leaflet)

shinyUI(fluidPage(
  theme = shinytheme("simplex"),
  titlePanel("FORMULA 1",
             tags$head(
               tags$img(src='header_photo.png', height='100px'))),
  
  tabsetPanel(
    
    tabPanel("Country/Driver",
             sidebarLayout(
               sidebarPanel(
                 selectInput("drzava", "Country:", 
                             choices= c("Australia", "Netherlands", "Brazil", "Mexico", "Spain", "Sweden",
                                        "Germany", "France", "Russia", "Denmark", "Finland", "Belgium", "United Kingdom", "Indonesia"
                                        )),
                 hr(),
                 helpText("Choose country.")
               ),
               
               mainPanel(
                 tableOutput("country") 
               )
             )
    ),
    
    
              
  #################################################################################################
  
  tabPanel("Team/Driver",
           sidebarLayout(
             sidebarPanel(
               selectInput("ekipa_dirkac", "Team name:", 
                           choices= c("Scuderia Ferrari", "Sahara Force India Formula One Team", "Haas F1 Team", "McLaren Honda Formula 1 Team", "Mercedes AMG Petronas Formula One Team", "Manor Racing MRT",
                                      "Red Bull Racing", "Renault Sport Formula One Team", "Sauber F1 Team", "Scuderia Toro Rosso", "Williams Martini Racing")),
               hr(),
               helpText("Choose team name.")
             ),
             
             mainPanel(
               tableOutput("team_driver") 
             )
           )
  ),
  
  #################################################################
 
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
  )
  )
  )
  )


