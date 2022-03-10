## code to prepare `biol321Ids` dataset goes here
biol321Ids <- read.csv(file = "data-raw/raw/idsSpring2022.csv", stringsAsFactors = F)
usethis::use_data(biol321Ids, overwrite = T)
