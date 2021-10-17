## code to prepare `humanGenes` dataset goes here
humanGenes <- openxlsx::read.xlsx("inst/extdata/uniprotReviewedHumanGenes.xlsx")
usethis::use_data(humanGenes, overwrite = F)
