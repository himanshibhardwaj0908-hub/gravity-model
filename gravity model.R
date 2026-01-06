library(dplyr)
india_data= read.csv('india_data.csv')
partner_data= read.csv('partner_data.csv')
distance_data= read.csv('distance_data.csv')
exports_data= read.csv('exports_data.csv')
colonial_data= read.csv('colonial_links.csv')
panel_data= partner_data %>%
  left_join(india_data, by = "year", suffix = c("_j", "_i"))
panel_data= panel_data %>%
  left_join(distance_data, by = "country_j")
panel_data= panel_data %>%
  left_join(exports_data, by = c("year", "country_j"))
panel_data <- panel_data %>%
  left_join(colonial_data, by = "country_j")
str(panel_data)
head(panel_data)
panel_data$country_i= "India"
head(panel_data)
panel_data <- panel_data %>% select(year, country_i, everything())
write.csv(panel_data, "merged_gravity_data.csv", row.names = FALSE)
getwd()
str(panel_data$exports)
panel_data <- panel_data %>%
  mutate(exports = as.numeric(gsub(",", "", exports))) 
str(panel_data$exports)
