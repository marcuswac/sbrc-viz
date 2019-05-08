library(dplyr)

root_data_dir <- "dados"

download_from_single_file <- function(ano, url, root_data_dir, )

# Download SBRC 2019

ano <- 2019
data_dir <- file.path(root_data_dir, ano) 
dir.create(data_dir)
file_url <- "http://sbrc2019.sbc.org.br/wp-content/uploads/2019/05/sbrc2019.pdf"
fila_name <- basename(file_url)
file_path <- file.path(data_dir, file_name)

download.file(file_url, file_path)

# Download SBRC 2018

ano <- 2018
data_dir <- file.path(root_data_dir, ano)
dir.create(data_dir)

id1 <- 2402
id2 <- 2366

num_papers <- 96

for (i in 0:(num_papers-1)) {
  file_url <- paste("http://sol.sbc.org.br/index.php/sbrc/article/download",
                id1 + i, id2 + i, sep = "/")
  file_name <- paste0("paper", i+1, ".pdf")
  file_path <- file.path(data_dir, file_name)
  
  download.file(file_url, file_path) 
}

# Download SBRC 2017

ano <- 2017
data_dir <- file.path(root_data_dir, ano)
dir.create(data_dir)

id1 <- 2609
id2 <- 2571

num_papers <- 78

for (i in 0:(num_papers-1)) {
  file_url <- paste("http://sol.sbc.org.br/index.php/sbrc/article/download",
                    id1 + i, id2 + i, sep = "/")
  file_name <- paste0("paper", i+1, ".pdf")
  file_path <- file.path(data_dir, file_name)
  
  download.file(file_url, file_path) 
}

# Download SBRC 2016

ano <- 2016
data_dir <- file.path(root_data_dir, ano) 
dir.create(data_dir)
file_url <- "http://www.sbrc2016.ufba.br/downloads/anais/proceedingsSBRC2016.pdf"
fila_name <- basename(file_url)
file_path <- file.path(data_dir, file_name)

download.file(file_url, file_path)
