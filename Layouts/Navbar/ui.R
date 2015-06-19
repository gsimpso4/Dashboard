library(lubridate)

shinyUI(navbarPage("Navbar",  theme = "united.css", 
                   tabPanel("Component 1"),
                   tabPanel("Component 2",
                            selectInput("plotInterval","Select Horizontal Axis", c("Date", "weekNum")
                                        , selected  = "Date"),
                            textInput("symb", "Select a data variable ", "Billable.Duration"),
                            dateRangeInput("dates", 
                                           "Date Range",
                                           start = parse_date_time("2012-01-01", "ymd"),
                                           end = round_date(parse_date_time(Sys.time(), "ymd HMS"), unit = "day")
                                          ),
                            plotOutput("plot")
                          ),
                   navbarMenu("More",
                              tabPanel("Sub-Component A",
                                       selectInput("plotInterval","Select Horizontal Axis", c("Date", "weekNum")
                                                   , selected  = "Date")
                              ),
                              tabPanel("Sub-Component B"))
))