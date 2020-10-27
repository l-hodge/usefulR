# Helper functions borrowed from: https://github.com/rstudio/rticles/blob/master/R/utils.R

# Helper function to see inside the package files
pkg_file <- function(...) system.file(..., package = "usefulR")

# Helper function to locate the custom LaTeX template
find_resource <- function(template, file = 'template.tex') {
  res <- pkg_file("rmarkdown", "templates", template, "resources", file)
  if (res == "") stop(
    "Couldn't find template file ", template, "/resources/", file, call. = FALSE
  )
  res
}

# Helper function to create a custom format derived from pdf_document that
# includes a custom LaTeX template
pdf_document_format <- function(
  format, template = find_resource(format, 'template.tex'), ...
) {
  fmt <- rmarkdown::pdf_document(..., template = template)
  fmt$inherits <- "pdf_document"
  fmt
}
