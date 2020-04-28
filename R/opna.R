#' opna skjal
#'
#' @param ... 
#'
#' @return
#' @export
#'
#' @examples
opna <- function(...) {
  system(command = paste("open", ...))
}