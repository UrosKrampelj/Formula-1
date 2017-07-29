library(shiny)
library(shinythemes)
library(leaflet)

shinyUI(fluidPage(
  theme = shinytheme("simplex"),
  titlePanel("FORMULA 1",
             tags$head(
               tags$img(src='header_photo.png', height='100px'))),
  
  tabsetPanel(
    
    
    tabPanel("Grand prixs",
             sidebarLayout(
               sidebarPanel(
                 selectInput("gran_prix", "Grand prix:", 
                             choices= c("Australian Grand Prix", "Bahrain Grand Prix", "Chinese Grand Prix", "Russian Grand Prix", "Spanish Grand Prix", "Monaco Grand Prix",
                                        "Canadian Grand Prix", "European Grand Prix", "Austrian Grand Prix", "British Grand Prix", "Hungarian Grand Prix", "German Grand Prix", 
                                        "Belgian Grand Prix", "	Italian Grand Prix", "Singapore Grand Prix", "Malaysian Grand Prix", "Japanese Grand Prix", "United States Grand Prix", 
                                        "Mexican Grand Prix", "Brazilian Grand Prix", "Abu Dhabi Grand Prix")),
                 hr(),
                 helpText("Choose gran prix.")
               ),
               
               mainPanel(
                 tableOutput("grand_prix") 
               )
             )
    ),
    
    #################################################################
    
    
    tabPanel("Teams",
             sidebarLayout(
               sidebarPanel(
                 selectInput("teams", "Team name:", 
                             choices= c("Scuderia Ferrari", "Sahara Force India Formula One Team", "Haas F1 Team", "McLaren Honda Formula 1 Team", "Mercedes AMG Petronas Formula One Team", "Manor Racing MRT",
                                        "Red Bull Racing", "Renault Sport Formula One Team", "Sauber F1 Team", "Scuderia Toro Rosso", "Williams Martini Racing")),
                 hr(),
                 helpText("Choose team name.")
               ),
               
               mainPanel(
                 tableOutput("teams") 
               )
             )
    ),
    
    #################################################################
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
  
  tabPanel("Results",
           sidebarLayout(
             sidebarPanel(
               selectInput("results", "Grand prix:", 
                           choices= c("Australian Grand Prix", "Bahrain Grand Prix", "Chinese Grand Prix", "Russian Grand Prix", "Spanish Grand Prix", "Monaco Grand Prix",
                                      "Canadian Grand Prix", "European Grand Prix", "Austrian Grand Prix", "British Grand Prix", "Hungarian Grand Prix", "German Grand Prix", 
                                      "Belgian Grand Prix", "	Italian Grand Prix", "Singapore Grand Prix", "Malaysian Grand Prix", "Japanese Grand Prix", "United States Grand Prix", 
                                      "Mexican Grand Prix", "Brazilian Grand Prix", "Abu Dhabi Grand Prix")),
               hr(),
               helpText("Choose gran prix.")
             ),
             
             mainPanel(
               tableOutput("results") 
             )
           )
  ),
  
  
  #################################################################
  
   tabPanel("Points Driver",
           sidebarLayout(
             sidebarPanel(
               sliderInput("points",
                           "Choose round.",
                           min = 1,
                           max = 21,
                           value = 21)
             ),
             
             mainPanel(
               tableOutput("points")
             )
           )
  ),
  
  #################################################################
  
  tabPanel("Points Team",
           sidebarLayout(
             sidebarPanel(
               sliderInput("points1",
                           "Choose round.",
                           min = 1,
                           max = 21,
                           value = 21)
             ),
             
             mainPanel(
               tableOutput("points1")
             )
           )
  )
  )
  )
  )


