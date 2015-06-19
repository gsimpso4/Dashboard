
library(shiny)
library(shinyapps)
library(shinythemes)
library(lubridate)
library(dplyr)
library(ggplot2)

options(stringsAsFactors=F)  

shinyServer(function(input, output) {
  
  if (!exists("allTrips"))
    load("C:/gs data/GS Resources/Cycle Hire/Data/Trip Data/allTrips.Rdata")
  
  
  dataInput <- reactive({
    allTrips %>%
      filter(Date >= as.POSIXct(input$dates[1]) &
          Date <= as.POSIXct(input$dates[2])) %>%   
      select(Date, matches(input$symb), BikeUserType.Id) %>%   #, weekNum
      group_by(Date, BikeUserType.Id) %>%
      summarise(count = n(), dur = mean(Billable.Duration)/60)
  })
  
  output$plot <- renderPlot({    
    ggplot(dataInput(), aes(x = Date, y = dur )) +
      geom_point(aes(colour = BikeUserType.Id)) +
      theme() + 
      xlab("Date") + 
      ylab(input$symb) +
      ggtitle("Time Series")
    
  })
})