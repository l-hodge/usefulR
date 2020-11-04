#' DfE's blue colour palette
#'
#' @importFrom grDevices rgb
#'
#' @examples
#' \dontrun{
#' pie(rep(1, length(dfe_blues)), col = dfe_blues)
#' }
#'
#' @export

dfe_blues <- rgb(c(16, 64, 112, 159, 207),
                 c(79, 114, 149, 185, 220),
                 c(117, 145, 172, 200, 227),
                 maxColorValue = 255)
