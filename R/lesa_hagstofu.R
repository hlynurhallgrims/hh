#' Lesum inn CSV skrár sem fengnar eru af Hagstofuvefnum
#'
#' @param file 
#' @description Flýtiwrapper utan um read_delim, sérstaklega fyrir CSV skrár af Hagstofuvefnum. 
#' @return
#' @export
#'
#' @examples lesa_hagstofu("MAN03200.csv")
lesa_hagstofu <- function(file) {
  
  readr::read_delim(
    file, 
    ";", escape_double = FALSE, 
    locale = readr::locale(
      decimal_mark = ",", 
      grouping_mark = ".",
      encoding = "ISO-8859-1"
    ), 
    trim_ws = TRUE, skip = 1
  )
}