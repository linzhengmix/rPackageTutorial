# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#' Title hello world
#'
#' @return Hello, world!
#' @export
#'
#' @examples
#' library(rPackageTutorial)
#' hello()
hello <- function() {
  print("Hello, world!")
}
