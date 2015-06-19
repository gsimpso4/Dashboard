shinyUI(fluidPage(theme = "united.css",
  
  titlePanel("Tabsets"),
  
  sidebarLayout(
    
    sidebarPanel(
      ( "sidebar panel")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", "Hello", plotOutput("plot")), 
        tabPanel("Summary", verbatimTextOutput("summary")), 
        tabPanel("Table", tableOutput("table"))
      )
    )
  )
))