library(tidyverse)
library(haven)
library(DHS.rates)


##read in the stata dta files
options(survey.lonely.psu = "adjust")

survey_data_2003 <- read_dta(file = "../dhs_datasets/mr_2003.dta")
survey_data_2008 <- read_dta(file = "../dhs_datasets/mr_2008.dta")
survey_data_2013 <- read_dta(file = "../dhs_datasets/mr_2013.dta")

### Calculating rates

#set global option for adjusting the psus
options(survey.lonely.psu = "adjust")

#####################    2003 dataset   ###########################
#survey_data_2003 %>% group_by(b5) %>% summarise(
#                                                  smallest = min(b2),
#                                                  n = n()
#                                                )
Years_2003 <- paste(seq(1998, 2002, 1), 12, sep = "-")

#whole country
nmr_2003 <- lapply(Years_2003, function(x) {
  
  chmort(survey_data_2003, JK = TRUE, CL = 95, Cluster = "v021", Strata = "v022", 
         Weight = "v005", Period = 12, PeriodEnd = x)
  
})

#by state
nmr_2003_state <- lapply(Years_2003, function(x) {
  
  chmort(survey_data_2003, JK = TRUE, CL = 95, Cluster = "v021", Strata = "v022", 
         Weight = "v005", Period = 12, PeriodEnd = x, Class = "sstate")
  
})

#by region
nmr_2003_region <- lapply(Years_2003, function(x) {
  
  chmort(survey_data_2003, JK = TRUE, CL = 95, Cluster = "v021", Strata = "v022", 
         Weight = "v005", Period = 12, PeriodEnd = x, Class = "v024")
  
})
 

##########################  2008 dataset   ##################
Years_2008 <- paste(seq(2003, 2007, 1), 12, sep = "-")

#whole country
nmr_2008 <- lapply(Years_2008, function(x) {
  chmort(survey_data_2008, JK = TRUE, CL = 95, Cluster = "v021", Strata = "v022", 
         Weight = "v005", Period = 12, PeriodEnd = x)
})

###by state
nmr_2008_state <- lapply(Years_2008, function(x) {
  chmort(survey_data_2008, JK = TRUE, CL = 95, Cluster = "v021", Strata = "v022", 
         Weight = "v005", Period = 12, PeriodEnd = x, Class = "sstate")
})

#by region
nmr_2008_region <- lapply(Years_2008, function(x) {
  
  chmort(survey_data_2008, JK = TRUE, CL = 95, Cluster = "v021", Strata = "v022", 
         Weight = "v005", Period = 12, PeriodEnd = x, Class = "v024")
  
})


#####################  2013 dataset     #####################
Years_2013 <- paste(seq(2008, 2012, 1), 12, sep = "-")

##whole country
nmr_2013 <- lapply(Years_2013, function(x) {
  chmort(survey_data_2013, JK = TRUE, CL = 95, Cluster = "v021", Strata = "v022", 
         Weight = "v005", Period = 12, PeriodEnd = x)
})

#by state
nmr_2013_state <- lapply(Years_2013, function(x) {
  chmort(survey_data_2013, JK = TRUE, CL = 95, Cluster = "v021", Strata = "v022", 
         Weight = "v005", Period = 12, PeriodEnd = x, Class = "sstate")
})

#by region
nmr_2013_region <- lapply(Years_2013, function(x) {
  chmort(survey_data_2013, JK = TRUE, CL = 95, Cluster = "v021", Strata = "v022", 
         Weight = "v005", Period = 12, PeriodEnd = x, Class = "v024")
})







