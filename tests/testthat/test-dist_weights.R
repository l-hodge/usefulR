earns <- rlnorm(10000) * 30000

expect_equal(
  nrow(dist_weights(earns = earns, rho = 1.3, summary = TRUE, standardise = FALSE)), 5
)
expect_equal(
  ncol(dist_weights(earns = earns, rho = 1.3, summary = TRUE, standardise = FALSE)), 3
)


expect_equal(
  ncol(dist_weights(earns = earns, rho = 1.3, summary = TRUE, standardise = TRUE)), 4
)

expect_equal(
  sum(dist_weights(earns = earns, rho = 1.3, summary = FALSE, standardise = FALSE))$std_weight, 10000
)
