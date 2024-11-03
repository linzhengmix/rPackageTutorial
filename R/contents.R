

#' @title Description of a data frame
#' @description
#' \code{contents} provides describes of the contents of a data frame.
#'
#'
#' @param data a data frame.
#'
#' @importFrom utils object.size
#'
#' @return a list with 4 components:
#'
#' @export
#'
#' @examples
#' df_info <- contents(happiness)
#' df_info
#' plot(df_info)
#'
contents <- function(data){
  if(!is.data.frame(data)){
    stop("You need to input a data frame")
  }

  dataname <- deparse(substitute(data))
  size <- object.size(data)

  varnames <- colnames(data)

  colnames <- c("pos", "variable", "type", "n_unique", "n_miss", "pct_miss")
  pos <- seq_along(data)
  varname <- colnames(data)
  type <- sapply(data, function(x) class(x)[1])
  n_unique <- sapply(data, function(x)length(unique(x)))
  n_miss <- sapply(data, function(x)sum(is.na(x)))
  pct_miss <- n_miss / nrow(data)
  varinfo <- data.frame(
    pos, varname, type, n_unique, n_miss, pct_miss
  )

  results <- list(dfname=dataname, size=size,
                  nrow=nrow(data), ncol=ncol(data),
                  varinfo=varinfo)
  class(results) <- c("contents","list")
  return(results)

}
