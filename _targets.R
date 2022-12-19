# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  packages = c("tidyverse"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multicore")

# tar_make_future() configuration (okay to leave alone):
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Run the R scripts in the R/ folder with your custom functions:
tar_source("R/functions.R")
# source("other_functions.R") # Source other scripts as needed. # nolint

# Replace the target list below with your own:
list(
  tar_download(file1, "http://ritsokiguess.site/datafiles/soap.txt",
              paths = "data/soap.txt"),
  tar_target(soap, read_data(file1)),
  tar_target(plot1, plot_lines(soap)),
  tar_target(model1, fit_model1(soap)),
  tar_target(soap_report, "report/soap.Rmd", format = "file"),
  tar_target(spiders_report, "report/spiders.Rmd", format = "file"),
  tar_render(full_report, "report/report.Rmd")
)
