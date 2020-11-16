#' Use DfE's colour palette
#'
#' Provides easy to use DfE colour palettes
#'
#' @param colour Can select specific colours from c("blue", "red", "orange", "yellow", "green", "purple")
#' @param intensity Can select intensities from c(20,40,60,80,100)
#'
#' @importFrom grDevices rgb
#' @importFrom rlang missing_arg
#'
#' @examples
#' \dontrun{
#' pie(rep(1, length(dfe_colours)), col = dfe_colours)
#' }
#'
#' @export

dfe_colours <- function(colour = NULL, intensity = NULL){

  if(!is.null(intensity)){
    int <- paste0("p", intensity)
  } else{
    int <- rlang::missing_arg()
  }

  if(!is.null(colour)){
    col <- paste0(colour)
  }  else{
    col <- rlang::missing_arg()
  }

  grDevices::rgb(unlist(colour_palette$r[col, int]),
                 unlist(colour_palette$g[col, int]),
                 unlist(colour_palette$b[col, int]),
                 maxColorValue = 255)

}
