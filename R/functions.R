read_data <- function(url) {
  read_delim(url, " ")
}

plot_lines <- function(x) {
  ggplot(x, aes(x = speed, y = scrap, colour = line)) +
    geom_point() +
    geom_smooth(method = "lm")
}

fit_model1 <- function(x) {
  lm(scrap ~ speed + line, data = x)
}

