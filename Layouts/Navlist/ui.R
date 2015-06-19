shinyUI(fluidPage( theme = "united.css",
  
  titlePanel("Navlist"),
  
  navlistPanel(
    "Header A",
    tabPanel("Component 1",
             selectInput("plotInterval","Select Horizontal Axis", c("Date", "weekNum")
                         , selected  = "Date")
    ),
    tabPanel("Component 2"),
    "Header B",
    tabPanel("Component 3"),
    tabPanel("Component 4"),
    "-----",
    tabPanel("Component 5")
  )
))