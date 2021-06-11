#' DfE table styling
#'
#' Wrapper for knitr::kable to produce tables in the DfE style.
#'
#' @param df data.frame object to make into a DfE style table
#' @param caption caption for the table
#' @param label The table reference label. By default obtained from knitr chunk
#' @param row.names include row names in table
#' @param ... Other arguments passed to knitr::kable
#'
#' @importFrom dplyr "%>%"
#' @importFrom knitr kable
#' @importFrom kableExtra row_spec column_spec
#'
#' @return A LaTeX table object in the DfE style. Can also create DfE style-like HTML tables, although support is limited.
#'
#' @examples
#' dfe_tbl(head(mtcars)[1:4])
#'
#' @export

dfe_tbl <- function(df, label = knitr::opts_current$get('label'), caption = " ", row.names = TRUE, ...){

  if(row.names == TRUE){
    n = ncol(df)+1
  } else {
    n = ncol(df)
  }

  knitr::kable(df, align = c("l"), label = label, caption = caption, row.names = row.names, ...) %>%
    kableExtra::row_spec(0, background = "#C5D4DE", bold = TRUE) %>%
    kableExtra::column_spec(c(1, n), latex_column_spec = c("|l","l|"))
}
