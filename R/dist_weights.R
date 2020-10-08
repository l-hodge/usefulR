#' Create distributional weights
#'
#' @param earns Vector of earnings
#' @param rho An estimate of the elasticity of the marginal utility of income - default 1.3
#' @param summary Return summary
#' @param standardise Standardise the weights
#'
#'
#' @importFrom dplyr "%>%" mutate summarise select across everything group_by ungroup ntile
#' @importFrom stats median
#' @importFrom rlang .data
#'
#' @return A table of weights, either for whole input vector or summary of 5 quintiles.
#'
#' @export

dist_weights <- function(earns, rho = 1.3, summary = TRUE, standardise = FALSE){

  overall_median <- median(earns, na.rm = T)
  number <- length(earns)

  x <- as.data.frame(earns) %>%
       mutate(quintile = ntile(.data$earns, n = 5)) %>%
       group_by(.data$quintile) %>%
       mutate(median = median(earns, na.rm = T),
              weight = (overall_median / .data$median)^rho) %>%
       ungroup %>%
       select(-.data$earns)

  # Standardise the weights
  if(standardise == TRUE){
    x <- x %>% mutate(std_weight = (.data$weight / sum(.data$weight, na.rm = T)) * number)
  }

  # Summary
  if(summary == TRUE){
    x <- x %>%
         group_by(.data$quintile) %>%
         summarise(across(everything(), ~mean(.))) %>%
         ungroup
  }

  return(x)
}
