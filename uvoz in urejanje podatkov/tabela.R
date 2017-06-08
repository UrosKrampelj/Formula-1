library(knitr)
library(rvest)
library(dplyr)
library(gsubfn)
library(ggplot2)
library(tidyr)
library(readr)

#tabele rezultatov posameznih dirk

htmlZmagovalci16 <- html_session("https://www.formula1.com/en/results.html/2016/races/94/great-britain/race-result.html") %>% read_html
html_tabelaZmagovalci16 <- htmlZmagovalci16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaZmagovalci16 <- html_tabelaZmagovalci16%>% html_table()
tabelaZmagovalci16 <-tabelaZmagovalci16[2:8]
tabelaZmagovalci16 <- separate(tabelaZmagovalci16, Winner, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE, 
         convert = FALSE, extra = "warn", fill = "warn")
tabelaZmagovalci16 <- tabelaZmagovalci16[-c(5)]

htmlAvstralija16 <- html_session("https://www.formula1.com/en/results.html/2016/races/938/australia.html") %>% read_html
html_tabelaAvstralija16 <- htmlAvstralija16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaAvstralija16 <- html_tabelaAvstralija16%>% html_table()
tabelaAvstralija16 <-tabelaAvstralija16[2:8]
tabelaAvstralija16 <- separate(tabelaAvstralija16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaAvstralija16 <- tabelaAvstralija16[-c(5)]

htmlBahrain16 <- html_session("https://www.formula1.com/en/results.html/2016/races/939/bahrain/race-result.html") %>% read_html
html_tabelaBahrain16 <- htmlBahrain16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaBahrain16 <- html_tabelaBahrain16%>% html_table()
tabelaBahrain16 <-tabelaBahrain16[2:8]
tabelaBahrain16 <- separate(tabelaBahrain16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaBahrain16 <- tabelaBahrain16[-c(5)]

htmlChina16 <- html_session("https://www.formula1.com/en/results.html/2016/races/940/china/race-result.html") %>% read_html
html_tabelaChina16 <- htmlChina16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaChina16 <- html_tabelaChina16%>% html_table()
tabelaChina16 <-tabelaChina16[2:8]
tabelaChina16 <- separate(tabelaChina16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaChina16 <- tabelaChina16[-c(5)]

htmlRussia16 <- html_session("https://www.formula1.com/en/results.html/2016/races/942/spain/race-result.html") %>% read_html
html_tabelaRussia16 <- htmlRussia16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaRussia16 <- html_tabelaRussia16%>% html_table()
tabelaRussia16 <-tabelaRussia16[2:8]
tabelaRussia16 <- separate(tabelaRussia16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaRussia16 <- tabelaRussia16[-c(5)]

htmlSpain16 <- html_session("https://www.formula1.com/en/results.html/2016/races/941/russia/race-result.html") %>% read_html
html_tabelaSpain16 <- htmlSpain16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaSpain16 <- html_tabelaSpain16%>% html_table()
tabelaSpain16 <-tabelaSpain16[2:8]
tabelaSpain16 <- separate(tabelaSpain16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaSpain16 <- tabelaSpain16[-c(5)]

htmlMonaco16 <- html_session("https://www.formula1.com/en/results.html/2016/races/943/monaco/race-result.html") %>% read_html
html_tabelaMonaco16 <- htmlMonaco16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaMonaco16 <- html_tabelaMonaco16%>% html_table()
tabelaMonaco16 <-tabelaMonaco16[2:8]
tabelaMonaco16 <- separate(tabelaMonaco16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaMonaco16 <- tabelaMonaco16[-c(5)]

htmlCanada16 <- html_session("https://www.formula1.com/en/results.html/2016/races/943/monaco/race-result.html") %>% read_html
html_tabelaCanada16 <- htmlCanada16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaCanada16 <- html_tabelaCanada16%>% html_table()
tabelaCanada16 <-tabelaCanada16[2:8]
tabelaCanada16 <- separate(tabelaCanada16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaCanada16 <- tabelaCanada16[-c(5)]

htmlEurope16 <- html_session("https://www.formula1.com/en/results.html/2016/races/958/europe/race-result.html") %>% read_html
html_tabelaEurope16 <- htmlEurope16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaEurope16 <- html_tabelaEurope16%>% html_table()
tabelaEurope16 <-tabelaEurope16[2:8]
tabelaEurope16 <- separate(tabelaEurope16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaEurope16 <- tabelaEurope16[-c(5)]

htmlAustria16 <- html_session("https://www.formula1.com/en/results.html/2016/races/945/austria/race-result.html") %>% read_html
html_tabelaAustria16 <- htmlAustria16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaAustria16 <- html_tabelaAustria16%>% html_table()
tabelaAustria16 <-tabelaAustria16[2:8]
tabelaAustria16 <- separate(tabelaAustria16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaAustria16 <- tabelaAustria16[-c(5)]

htmlGreatBritain16 <- html_session("https://www.formula1.com/en/results.html/2016/races/946/great-britain/race-result.html") %>% read_html
html_tabelaGreatBritain16 <- htmlGreatBritain16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaGreatBritain16 <- html_tabelaGreatBritain16%>% html_table()
tabelaGreatBritain16 <-tabelaGreatBritain16[2:8]
tabelaGreatBritain16 <- separate(tabelaGreatBritain16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaGreatBritain16 <- tabelaGreatBritain16[-c(5)]

htmlHungary16 <- html_session("https://www.formula1.com/en/results.html/2016/races/947/hungary/race-result.html") %>% read_html
html_tabelaHungary16 <- htmlHungary16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaHungary16 <- html_tabelaHungary16%>% html_table()
tabelaHungary16 <-tabelaHungary16[2:8]
tabelaHungary16 <- separate(tabelaHungary16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaHungary16 <- tabelaHungary16[-c(5)]

htmlGermany16 <- html_session("https://www.formula1.com/en/results.html/2016/races/948/germany/race-result.html") %>% read_html
html_tabelaGermany16 <- htmlGermany16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaGermany16 <- html_tabelaGermany16%>% html_table()
tabelaGermany16 <-tabelaGermany16[2:8]
tabelaGermany16 <- separate(tabelaGermany16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaGermany16 <- tabelaGermany16[-c(5)]

htmlBelgium16 <- html_session("https://www.formula1.com/en/results.html/2016/races/949/belgium/race-result.html") %>% read_html
html_tabelaBelgium16 <- htmlBelgium16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaBelgium16 <- html_tabelaBelgium16%>% html_table()
tabelaBelgium16 <-tabelaBelgium16[2:8]
tabelaBelgium16 <- separate(tabelaBelgium16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaBelgium16 <- tabelaBelgium16[-c(5)]

htmlItaly16 <- html_session("https://www.formula1.com/en/results.html/2016/races/950/italy/race-result.html") %>% read_html
html_tabelaItaly16 <- htmlItaly16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaItaly16 <- html_tabelaItaly16%>% html_table()
tabelaItaly16 <-tabelaItaly16[2:8]
tabelaItaly16 <- separate(tabelaItaly16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaItaly16 <- tabelaItaly16[-c(5)]

htmlSingapore16 <- html_session("https://www.formula1.com/en/results.html/2016/races/951/singapore/race-result.html") %>% read_html
html_tabelaSingapore16 <- htmlSingapore16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaSingapore16 <- html_tabelaSingapore16%>% html_table()
tabelaSingapore16 <-tabelaSingapore16[2:8]
tabelaSingapore16 <- separate(tabelaSingapore16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaSingapore16 <- tabelaSingapore16[-c(5)]

htmlMalaysia16 <- html_session("https://www.formula1.com/en/results.html/2016/races/952/malaysia/race-result.html") %>% read_html
html_tabelaMalaysia16 <- htmlMalaysia16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaMalaysia16 <- html_tabelaMalaysia16%>% html_table()
tabelaMalaysia16 <-tabelaMalaysia16[2:8]
tabelaMalaysia16 <- separate(tabelaMalaysia16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaMalaysia16 <- tabelaMalaysia16[-c(5)]

htmlJapan16 <- html_session("https://www.formula1.com/en/results.html/2016/races/953/japan/race-result.html") %>% read_html
html_tabelaJapan16 <- htmlJapan16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaJapan16 <- html_tabelaJapan16%>% html_table()
tabelaJapan16 <-tabelaJapan16[2:8]
tabelaJapan16 <- separate(tabelaJapan16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaJapan16 <- tabelaJapan16[-c(5)]

htmlUnitedStates16 <- html_session("https://www.formula1.com/en/results.html/2016/races/954/united-states/race-result.html") %>% read_html
html_tabelaUnitedStates16 <- htmlUnitedStates16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaUnitedStates16 <- html_tabelaUnitedStates16%>% html_table()
tabelaUnitedStates16 <-tabelaUnitedStates16[2:8]
tabelaUnitedStates16 <- separate(tabelaUnitedStates16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaUnitedStates16 <- tabelaUnitedStates16[-c(5)]

htmlMexico16 <- html_session("https://www.formula1.com/en/results.html/2016/races/955/mexico/race-result.html") %>% read_html
html_tabelaMexico16 <- htmlMexico16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaMexico16 <- html_tabelaMexico16%>% html_table()
tabelaMexico16 <-tabelaMexico16[2:8]
tabelaMexico16 <- separate(tabelaMexico16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaMexico16 <- tabelaMexico16[-c(5)]

htmlBrazil16 <- html_session("https://www.formula1.com/en/results.html/2016/races/956/brazil/race-result.html") %>% read_html
html_tabelaBrazil16 <- htmlBrazil16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaBrazil16 <- html_tabelaBrazil16%>% html_table()
tabelaBrazil16 <-tabelaBrazil16[2:8]
tabelaBrazil16 <- separate(tabelaBrazil16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaBrazil16 <- tabelaBrazil16[-c(5)]

htmlAbuDhabi16 <- html_session("https://www.formula1.com/en/results.html/2016/races/957/abu-dhabi/race-result.html") %>% read_html
html_tabelaAbuDhabi16 <- htmlAbuDhabi16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaAbuDhabi16 <- html_tabelaAbuDhabi16%>% html_table()
tabelaAbuDhabi16 <-tabelaAbuDhabi16[2:8]
tabelaAbuDhabi16 <- separate(tabelaAbuDhabi16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaAbuDhabi16 <- tabelaAbuDhabi16[-c(5)]


#tabela grand prix-ov

html <- html_session("https://en.wikipedia.org/wiki/2016_Formula_One_season") %>% read_html()
html_tabela <- html %>% html_nodes(xpath="//table[3]") %>% .[[1]]
tabelaGandPrix16 <- html_tabela %>% html_table()
tabelaGandPrix16[grep(",", tabelaGandPrix16[[1]]), 1] <- html_tabela %>%
  html_nodes(xpath="//span[@class='vcard']//a[@title]") %>%
  html_text()
tabelaGandPrix16<- tabelaGandPrix16[-c(22),]
tabelaGandPrix16<- separate(tabelaGandPrix16, Circuit, c("Circuit", "Town"), sep = ",", remove = TRUE,
                            convert = FALSE, extra = "warn", fill = "warn")
colnames(tabelaGandPrix16) <- c("Round","Name","Circuit.Name","Town","Date")
tabelaGandPrix16$Circuit.Length <- c("5.303", "5.412", "5.451","5.848", "4.655","3.337", "4.361","6.003", "4.326","5.891", "4.381", "4.574", "7.004", "5.793", "	5.065", "5.543", "5.807", "5.516", "4.304", "4.309", "5.554")
tabelaGandPrix16$Laps <- c("58", "57", "56", "53", "66", "78", "70", "51", "71", "52", "70", "67", "44", "53", "61", "56", "53", "56", "71", "71", "55")
tabelaGandPrix16$Date<- c("20.3.2016", "3.4.2016", "17.4.2016", "1.5.2016", "15.5.2016", "29.5.2016", "12.6.2016", "16.6.2016", "3.7.2016", "10.7.2016", "24.7.2016", "31.7.2016", "28.8.2016", "4.9.2016", "18.9.2016", "2.10.2016", "9.10.2016", "23.10.2016", "30.10.2016", "13.11.2016", "27.11.2016")

#tabela ekip

uvozitabelaekip <- function(){
  return(read.csv("podatki/ekipe.csv",
                  skip=0,
                  header=TRUE,
                  row.names=1,
                  na.string="-",
                  fileEncoding = "UTF-8"))
}
tabelaekip<-uvozitabelaekip()

#tabela dirkačev

uvozitabeladirkacev <- function(){
  return(read.csv("podatki/dirkači.csv",
                  skip=0,
                  header=TRUE,
                  row.names=1,
                  na.string="-",
                  fileEncoding = "UTF-8"))
}
tabeladirkacev<- uvozitabeladirkacev()
