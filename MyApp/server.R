library(MASS)
library(ggplot2)
library(DT)
library(shiny)
library(tidyverse)
setwd("~/R/App/MyApp")
library(readr)
data("iris")

shinyServer(function(input, output) {
    output$iris <- DT::renderDataTable(
        DT::datatable({
            iris
        },
        options= list(lengthMenu = list(c(6, 15,-1), c("5","15","All")), pageLength=15),
        filter="top",
        selection="multiple",
        style="bootstrap"
        ))
    output$plot1<- renderPlot({
        if(input$fit){
            Sepal<-plot(lm(iris$Sepal.Length~iris$Sepal.Width))
        }else{
            Sepal<- plot(x=iris$Sepal.Length, y=iris$Sepal.Width)
        }
    })
    output$plot2<- renderPlot({
        if(input$fit2){
            Petal<- plot(lm(iris$Petal.Length~iris$Petal.Width))
        }else{
            Petal<- plot(x=iris$Petal.Length, y=iris$Petal.Width)
        }
    })
    output$plot3<- renderPlot({
        if(input$fit3){
            Boxplot<- plot(x=iris$Species, y=iris$Sepal.Length, col=c("darkblue","yellow","blue"), xlab="Sepal")
        }else{
            Boxplot<- plot(x=iris$Species, y=iris$Petal.Length, col=c("darkblue","yellow","blue"), xlab="Petal")
        }
    })
    
})


