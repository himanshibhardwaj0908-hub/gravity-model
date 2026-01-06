
install.packages(c("tidyverse", "broom"))

library(tidyverse)
library(broom)
panel_data <- panel_data %>%
  mutate(
    logX_ijt = log(exports),
        logY_it = log(GDP_i),
        logY_jt = log(GDP_j),
        logD_ij = log(distance)
      )
panel_data <- panel_data %>%
  select(-logy_jt)

# Running pooled OLS regression
pooled_ols <- lm(logX_ijt ~ logY_it + logY_jt + logD_ij + colonial_link, data = panel_data)
pooled_ols %>% tidy()
pooled_ols %>% glance()


pooled_ols %>% tidy() %>% write_csv("gravity_model_results.csv")
getwd()
summary(pooled_ols)
