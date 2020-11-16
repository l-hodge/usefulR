# Create the full DfE colour palette

r = data.frame(p100 = c(16, 138, 232, 194, 0, 38),
               p80 = c(64, 161, 237, 206, 51, 81),
               p60 = c(112, 185, 241, 218, 102, 125),
               p40 = c(159, 208, 246, 231, 153, 168),
               p20 = c(207, 232, 250, 243, 207, 212))

g = data.frame(p100 = c(79, 37, 125, 162, 71, 8),
               p80 = c(114, 81, 151, 181, 108, 57),
               p60 = c(149, 124, 177, 199, 145, 107),
               p40 = c(185, 168, 203, 218, 181, 156),
               p20 = c(220, 211, 229, 236, 218, 206))

b = data.frame(p100 = c(117, 41, 30, 4, 18, 89),
               p80 = c(145, 84, 75, 54, 65, 122),
               p60 = c(172, 127, 120, 104, 113, 155),
               p40 = c(200, 169, 165, 135, 160, 189),
               p20 = c(227, 212, 210, 205, 189, 222))


row.names(r) = c("blue", "red", "orange", "yellow", "green", "purple")
row.names(g) = c("blue", "red", "orange", "yellow", "green", "purple")
row.names(b) = c("blue", "red", "orange", "yellow", "green", "purple")

colour_palette <- list(r=r,g=g,b=b)

usethis::use_data(colour_palette, internal = TRUE, overwrite = TRUE)
