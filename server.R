library(shiny)
library(googleVis)
library(data.table)

costninety <- function(homePrice) homePrice / 2.1325
costofive <- function(homePrice) homePrice / 1.057
costten <- function(homePrice) homePrice / 1.0031
costfourteen <- function(homePrice) homePrice /  1.0376
costsixteen <- function(homePrice) homePrice * 1.026

shinyServer(
  function(input, output){
    output$costone <-  renderPrint({costninety(input$homePrice)})

    output$costtwo <- renderPrint({costofive(input$homePrice)})
    
    output$costthree <- renderPrint({costten(input$homePrice)})
    
    output$costfour <- renderPrint({costfourteen(input$homePrice)})
    
    output$costfive  <- renderPrint({costsixteen(input$homePrice)})
   
    
    output$main_plot <- renderGvis({
      y<- c(input$homePrice/2.1325, input$homePrice/1.057, input$homePrice/1.0031, input$homePrice/1.0376, input$homePrice * 1.026)
      x<- c("1990", "2005", "2010", "2014", "2016")
      df=data.frame(x,y)
      names(df)<-c("Year", "Price")
      Line<-gvisLineChart(df, yvar ="Price", options = list(title="Your MD Home Price Plot"))
      
    
  })
})