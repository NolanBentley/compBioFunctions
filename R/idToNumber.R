#' Convert strings to numbers for use in assigning random inputs based on unique identifiers
#'
#' @param id a character vector containing strings to convert to numbers
#' @param matchTable a character vector with all characters present in id
#' @param formatWidth a length 1 integer vector used to justify idMatch.
#'
#' @return a named numeric vector of the input characters converted to the concatenated matching position within matchTable
#' @export
#'
#' @examples idToNumber("nbb624")
idToNumber <- function(id,
                       matchTable  = c(letters, LETTERS, 0:9),
                       formatWidth = nchar(length(matchTable))) {
    # Check the input
    if (!is.character(matchTable)) {
        stop("id must be a character vector")
    }
    if (!is.character(matchTable)) {
        stop("matchTable must be a character vector")
    }
    if (!is.integer(formatWidth) | length(formatWidth) != 1) {
        stop("formatWidth must be a length 1 integer vector")
    }

    # Split the characters and convert to numbers
    id      <- tolower(id)
    idSplit <- strsplit(id, "")
    idMatch <- lapply(idSplit, match, table = matchTable)

    # Format output
    formatFunction <- function(x, width = formatWidth){
        x <- format(x, width = width, justify = "right")
        return(gsub(" ", 0, x))
    }
    idForm <- lapply(idMatch, formatFunction)
    idForm <- lapply(idForm , paste0, collapse = "")
    idForm <- unlist(idForm)

    # Convert to numeric and check for unexpected characters
    idNumeric        <- suppressWarnings(as.numeric(idForm))
    names(idNumeric) <- id
    if (any(is.na(idNumeric))) {
        errorText <- paste0(id, ": ", idForm)
        errorText <- errorText[is.na(idNumeric)]
        errorText  <- paste0(errorText, collapse = "\n")
        stop("non-matchTable characters detected in id:\n",
             errorText)
    }
    #Return the output
    return(idNumeric)
}
