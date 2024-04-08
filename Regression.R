library(tidyverse)
library(dplyr)
library(pander)
library(readxl)
library(ggplot2movies)
library(ggplot2)
library(ggridges)
library(tidyr)
library(naniar) #replace to n
library(arrow)




self <-  read_excel("/Users/tanglin/Library/CloudStorage/OneDrive-BYU-Idaho/kelinseniorproject/new_project/Self_Evaluation.xlsx")
employer <- read_excel("/Users/tanglin/Library/CloudStorage/OneDrive-BYU-Idaho/kelinseniorproject/new_project/Employer_Evaluation.xlsx")
dem <- read_parquet('/Users/tanglin/Library/CloudStorage/OneDrive-BYU-Idaho/kelinseniorproject/new_project/demographics.parquet') 