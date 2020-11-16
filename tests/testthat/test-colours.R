expect_equal(
  length(usefulR::dfe_colours()), 30
)
expect_equal(
  length(usefulR::dfe_colours("blue")), 5
)
expect_equal(
  length(usefulR::dfe_colours(intensity = 100)), 6
)
