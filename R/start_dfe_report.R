#' Template for a DfE Research Report
#' @param
#'   ...,keep_tex,latex_engine,citation_package,highlight,fig_caption,md_extensions,template
#'   Arguments passed to \code{rmarkdown::\link{pdf_document}()}.
#' @return An R Markdown output format.
#' @export
research_report <- function(...) {
  pdf_document_format("dfe-report-pdf", ...)
}

#' Initiate an rmarkdown DfE templated report
#'
#' @param title
#'
#' @export

start_dfe_report <- function(){

}
