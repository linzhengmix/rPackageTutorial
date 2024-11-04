


#' Title
#'
#' @param x an object of class \code{contents}.
#' @param ... additional arguments
#'
#' @import ggplot2
#'
#' @importFrom stats reorder
#'
#' @method plot  contents
#' @return a \code{ggplot2} graph
#' @export
#'
#' @examples
#' library(rPackageTutorial)
#' df_info <- contents(happiness)
#' plot(df_info)
plot.contents <- function(x, ...){
  if(!inherits(x, "contents")){
    stop("Object must be of class 'contents'")
  }

  classes <- x$varinfo$type
  variable = x$varinfo$varname
  classes_n = as.numeric(as.factor(classes))

  pct_n <- 100 * (1- x$varinfo$pct_miss)
  df <- data.frame(variable = variable,
                   classes = classes,
                   pct_n = pct_n,
                   classes_n = classes_n)

  ggplot(df, aes(x=reorder(variable, classes_n), y=pct_n, fill=classes)) +
    geom_bar(stat="identity") +
    labs(x="",y="Percent Available",
         caption=paste(x$nrow, "cases",x$ncol, "variables"), fill="Type") +
    guides(fill=guide_legend(reverse=TRUE)) +
    scale_y_continuous(breaks=seq(0, 100 ,20)) +
    coord_flip() +
    theme_bw()
}
