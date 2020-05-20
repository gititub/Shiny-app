library(DT)
library(MASS)
library(shiny)
library(tidyverse)
library(readr)
library(ggplot2)
setwd("~/R/App/MyApp")
data("iris")


shinyUI(fluidPage(
    titlePanel("Iris"),
    navlistPanel( tabPanel("IrisData",
                           fluidRow(column(DT::dataTableOutput("iris")
                                           ,width = 12))
                           ),
                  tabPanel("Sepal",
                           sidebarLayout(sidebarPanel(
                             checkboxInput("fit","fit")
                           ),
                                         mainPanel(
                                           plotOutput("plot1")
                                         )
                           )
                           ),
                  tabPanel("Petal",
                           sidebarLayout(sidebarPanel(
                             checkboxInput("fit2","fit")
                             ),
                                         mainPanel(
                                           plotOutput("plot2")
                                         )
                           )
                  ),
                  tabPanel("Species",
                           sidebarLayout(sidebarPanel(
                             checkboxInput("fit3", "Boxplot Sepal")
                           ),
                           mainPanel(
                             plotOutput("plot3")
                           )
                           )
                  )
                  
    )
))

                  



                           
                           
 
