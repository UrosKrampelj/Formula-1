library(shiny)
library(dplyr)
library(RPostgreSQL)
library(datasets)

source("../auth_public.R")

shinyServer(function(input, output) {
  
  # Vzpostavimo povezavo
  conn <- src_postgres(dbname = db, host = host,
                       user = user, password = password)
  
  tbl.driver <- tbl(conn, "driver")
  tbl.team <- tbl(conn, "team")
  tbl.grand_prix <- tbl(conn, "grand_prix")
  tbl.results <- tbl(conn, "results")
  tbl.has <- tbl(conn, "has")
  drzave <- distinct(tbl.driver %>% select(country))

  
  
  aa <- inner_join(tbl.driver,tbl.has,by=c("car_number"="driver"))
  aaa<- inner_join(aa,tbl.team,by=c("team"="id")) 
  
  output$country <- renderTable({
    a <- aaa  %>% filter(country.x == input$drzava) %>% select(name, surname, car_number, age, height, weight,team_name) %>% data.frame() 
    Encoding(a$name) <- "UTF-8"
    Encoding(a$surname) <- "UTF-8"
    a
  })
  
  bb <- inner_join(tbl.has,tbl.team,by=c("team"="id"))
  bbb<- inner_join(tbl.driver,bb,by=c("car_number"="driver"))
  
  output$team_driver<- renderTable({
    b <-bbb %>% filter(team_name == input$ekipa_dirkac) %>% select(name, surname, car_number, age, height, weight,country.x) %>% data.frame()
    Encoding(b$surname) <- "UTF-8"
    Encoding(b$name) <- "UTF-8"
    b
  })

  
  output$tocke <- renderTable({
    
    t <- tbl.results %>% filter(grand_prix == input$st.dirk)
    validate(need(nrow(t) > 0, "Vaši poizvedbi ne ustreza noben podatek."))
    Encoding(t) <- "UTF-8"
    t
    
  })
  
})