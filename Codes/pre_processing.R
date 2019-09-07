library(tidyverse)
library(haven)
library(DHS.rates)


##read in the stata dta files

survey_data_2003 <- read_dta(file = "../dhs_datasets/mr_2003.dta")
survey_data_2008 <- read_dta(file = "../dhs_datasets/mr_2008.dta")
survey_data_2013 <- read_dta(file = "../dhs_datasets/mr_2013.dta")










