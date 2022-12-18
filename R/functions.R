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

dummy_dep <- function(soap_report_file, data, graph, model) {
  soap_report_file
}

render_final <- function(full_report_file, soap_report) {
  rmarkdown::render(full_report_file,
                    knit_root_dir = getwd(),
                    quiet = TRUE)
}
