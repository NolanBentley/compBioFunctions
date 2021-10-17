## code to prepare `biol321Ids` dataset goes here
biol321Ids <- read.csv(file = "data-raw/raw/idsFall2021.csv", stringsAsFactors = F)
usethis::use_data(biol321Ids, overwrite = F)
