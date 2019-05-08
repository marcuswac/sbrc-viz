library(dplyr)
library(ggplot2)
library(pdftools)
library(purrr)
library(SnowballC)
library(stringr)
library(tidytext)
library(wordcloud)

extract_abstract <- function(text, pattern1 = "Abstract.", pattern2 = "Resumo.",
                             pattern3 = "\n1") {
  abstract <- unlist(str_split(text, fixed(pattern1)))[2]
  abstract <- unlist(str_split(abstract, fixed(pattern2)))[1]
  abstract <- unlist(str_split(abstract, fixed(pattern3)))[1]
  return(abstract)
}

extract_abstract_page <- function(pdf_file) {
  pdf_text(pdf_file) %>%
    keep(~ str_detect(.x, "Abstract"))
}
 
extract_abstract_pages_per_year <- function(ano, root_data_dir) {
  data_dir <- file.path(root_data_dir, ano)
  pdf_files <- list.files(data_dir, full.names = TRUE)
  map(pdf_files, extract_abstract_page)
}


root_data_dir <- "dados"
anos <- 2016:2019

# Teste para 2017

abstract_pages_2017 <- extract_abstract_pages_per_year(2017, root_data_dir)

abstract_2017 <- map(abstract_pages_2017, extract_abstract) %>%
  na.exclude()

