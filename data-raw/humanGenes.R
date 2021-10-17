## code to prepare `humanGenes` dataset goes here
humanGenes <- openxlsx::read.xlsx("data-raw/raw/uniprotReviewedHumanGenes.xlsx")
usethis::use_data(humanGenes, overwrite = F)
