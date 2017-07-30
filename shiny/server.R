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
    a<-a %>% rename(Name = name, Surname = surname,
                    `Car number` = car_number, Age=age, Height=height, Weight=weight, `Team name`=team_name)
    Encoding(a$Name) <- "UTF-8"
    Encoding(a$Surname) <- "UTF-8"
    a
  })
  
  bb <- inner_join(tbl.has,tbl.team,by=c("team"="id"))
  bbb<- inner_join(tbl.driver,bb,by=c("car_number"="driver"))
  
  output$team_driver<- renderTable({
    b <- bbb %>% filter(team_name == input$ekipa_dirkac) %>% select(name, surname, car_number, age, height, weight,country.x) %>% data.frame()
    b <- b %>% rename(Name = name, Surname = surname,
               `Car number` = car_number, Age=age, Height=height, Weight=weight, `Country`=country.x) 
    Encoding(b$Surname) <- "UTF-8"
    Encoding(b$Name) <- "UTF-8"
    b
  })

  output$grand_prix<- renderTable({
    h <-tbl.grand_prix %>% filter(name == input$gran_prix) %>% select(round, official_name,circuit_name, date, circuit_length,laps) %>% data.frame()
    h$date <- as.character(h$date)
    h <- h %>% rename(Name = round, `Official name` = official_name	,
                      `Circuit name` = circuit_name, Date=date, `Circuit length (km)`=circuit_length, Laps=laps) 
    Encoding(h$`Circuit name`) <- "UTF-8"
    Encoding(h$`Official name`) <- "UTF-8"
    h
  })
  
  
  output$teams<- renderTable({
    d <-tbl.team %>% filter(team_name == input$teams) %>% select(country, constructor,chassis, power_unit) %>% data.frame()
    d<-d %>% rename(Country = country, Constructor = constructor,
                 Chassis = chassis, `Power unit` = power_unit)
    d
  })
  

  ee<- inner_join(tbl.grand_prix,tbl.results,by=c("round"="grand_prix"))
  eee <- inner_join(tbl.driver,ee,by=c("car_number"="car_number"))
  eeee<- inner_join(eee,tbl.has,by=c("car_number"="driver"))
  eeeee<-inner_join(tbl.team,eeee,by=c("id"="team"))

  output$results<- renderTable({
    e <-eeeee %>% filter(name.y == input$results) %>% select(position,start_position,car_number,name.x,surname,laps.x,time, points,team_name) %>% data.frame()
    e<-e %>% rename(Position = position, `Start position`= start_position, `Car number` = car_number,
                    Name = name.x, Surname = surname, Laps=laps.x, Time=time, Points=points,`Team name`=team_name)
    Encoding(e$Surname) <- "UTF-8"
    Encoding(e$Name) <- "UTF-8"
    e
  })
  
  
  ff<-inner_join(tbl.driver,tbl.results,by=c("car_number"="car_number"))
  fff<-inner_join(ff,tbl.has,by=c("car_number"="driver"))
  ffff<-inner_join(fff,tbl.team,by=c("team"="id"))
  output$points <- renderTable({
    f<-ffff %>% filter(grand_prix <= input$points) %>% group_by(car_number,name, surname,team_name) %>% summarise(points = sum(points)) %>% data.frame()
    f <- f[order(-f$points),]
    f["place"]<-NA
    f$place<-(1:nrow(f))
    f <- f %>% rename(`Car number` = car_number, Name = name, Surname = surname,
                      `Team name`= team_name, Points=points, Place=place)
    Encoding(f$Surname) <- "UTF-8"
    Encoding(f$Name) <- "UTF-8"
    f
  })
  
  
  output$points1 <- renderTable({
    g<-ffff %>% filter(grand_prix <= input$points1) %>% group_by(team_name, constructor, power_unit) %>% summarise(points = sum(points)) %>% data.frame()
    g <- g[order(-g$points),]
    g["place"]<-NA
    g$place<-(1:nrow(g))
    g<-g %>% rename(`Team name`=team_name, Constructor=constructor, `Power unit`=power_unit, Points=points, Place=place)
    Encoding(g$`Team name`) <- "UTF-8"
    Encoding(g$Constructor) <- "UTF-8"
    g
  })
  
})