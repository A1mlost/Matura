library(ggplot2)
library(tidyverse)
library(dplyr)

swiss_data <- read.csv("C:/Users/colte/Documents/.School/__MaturaProject/DataSimulation/STATPOP2021.csv", sep=";")%>%
  select(E_KOORD,N_KOORD, B21BTOT)

map_tile <- ggplot(swiss_data, aes(x=E_KOORD,y= N_KOORD)) +
  geom_tile(height=100, width=100,aes(fill=cut(B21BTOT,c(1,4,7,16,41,121,Inf)))) +
  scale_fill_manual(
    values=c("(1,4]"="#ffffb2",
             "(4,7]"="#fdd976",
             "(7,16]"="#feb243",
             "(16,41]"="#fd8d3c",
             "(41,121]"="#f03b20",
             "(121,Inf]"="#bd0026"), 
    labels=c("1-3","4-6","7-15","16-40","41-120",">120"),
    name="population per ha",
    na.value = "green") 
#  theme(axis.text.x = element_blank(),
 #       axis.text.y = element_blank(),
  #      axis.ticks = element_blank(),
   #     axis.title.y=element_blank(),
    #    axis.title.x=element_blank(),
        #rect = element_blank()#here i think you can put the map backdrop
  #)

map_tile


