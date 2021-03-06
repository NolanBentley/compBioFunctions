#' Random gene selector
#'
#' @param id A length 1 character vector of your ID (should match a value in biol321Ids)
#' @param seed A length 1 numeric vector used to set pseudo-random assignments. This seed set per semester; do not change unless instructed to do so.
#' @param randomRow A length one logical vector. Only change this value if your Id is not in the biol321Ids object for some reason.
#'
#' @return The random humanGene row that was selected based on your ID
#' @export
#' @examples
#' # Typical use
#' rGene("nbb624")

rGene <- function(id,
                  seed = 20211017,
                  randomRow = F
                  ) {
    #Load data
    utils::data("biol321Ids", envir = environment())
    utils::data("humanGenes", envir = environment())
    idTable <- get("biol321Ids")
    df      <- get("humanGenes")

    #Establish controlled values
    instructorsGene <- "Q15848"
    if (!instructorsGene %in% df$Entry) {
        stop("instructors's gene missing.")
    }

    #Find matching ID
    row <- match(id, idTable[, 1])

    #Overide match if randomRow
    if (randomRow) {
        row <- sample(1:nrow(df),1)
    }
    #Check row
    if (is.na(row)) {
        stop("Id not found in biol321Ids. If this was expected (it probably wasn't), change randomRow to T.")
    }

    if (!is.numeric(seed) |
        length(seed) != 1) {
        stop("seed needs to be a length 1 numeric vector")
    }
    #Set seed and sample rows
    set.seed(seed)
    rowSample <- sample(1:nrow(df), size = nrow(df), replace = F)

    #Set instructors as instructorsGene
    instructorsRow  <- which(idTable[, 1] == "nbb624")
    iGeneRow        <- which(rowSample == which(df$Entry == instructorsGene))
    instructorsVal <- rowSample[instructorsRow]
    switchedVal    <- rowSample[iGeneRow]
    rowSample[instructorsRow] <- switchedVal
    rowSample[iGeneRow      ] <- instructorsVal

    return(df[rowSample[row],])
}
