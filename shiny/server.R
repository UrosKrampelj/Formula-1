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

  output$tocke <- renderTable({

    t <- tbl.results %>% filter(grand_prix == input$st.dirk)
    validate(need(nrow(t) > 0, "Vaši poizvedbi ne ustreza noben podatek."))
    Encoding(t) <- "UTF-8"
    t

  })

  output$country <- renderTable({
    t <- tbl.driver  %>% filter(country == input$drzava) %>% select(name, surname, car_number, age, height, weight) %>% data.frame() 
    t
  })
  
  
  
})