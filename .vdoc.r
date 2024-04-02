#
#
#
#
#
#
#
#
#
#
#
library(tidyverse)
library(dplyr)
library(pander)
library(readxl)
library(ggplot2movies)
library(ggplot2)
library(ggridges)
library(tidyr)
library(naniar) #replace to na
library(DT)

self <-  read_excel("../Datasets for Ben/Employer Completer Survey/self_Evaluation.xlsx")
employer <- read_excel("../Datasets for Ben/Employer Completer Survey/Employer_Evaluation.xlsx")
#
#
#
#
#
#
#
#| echo: true
#| code-fold: true
#| #| code-summary: "expand for full code"


self <- self %>% 
  replace_with_na_all(condition = ~.x == 5)

employer <- employer %>%
  replace_with_na_all(condition = ~.x == 5)
  
self <- self %>%
  mutate(who = "Individual") %>%
  mutate(`Avg Score` = round(rowMeans(select(., `Enable Student to Learn`: `Maintain Accurate Records`), na.rm = TRUE), 2))

   
employer <- employer %>% 
  filter(`Enable Student to Learn` < 5) %>% 
  mutate(who="Principal") %>% 
  mutate(`Avg Score` = round(rowMeans(select(., `Enable Student to Learn`: `Maintain Accurate Records`), na.rm = TRUE), 2)) 


#
#
#
#
#
#
#
#| echo: true
#| code-fold: true
#| #| code-summary: "expand for full code"


datatable(self, options=list(lengthMenu = c(5,10,30)), extensions="Responsive")
#
#
#
#
#
#| echo: true
#| code-fold: true
#| #| code-summary: "expand for full code"


datatable(employer, options=list(lengthMenu = c(5,10,30)), extensions="Responsive")
#
#
#
#
#
#
#
#| echo: true
#| code-fold: true
#| #| code-summary: "expand for full code"


self <- self %>%
  mutate(who = "Individual") %>%
  mutate(`Avg Score` = round(rowMeans(select(., `Enable Student to Learn`: `Maintain Accurate Records`), na.rm = TRUE), 2))

   
employer <- employer %>% 
  filter(`Enable Student to Learn` < 5) %>% 
  mutate(who="Principal") %>% 
  mutate(`Avg Score` = round(rowMeans(select(., `Enable Student to Learn`: `Maintain Accurate Records`), na.rm = TRUE), 2)) 



###Join data
bothsur <- inner_join(self, employer, by = "StudentID")


# no correlation between the Individual and Principal
ggplot(bothsur) +
  geom_point(aes(x = `Avg Score.x`, y = `Avg Score.y`), size = 3) +
  labs(title="Relation between Student and Employer Survey",x = "Average Score (Student)", y = "Average Score (Employer)")

#
#
#
#
