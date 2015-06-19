# shinyServer(function(input, output) {
# })

# server.R

library(shiny)
library(lubridate)
library(dplyr)
library(ggplot2)

options(stringsAsFactors=F)  

shinyServer(function(input, output) {
  
  if (!exists("allTrips"))
    load("C:/gs data/GS Resources/Cycle Hire/Data/Trip Data/allTrips.Rdata")
  
  
  dataInput <- reactive({
    allTrips %>%
      #         filter(Date >= as.POSIXct(input$dates[1]) &
      #                  Date <= as.POSIXct(input$dates[2])) %>% 
      select(Date, matches(input$symb)) %>%   #, weekNum
      group_by(Date) %>%
      summarise(count = n())
  })
  
  output$plot <- renderPlot({    
    ggplot(dataInput(), aes(x = Date, y = count )) +
      geom_point() +
      theme() + 
      xlab("Date") + 
      ylab("Trips") +
      ggtitle("Time Series")
    
  })
})