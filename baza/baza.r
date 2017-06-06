library(RPostgreSQL)
library(dplyr)

#Uvoz:
source("auth.R", encoding="UTF-8")
source("uvoz in urejanje podatkov/tabela.R", encoding="UTF-8")

# Povezemo se z gonilnikom za PostgreSQL
drv <- dbDriver("PostgreSQL") 
 
# Funkcija za brisanje tabel
delete_table <- function(){
  # Uporabimo funkcijo tryCatch,
  # da prisilimo prekinitev povezave v primeru napake
  tryCatch({
    # Vzpostavimo povezavo z bazo
    conn <- dbConnect(drv, dbname = db, host = host, user = user, password = password)

    # Če tabela obstaja, jo zbrišemo, ter najprej zbrišemo tiste,
    # ki se navezujejo na druge
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS driver"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS team"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS has"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS result_driver"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS grand_prix"))

  }, finally = {
    dbDisconnect(conn)
  })
}
