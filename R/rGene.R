#' Random gene selector
#'
#' @param id a length 1 character vector of your ID (should match a value in biol321Ids)
#' @param seed a length 1 numeric vector used to set pseudo-random assignments. This seed set per semester; do not change unless instructed to do so.
#' @param randomRow a length one logical vector. Only change this value if your Id is not in the biol321Ids object for some reason.
#' @return
#' @export
#'
#' @examples
#' assignedGene <- rGene("nbb624")
#' print(assignedGene[,1:4])

rGene <- function(id, seed = 20211017, randomRow = F) {
    #Load data
    utils::data("biol321Ids", envir = environment())
    utils::data("humanGenes", envir = environment())
    #Find matching ID
    row <- match(id, biol321Ids[, 1])
    #Overide match if randomRow
    if (randomRow) {
        row <- sample(1:nrow(humanGenes),1)
    }
    #Check row
    if (is.na(row)) {
        stop("Id not found in object. If this was expected, change randomRow to T")
    }

    if (!is.numeric(seed) |
        length(seed) != 1) {
        stop("seed needs to be a length 1 numeric vector")
    }
    #Set seed and
    set.seed(seed)
    currRow <- sample(1:nrow(humanGenes), size = nrow(humanGenes), replace = F)[row]
    return(humanGenes[currRow,])
}
