expect_equal(
  nrow(get_infl("CPI", base_year = 2020, add_yrs = 2)),
  nrow(get_infl("CPI", base_year = 2020, add_yrs = 0))+2
)
