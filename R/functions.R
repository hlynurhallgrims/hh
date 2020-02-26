prosenta <- function (x, accuracy = NULL, scale = 100, prefix = "", suffix = "%",
                      big.mark = " ", decimal.mark = ",", trim = TRUE, ...)
{
  scales::number(x = x, accuracy = accuracy, scale = scale, prefix = prefix,
                 suffix = suffix, big.mark = big.mark, decimal.mark = decimal.mark,
                 trim = trim, ...)
}

punktur <- function(x) {
  format(x, big.mark = ".", decimal.mark = ",")
}

excel_round <- function(x, n = 0) {
  posneg = sign(x)
  z = abs(x)*10^n
  z = z + 0.5
  z = trunc(z)
  z = z/10^n
  z*posneg
}

cement <- function(...) {
  args <- rlang::ensyms(...)
  purrr::map_chr(args, rlang::as_string)
}

sauce <- function (x)
{
  if (stringr::str_detect(x, pattern = "\\.R$|\\.r$")) {
    source(x, encoding = "UTF-8")
  }
  else {
    source(knitr::purl(x, documentation = 0L, encoding = "UTF-8"),
           encoding = "UTF-8")
  }
}

do_it <- function() {
  
  mappa <- function(x) {
    
    if(fs::dir_exists(x)) {
      print(paste(" 0 -", x, "er nú þegar til. Skrifa ekki yfir."))
    } else {fs::dir_create(x)
      print(paste(" 1 -", x, "var ekki til. Bjó til."))}
  }
  
  faell <- function(x) {
    
    if (fs::file_exists(x)) {
      print(paste(" 0 -", x, "er nú þegar til. Skrifa ekki yfir."))
    } else {fs::file_create(x)
      print(paste(" 1 -", x, "var ekki til. Bjó til."))}
  }
  
    purrr::walk(.x = c("R", "data"),
              .f = mappa)

    purrr::walk(.x = c("make.R", "R/functions.R", "R/packages.R"),
                .f = faell)
  
}

cement <- function(...) {
  args <- ensyms(...)
  purrr::map_chr(args, as_string)
}