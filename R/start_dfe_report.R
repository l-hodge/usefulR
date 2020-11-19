#' Basic template for a DfE Research Report
#'
#' @param number_sections Number section headers (TRUE or FALSE)
#' @param ... Arguments passed to \code{rmarkdown::\link{pdf_document}()}.
#'
#' @return An R Markdown output format.
#' @export
basic_report <- function(number_sections = FALSE, ...) {
  pdf_document_format("dfe-report-pdf", ...)
}

#' Bookdown style template for a DfE Research Report
#'
#' @param ... Arguments passed to \code{bookdown::pdf_book()}
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
