

#' @title Description of a data frame
#'
#' @param x an object of class \code{contents}.
#' @param digits number of significant digits to use for percentage.
#' @param ... additional arguments passed to the print function.
#'
#' @return NULL
#' @method print contents
#' @export
#'
#' @examples
#' library(rPackageTutorial)
#' df_info <- contents(happiness)
#' print(df_info)
print.contents <- function(x, digits=4, ...){
  if(!inherits(x, "contents")){
    stop("Object must be of class 'contents'")
  }
  cat("Data frame:", x$dfname, "\n")
  cat(x$nrow, "observations and", x$ncol, "variables\n")
  x$varinfo$varname <- ifelse(x$varinfo$n_unique == x$nrow,
                              paste0(x$varinfo$varname, "*"),
                              x$varinfo$varname)
  cat("size:", format(x$size, units="Mb"), "\n")
  print(x$varinfo, digits=digits, row.names=FALSE, ...)
}
