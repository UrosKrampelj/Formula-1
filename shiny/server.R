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
  
  output$st.dirk <- renderTable({
    
    t <- tbl.results %>% filter(circuit <= input$st.dirk)
    validate(need(nrow(t) > 0, "Vaši poizvedbi ne ustreza noben podatek."))
    Encoding(t) <- "UTF-8"
    t
  })
  
  
  
  
})