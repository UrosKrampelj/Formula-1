library(knitr)
library(rvest)
library(dplyr)
library(gsubfn)
library(ggplot2)
library(tidyr)
library(readr)

#tabela zmagovalcev

htmlZmagovalci16 <- html_session("https://www.formula1.com/en/results.html/2016/races/94/great-britain/race-result.html") %>% read_html
html_tabelaZmagovalci16 <- htmlZmagovalci16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaZmagovalci16 <- html_tabelaZmagovalci16%>% html_table()
tabelaZmagovalci16 <-tabelaZmagovalci16[2:8]
tabelaZmagovalci16 <- separate(tabelaZmagovalci16, Winner, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE, 
         convert = FALSE, extra = "warn", fill = "warn")
tabelaZmagovalci16 <- tabelaZmagovalci16[-c(5)]

#tabele rezultatov posameznih dirk
htmlAvstralija16 <- html_session("https://www.formula1.com/en/results.html/2016/races/938/australia.html") %>% read_html
html_tabelaAvstralija16 <- htmlAvstralija16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaAvstralija16 <- html_tabelaAvstralija16%>% html_table()
tabelaAvstralija16 <-tabelaAvstralija16[2:8]
tabelaAvstralija16 <- separate(tabelaAvstralija16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaAvstralija16 <- tabelaAvstralija16[-c(5)]
tabelaAvstralija16$Circuit <- rep("Australia",nrow(tabelaAvstralija16))
tabelaAvstralija16$Start <- c("1", "5", "4", "2", "8", "12", "19", "7", "16", "21", "20", "13", "17", "14", "15", "22", "9", "11", "10", "6", "3","18")

htmlBahrain16 <- html_session("https://www.formula1.com/en/results.html/2016/races/939/bahrain/race-result.html") %>% read_html
html_tabelaBahrain16 <- htmlBahrain16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaBahrain16 <- html_tabelaBahrain16%>% html_table()
tabelaBahrain16 <-tabelaBahrain16[2:8]
tabelaBahrain16 <- separate(tabelaBahrain16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaBahrain16 <- tabelaBahrain16[-c(5)]
tabelaBahrain16$Circuit <- rep("Bahrain",nrow(tabelaBahrain16))
tabelaBahrain16$Start <- c("2", "4", "1", "5", "9", "10", "15", "7", "6", "12", "22", "17", "16", "21", "8", "18", "20", "11", "13", "14", "3","19")

htmlChina16 <- html_session("https://www.formula1.com/en/results.html/2016/races/940/china/race-result.html") %>% read_html
html_tabelaChina16 <- htmlChina16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaChina16 <- html_tabelaChina16%>% html_table()
tabelaChina16 <-tabelaChina16[2:8]
tabelaChina16 <- separate(tabelaChina16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaChina16 <- tabelaChina16[-c(5)]
tabelaChina16$Circuit <- rep("China",nrow(tabelaChina16))
tabelaChina16$Start <- c("1", "4", "6", "2", "3", "10","22","9", "8", "5", "7", "11", "12", "18", "13", "15", "17", "21", "14", "16", "20", "19")

htmlRussia16 <- html_session("https://www.formula1.com/en/results.html/2016/races/942/spain/race-result.html") %>% read_html
html_tabelaRussia16 <- htmlRussia16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaRussia16 <- html_tabelaRussia16%>% html_table()
tabelaRussia16 <-tabelaRussia16[2:8]
tabelaRussia16 <- separate(tabelaRussia16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaRussia16 <- tabelaRussia16[-c(5)]
tabelaRussia16$Circuit <- rep("Russia",nrow(tabelaRussia16))
tabelaRussia16$Start <- c("9", "3", "7", "5", "2", "11", "6", "4","12", "8", "16", "22", "18", "19", "17", "20", "21", "15", "14", "13", "10", "1")

htmlSpain16 <- html_session("https://www.formula1.com/en/results.html/2016/races/942/spain/race-result.html") %>% read_html
html_tabelaSpain16 <- htmlSpain16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaSpain16 <- html_tabelaSpain16%>% html_table()
tabelaSpain16 <-tabelaSpain16[2:8]
tabelaSpain16 <- separate(tabelaSpain16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaSpain16 <- tabelaSpain16[-c(5)]
tabelaSpain16$Circuit <- rep("Spain",nrow(tabelaSpain16))
tabelaSpain16$Start <- c("4", "5", "6", "3", "7", "8", "9", "18","12", "13", "16", "19", "17", "20", "15", "21", "22", "14", "10", "11", "1", "2")

htmlMonaco16 <- html_session("https://www.formula1.com/en/results.html/2016/races/943/monaco/race-result.html") %>% read_html
html_tabelaMonaco16 <- htmlMonaco16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaMonaco16 <- html_tabelaMonaco16%>% html_table()
tabelaMonaco16 <-tabelaMonaco16[2:8]
tabelaMonaco16 <- separate(tabelaMonaco16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaMonaco16 <- tabelaMonaco16[-c(5)]
tabelaMonaco16$Circuit <- rep("Monaco",nrow(tabelaMonaco16))
tabelaMonaco16$Start <- c("3", "1", "7", "4", "9", "5", "2", "6","13", "14", "12", "10", "15", "20", "19", "17", "21", "22", "16", "8", "11", "18")

htmlCanada16 <- html_session("https://www.formula1.com/en/results.html/2016/races/944/canada/race-result.html") %>% read_html
html_tabelaCanada16 <- htmlCanada16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaCanada16 <- html_tabelaCanada16%>% html_table()
tabelaCanada16 <-tabelaCanada16[2:8]
tabelaCanada16 <- separate(tabelaCanada16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaCanada16 <- tabelaCanada16[-c(5)]
tabelaCanada16$Circuit <- rep("Canada",nrow(tabelaCanada16))
tabelaCanada16$Start <- c("1", "3", "7", "5", "2", "6", "4","9", "20", "11", "10", "15", "13", "14", "21", "22", "17", "18", "19", "8", "16","12")

htmlEurope16 <- html_session("https://www.formula1.com/en/results.html/2016/races/958/europe/race-result.html") %>% read_html
html_tabelaEurope16 <- htmlEurope16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaEurope16 <- html_tabelaEurope16%>% html_table()
tabelaEurope16 <-tabelaEurope16[2:8]
tabelaEurope16 <- separate(tabelaEurope16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaEurope16 <- tabelaEurope16[-c(5)]
tabelaEurope16$Circuit <- rep("Europe",nrow(tabelaEurope16))
tabelaEurope16$Start <- c("1", "3", "7", "4", "10", "8", "2", "9","12", "5", "19", "15", "11", "22", "21", "14", "20", "16", "13", "17", "18","6")

htmlAustria16 <- html_session("https://www.formula1.com/en/results.html/2016/races/945/austria/race-result.html") %>% read_html
html_tabelaAustria16 <- htmlAustria16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaAustria16 <- html_tabelaAustria16%>% html_table()
tabelaAustria16 <-tabelaAustria16[2:8]
tabelaAustria16 <- separate(tabelaAustria16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaAustria16 <- tabelaAustria16[-c(5)]
tabelaAustria16$Circuit <- rep("Austria",nrow(tabelaAustria16))
tabelaAustria16$Start <- c("1", "8", "4", "6", "5", "3", "13", "15","7", "12", "11", "19", "21", "17", "18", "20", "16", "14", "2", "10", "9", "22")

htmlGreatBritain16 <- html_session("https://www.formula1.com/en/results.html/2016/races/946/great-britain/race-result.html") %>% read_html
html_tabelaGreatBritain16 <- htmlGreatBritain16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaGreatBritain16 <- html_tabelaGreatBritain16%>% html_table()
tabelaGreatBritain16 <-tabelaGreatBritain16[2:8]
tabelaGreatBritain16 <- separate(tabelaGreatBritain16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaGreatBritain16 <- tabelaGreatBritain16[-c(5)]
tabelaGreatBritain16$Circuit <- rep("GreatBritain",nrow(tabelaGreatBritain16))
tabelaGreatBritain16$Start <- c("1", "3", "2", "4", "5", "10", "8", "7","11", "15", "12", "17", "9", "6", "21", "14", "16", "18", "19", "13", "22", "20")

htmlHungary16 <- html_session("https://www.formula1.com/en/results.html/2016/races/947/hungary/race-result.html") %>% read_html
html_tabelaHungary16 <- htmlHungary16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaHungary16 <- html_tabelaHungary16%>% html_table()
tabelaHungary16 <-tabelaHungary16[2:8]
tabelaHungary16 <- separate(tabelaHungary16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaHungary16 <- tabelaHungary16[-c(5)]
tabelaHungary16$Circuit <- rep("Hungary",nrow(tabelaHungary16))
tabelaHungary16$Start <- c("2", "1", "3", "5", "4", "14", "7", "6","10", "9", "13", "17", "15", "11", "19", "12", "16", "18", "20", "22", "21", "8")

htmlGermany16 <- html_session("https://www.formula1.com/en/results.html/2016/races/948/germany/race-result.html") %>% read_html
html_tabelaGermany16 <- htmlGermany16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaGermany16 <- html_tabelaGermany16%>% html_table()
tabelaGermany16 <-tabelaGermany16[2:8]
tabelaGermany16 <- separate(tabelaGermany16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaGermany16 <- tabelaGermany16[-c(5)]
tabelaGermany16$Circuit <- rep("Germany",nrow(tabelaGermany16))
tabelaGermany16$Start <- c("2", "3", "4", "1", "6", "5", "8", "12","7", "9", "11", "13", "20", "15", "18", "16", "17", "22", "14", "19", "21", "10")

htmlBelgium16 <- html_session("https://www.formula1.com/en/results.html/2016/races/949/belgium/race-result.html") %>% read_html
html_tabelaBelgium16 <- htmlBelgium16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaBelgium16 <- html_tabelaBelgium16%>% html_table()
tabelaBelgium16 <-tabelaBelgium16[2:8]
tabelaBelgium16 <- separate(tabelaBelgium16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaBelgium16 <- tabelaBelgium16[-c(5)]
tabelaBelgium16$Circuit <- rep("Belgium",nrow(tabelaBelgium16))
tabelaBelgium16$Start <- c("1", "5", "21", "7", "6", "4", "22", "8","3", "10", "2", "18", "11", "19", "13", "17", "16", "12", "20", "14", "9", "15")

htmlItaly16 <- html_session("https://www.formula1.com/en/results.html/2016/races/950/italy/race-result.html") %>% read_html
html_tabelaItaly16 <- htmlItaly16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaItaly16 <- html_tabelaItaly16%>% html_table()
tabelaItaly16 <-tabelaItaly16[2:8]
tabelaItaly16 <- separate(tabelaItaly16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaItaly16 <- tabelaItaly16[-c(5)]
tabelaItaly16$Circuit <- rep("Italy",nrow(tabelaItaly16))
tabelaItaly16$Start <- c("2", "1", "3", "4", "6", "5", "7", "8","11", "9", "17", "14", "10", "12", "15", "19", "21", "22", "16", "13", "20", "18")

htmlSingapore16 <- html_session("https://www.formula1.com/en/results.html/2016/races/951/singapore/race-result.html") %>% read_html
html_tabelaSingapore16 <- htmlSingapore16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaSingapore16 <- html_tabelaSingapore16%>% html_table()
tabelaSingapore16 <-tabelaSingapore16[2:8]
tabelaSingapore16 <- separate(tabelaSingapore16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaSingapore16 <- tabelaSingapore16[-c(5)]
tabelaSingapore16$Circuit <- rep("Singapore",nrow(tabelaSingapore16))
tabelaSingapore16$Start <- c("1", "2", "3", "5", "22", "4", "9", "17","7", "15", "13", "11", "16", "6", "18", "19", "14", "21", "12", "10", "8", "20")

htmlMalaysia16 <- html_session("https://www.formula1.com/en/results.html/2016/races/952/malaysia/race-result.html") %>% read_html
html_tabelaMalaysia16 <- htmlMalaysia16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaMalaysia16 <- html_tabelaMalaysia16%>% html_table()
tabelaMalaysia16 <-tabelaMalaysia16[2:8]
tabelaMalaysia16 <- separate(tabelaMalaysia16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaMalaysia16 <- tabelaMalaysia16[-c(5)]
tabelaMalaysia16$Circuit <- rep("Malaysia",nrow(tabelaMalaysia16))
tabelaMalaysia16$Start <- c("4", "3", "2", "6", "11", "7", "22", "8","9", "19", "16", "17", "10", "15", "21", "20", "18", "1", "13", "14", "12", "5")

htmlJapan16 <- html_session("https://www.formula1.com/en/results.html/2016/races/953/japan/race-result.html") %>% read_html
html_tabelaJapan16 <- htmlJapan16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaJapan16 <- html_tabelaJapan16%>% html_table()
tabelaJapan16 <-tabelaJapan16[2:8]
tabelaJapan16 <- separate(tabelaJapan16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaJapan16 <- tabelaJapan16[-c(5)]
tabelaJapan16$Circuit <- rep("Japan",nrow(tabelaJapan16))
tabelaJapan16$Start <- c("1", "3", "2", "6", "8", "4", "5", "9","12", "11", "7", "16", "13", "17", "18", "15", "14", "22", "19", "10", "20", "21")

htmlUnitedStates16 <- html_session("https://www.formula1.com/en/results.html/2016/races/954/united-states/race-result.html") %>% read_html
html_tabelaUnitedStates16 <- htmlUnitedStates16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaUnitedStates16 <- html_tabelaUnitedStates16%>% html_table()
tabelaUnitedStates16 <-tabelaUnitedStates16[2:8]
tabelaUnitedStates16 <- separate(tabelaUnitedStates16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaUnitedStates16 <- tabelaUnitedStates16[-c(5)]
tabelaUnitedStates16$Circuit <- rep("UnitedStates",nrow(tabelaUnitedStates16))
tabelaUnitedStates16$Start <- c("1", "2", "3", "6", "12", "10", "9", "11","19", "17", "13", "18", "15", "16", "21", "8", "20", "22", "5", "4", "14", "7")

htmlMexico16 <- html_session("https://www.formula1.com/en/results.html/2016/races/955/mexico/race-result.html") %>% read_html
html_tabelaMexico16 <- htmlMexico16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaMexico16 <- html_tabelaMexico16%>% html_table()
tabelaMexico16 <-tabelaMexico16[2:8]
tabelaMexico16 <- separate(tabelaMexico16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaMexico16 <- tabelaMexico16[-c(5)]
tabelaMexico16$Circuit <- rep("Mexico",nrow(tabelaMexico16))
tabelaMexico16$Start <- c("1", "2", "4", "3", "7", "6", "5", "8","9", "12", "15", "13", "11", "21", "19", "10", "14", "18", "17", "22", "20", "16")

htmlBrazil16 <- html_session("https://www.formula1.com/en/results.html/2016/races/956/brazil/race-result.html") %>% read_html
html_tabelaBrazil16 <- htmlBrazil16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaBrazil16 <- html_tabelaBrazil16%>% html_table()
tabelaBrazil16 <-tabelaBrazil16[2:8]
tabelaBrazil16 <- separate(tabelaBrazil16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaBrazil16 <- tabelaBrazil16[-c(5)]
tabelaBrazil16$Circuit <- rep("Brazil",nrow(tabelaBrazil16))
tabelaBrazil16$Start <- c("1", "2", "4", "9", "5", "15", "8", "6","21", "10", "11", "22", "14", "18", "19", "17", "12", "13", "16", "3", "20", "7")

htmlAbuDhabi16 <- html_session("https://www.formula1.com/en/results.html/2016/races/957/abu-dhabi/race-result.html") %>% read_html
html_tabelaAbuDhabi16 <- htmlAbuDhabi16 %>% html_nodes(xpath="//table[1]") %>% .[[1]]
tabelaAbuDhabi16 <- html_tabelaAbuDhabi16%>% html_table()
tabelaAbuDhabi16 <-tabelaAbuDhabi16[2:8]
tabelaAbuDhabi16 <- separate(tabelaAbuDhabi16, Driver, c("Name", "Surname", "Short"), sep = "\n", remove = TRUE,
         convert = FALSE, extra = "warn", fill = "warn")
tabelaAbuDhabi16 <- tabelaAbuDhabi16[-c(5)]
tabelaAbuDhabi16$Circuit <- rep("AbuDhabi",nrow(tabelaAbuDhabi16))
tabelaAbuDhabi16$Start <- c("1", "2", "5", "6", "3", "4", "7", "8","10", "9", "14", "13", "20", "16", "22", "19", "15", "21", "17", "12", "11", "18")

#združene tabele rezultatov
ultimatetabela <- rbind(tabelaAvstralija16, tabelaBahrain16, tabelaChina16, tabelaRussia16, tabelaSpain16, tabelaMonaco16, 
                        tabelaCanada16, tabelaEurope16, tabelaAustria16, tabelaGreatBritain16, tabelaHungary16, tabelaGermany16,
                        tabelaBelgium16, tabelaItaly16, tabelaSingapore16, tabelaMalaysia16, tabelaJapan16, tabelaUnitedStates16, 
                        tabelaMexico16, tabelaBrazil16, tabelaAbuDhabi16)


#tabela grand prix-ov

html <- html_session("https://en.wikipedia.org/wiki/2016_Formula_One_season") %>% read_html()
html_tabela <- html %>% html_nodes(xpath="//table[3]") %>% .[[1]]
tabelaGrandPrix16 <- html_tabela %>% html_table()
tabelaGrandPrix16[grep(",", tabelaGrandPrix16[[1]]), 1] <- html_tabela %>%
  html_nodes(xpath="//span[@class='vcard']//a[@title]") %>%
  html_text()
tabelaGrandPrix16<- tabelaGrandPrix16[-c(22),]
tabelaGrandPrix16<- separate(tabelaGrandPrix16, Circuit, c("Circuit", "Town"), sep = ",", remove = TRUE,
                            convert = FALSE, extra = "warn", fill = "warn")
colnames(tabelaGrandPrix16) <- c("Round","Name","Circuit.Name","Town","Date")
tabelaGrandPrix16$Circuit.Length <- c("5.303", "5.412", "5.451","5.848", "4.655","3.337", "4.361","6.003", "4.326","5.891", "4.381", "4.574", "7.004", "5.793", "	5.065", "5.543", "5.807", "5.516", "4.304", "4.309", "5.554")
tabelaGrandPrix16$Laps <- c("58", "57", "56", "53", "66", "78", "70", "51", "71", "52", "70", "67", "44", "53", "61", "56", "53", "56", "71", "71", "55")
tabelaGrandPrix16$Date<- c("20.3.2016", "3.4.2016", "17.4.2016", "1.5.2016", "15.5.2016", "29.5.2016", "12.6.2016", "16.6.2016", "3.7.2016", "10.7.2016", "24.7.2016", "31.7.2016", "28.8.2016", "4.9.2016", "18.9.2016", "2.10.2016", "9.10.2016", "23.10.2016", "30.10.2016", "13.11.2016", "27.11.2016")

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