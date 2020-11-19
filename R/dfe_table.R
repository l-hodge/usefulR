#' DfE table styling
#'
#' @param df data.frame object to make into a LaTeX table
#'
#' @importFrom dplyr "%>%"
#' @importFrom knitr kable
#' @importFrom kableExtra row_spec column_spec kable_styling
#'
#' @return A LaTeX table object.
#'
#' @examples
#' dfe_tbl(head(mtcars)[1:4])
#'
#' @export

#\usepackage{colortbl}
#\usepackage{xcolor}

dfe_tbl <- function(df){
  knitr::kable(df, "latex", align =c("l")) %>%
    kableExtra::row_spec(0, background = "#C5D4DE", bold=TRUE) %>%
    kableExtra::column_spec(c(1,ncol(df)+1), latex_column_spec = c("|l", "l|")) %>%
    kableExtra::kable_styling(latex_options="scale_down")
}
