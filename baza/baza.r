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
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS result_driver"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS grand_prix"))
    
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
                                         car_number INTEGER PRIMARY KEY,
                                         name TEXT NOT NULL,
                                         surname TEXT NOT NULL,
                                         age INTEGER NOT NULL,
                                         height INTEGER NOT NULL,
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
                                          circuit_length DECIMAL NOT NUL,
                                          laps INTEGER NOT NULL)"))
    
    result <- dbSendQuery(conn,build_sql("CREATE TABLE result (
                                             car_number INTEGER REFERENCES driver(id),
                                             name TEXT REFERENCES driver(name),
                                             surname TEXT REFERENCES driver(surname),    
                                             start_position INTEGER NOT NULL,
                                             retired_in_lap INTEGER,
                                             time VARCHAR(11) NOT NULL,
                                             position INTEGER NOT NUL,
                                             points INTEGER)"))
    
    dbSendQuery(conn, build_sql("GRANT CONNECT ON DATABASE sem2017_jurez TO urosk WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT CONNECT ON DATABASE sem2017_jurez TO domenh WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT ALL ON SCHEMA public TO urosk WITH GRANT OPTION"))
    dbSendQuery(conn, build_sql("GRANT ALL ON SCHEMA public TO domenh WITH GRANT OPTION"))
    
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


