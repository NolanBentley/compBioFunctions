## code to prepare `humanGenes` dataset goes here
humanGenes <- openxlsx::read.xlsx("data-raw/raw/uniprotReviewedHumanGenes.xlsx",sheet = 1)
attributes(humanGenes)$minLen <- 200
attributes(humanGenes)$maxLen <- 2000
humanGenes <- humanGenes[humanGenes$Length >= attributes(humanGenes)$minLen, ]
humanGenes <- humanGenes[humanGenes$Length <= attributes(humanGenes)$maxLen, ]

usethis::use_data(humanGenes, overwrite = F)
