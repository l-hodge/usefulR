#' Basic template for a DfE Research Report
#' @param
#'   ...,keep_tex,latex_engine,citation_package,highlight,fig_caption,md_extensions,template
#'   Arguments passed to \code{rmarkdown::\link{pdf_document}()}.
#' @return An R Markdown output format.
#' @export
basic_report <- function(...) {
  pdf_document_format("dfe-report-pdf", ...)
}

#' Bookdown style template for a DfE Research Report
#'
#' @importFrom bookdown pdf_book
#'
#' @return An R Markdown output format with bookdown features e.g. cross-referencing.
#' @export

research_report <- function(...) {
  fmt <- bookdown::pdf_book(...,
                            base_format = usefulR::basic_report)
  fmt$inherits <- "usefulR::basic_report"
  fmt
}
