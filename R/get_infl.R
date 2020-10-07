#' Fetch Outturn and OBR forecast of inflation measures
#'
#' @param infl_measure Inflation measure; "CPI", "RPI" or "Deflator"
#' @param base_year Base year for indexing
#' @param add_yrs Number of additional years in series
#' @param lng_run Long-run rate, unless specified defaults to be 2\% for CPI and GDP Deflator and 3\% for RPI
#'
#' @importFrom dplyr mutate mutate_all select
#' @importFrom tidyr drop_na fill pivot_longer
#' @importFrom readxl read_excel
#' @importFrom utils download.file tail
#'
#' @return A \code{data.frame} containing an inflation series
#'
#' @examples
#' get_infl("CPI", base_year = 2020, add_yrs = 0, lng_run = 2)
#'
#' @export

get_infl <- function(infl_measure, base_year = 2020, add_yrs = 30, lng_run = NULL){

  # URL of data
  url <- "https://obr.uk/download/historical-official-forecasts-database/"

  # Create temp file path
  tmp <- tempfile("temp", fileext = ".xlsx")

  # Download the data
  utils::download.file(url, destfile = tmp, mode = "wb", quiet = TRUE)

  # Read the relevant sheet
  x <- readxl::read_excel(tmp, sheet = paste0(infl_measure), skip = 3)
  names(x)[1] <- "Date"

  # Fill so have latest data
  x <- tidyr::fill(x, -.data$Date, .direction = "down")

  # Format data
  x <- utils::tail(x, 1) %>% # take just the last row
       tidyr::pivot_longer(-.data$Date, names_to = "year", values_to = "perc") %>%
       dplyr::select(-.data$Date) %>%
       tidyr::drop_na() %>%
       dplyr::mutate_all(as.numeric)

  # Assume long run rate if not specified
  if(is.null(lng_run)){
    if(infl_measure == "CPI"){lng_run = 2}
    if(infl_measure == "Deflator"){lng_run = 2}
    if(infl_measure == "RPI"){lng_run = 3}
  }

  # Add aditional years at long run rate
  if(add_yrs != 0){
    long_run <- data.frame(year = (max(x$year) + 1):(max(x$year) + add_yrs),
                           perc = rep(lng_run, add_yrs))
    x <- rbind(x, long_run)
  }

  # Add an index with the base year as the first year, and one with base_year argument
  x <- x %>% dplyr::mutate(index = cumprod(c(1, 1 + .data$perc[-1] / 100))) %>%
             dplyr::mutate(new_index = ifelse(base_year == .data$year, .data$index, NA)) %>%
             tidyr::fill(.data$new_index, .direction = "updown") %>%
             dplyr::mutate(new_index = .data$index / .data$new_index)

  names(x)[4] <- paste0("index_", base_year)

  return(x)
}
