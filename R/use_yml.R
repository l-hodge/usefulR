#' Use azure pipeline check
#'
#' @export

use_azure_check <- function(){
  use_yml_template(template = "azure-pipeline-check.yml")
}

#' Use a yml template
#'
#' @param template yml file template to use
#'
#' @importFrom yaml read_yaml write_yaml
#'
#' @export
use_yml_template <- function(template){

  # Retrieve yml file template
  yml_file <- yaml::read_yaml(
                pkg_file("yaml", "templates", template)
              )

  # Edit yml file
  adj_yml_file <- rapply(
                    object = yml_file,
                    f = function(x) gsub(pattern = "packagename",
                                         replacement = basename(getwd()),
                                         x = x),
                    how = "list"
                  )

  # Write yml to package
  yaml::write_yaml(
          adj_yml_file,
          file.path(template)
        )

}
