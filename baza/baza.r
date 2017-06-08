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
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS driver CASCADE"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS team CASCADE"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS result"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS grand_prix"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS has"))
  }, finally = {
    dbDisconnect(conn)
  })
}


pravice <- function(){
  # Uporabimo tryCatch,(da se povežemo in bazo in odvežemo)
  # da prisilimo prekinitev povezave v primeru napake
  tryCatch({
    # Vzpostavimo povezavo
    conn <- dbConnect(drv, dbname = db, host = host,#drv=s čim se povezujemo
                      user = user, password = password)
    
    dbSendQuery(conn, build_sql("GRANT CONNECT ON DATABASE sem2017_jurez TO urosk WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT CONNECT ON DATABASE sem2017_jurez TO domenh WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT ALL ON SCHEMA public TO urosk WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT ALL ON SCHEMA public TO domenh WITH GRANT OPTION"))
    
    
  }, finally = {
    # Na koncu nujno prekinemo povezavo z bazo,
    # saj preveč odprtih povezav ne smemo imeti
    dbDisconnect(conn) #PREKINEMO POVEZAVO
    # Koda v finally bloku se izvede, preden program konča z napako
  })
}


#Funkcija, ki ustvari tabele
create_table <- function(){
  # Uporabimo tryCatch,(da se povežemo in bazo in odvežemo)
  # da prisilimo prekinitev povezave v primeru napake
  tryCatch({
    # Vzpostavimo povezavo
    conn <- dbConnect(drv, dbname = db, host = host,#drv=s čim se povezujemo
                      user = user, password = password)
    
    #Glavne tabele
    driver <- dbSendQuery(conn,build_sql("CREATE TABLE driver (
                                         name TEXT NOT NULL,
                                         surname TEXT NOT NULL,
                                         car_number INTEGER PRIMARY KEY,
                                         age INTEGER NOT NULL,
                                         height INTEGER NOT NULL,
                                         weight INTEGER NOT NULL,
                                         country TEXT NOT NULL)"))
    
    team <- dbSendQuery(conn,build_sql("CREATE TABLE team (
                                       id INTEGER PRIMARY KEY,
                                       name TEXT NOT NULL UNIQUE,
                                       country TEXT NOT NULL,
                                       constructor TEXT NOT NULL,
                                       chassis VARCHAR(13) NOT NULL UNIQUE,
                                       power_unit VARCHAR(22) NOT NULL)"))
    
    grand_prix <- dbSendQuery(conn,build_sql("CREATE TABLE grand_prix (
                                             round INTEGER PRIMARY KEY,
                                             name TEXT NOT NULL UNIQUE,
                                             circuit_name TEXT NOT NULL,
                                             town TEXT NOT NULL,
                                             date DATE NOT NULL,
                                             circuit_length DECIMAL NOT NULL,
                                             laps INTEGER NOT NULL)"))
    
    has <- dbSendQuery(conn,build_sql("CREATE TABLE has (
                                         team_id INTEGER NOT NULL REFERENCES team(id),
                                         team_driver INTEGER NOT NULL REFERENCES driver(car_number),
                                         CHECK (team_id <> team_driver))"))
    
    result <- dbSendQuery(conn,build_sql("CREATE TABLE result (
                                         car INTEGER REFERENCES driver(car_number),
                                         start_position INTEGER NOT NULL,
                                         retired_in_lap INTEGER,
                                         time INTERVAL NOT NULL,
                                         position INTEGER NOT NULL,
                                         points INTEGER)"))
    
    dbSendQuery(conn, build_sql("GRANT ALL ON ALL TABLES IN SCHEMA public TO jurez WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT ALL ON ALL TABLES IN SCHEMA public TO urosk WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT ALL ON ALL TABLES IN SCHEMA public TO domenh WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO jurez WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO urosk WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO domenh WITH GRANT OPTION"))
    
  }, finally = {
    # Na koncu nujno prekinemo povezavo z bazo,
    # saj preveč odprtih povezav ne smemo imeti
    dbDisconnect(conn) #PREKINEMO POVEZAVO
    # Koda v finally bloku se izvede, preden program konča z napako
  })
}


#Funcija, ki vstavi podatke
insert_data <- function(){
  tryCatch({
    conn <- dbConnect(drv, dbname = db, host = host,
                      user = user, password = password)
    
    dbWriteTable(conn, name="driver", tabeladirkacev, append=T, row.names=FALSE)
    dbWriteTable(conn, name="team", tabelaekip, append=T, row.names=FALSE)
    dbWriteTable(conn, name="grand_prix", tabelaGandPrix16, append=T, row.names=FALSE)
    
  }, finally = {
    dbDisconnect(conn) 
    
  })
}

delete_table()
pravice()
create_table()
insert_data()

con <- src_postgres(dbname = db, host = host, user = user, password = password)
# 
# #relacija has
# tbl.team <- tbl(con, "team")
# data.has <- inner_join(team
#                             tbl.team %>% select(id, name),
#                             copy = TRUE) %>%
#   select(driver, team_driver = religion_id,name,surname)
#   
# #Funkcija, ki vstavi relacije
# insert_relation_data <- function(){
#   tryCatch({
#     conn <- dbConnect(drv, dbname = db, host = host,
#                       user = user, password = password)
#     dbWriteTable(conn, name="has", data.has, append=T, row.names=FALSE)
#    
#   }, finally = {
#     dbDisconnect(conn) 
#     
#   })
# }
# 
# insert_relation_data()

