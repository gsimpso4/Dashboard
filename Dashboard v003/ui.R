library(lubridate)

shinyUI(navbarPage("London's Santander Cycle Dashboard",  theme = "united.css", 
                   tabPanel("Overview", 
                            h2("In Development!"), h2("")),
                   navbarMenu("Metrics",
                              tabPanel("Trip Metrics",
                                       selectInput("plotInterval","Select Horizontal Axis", c("Date", "weekNum")
                                                   , selected  = "Date"),
                                       selectInput("symb", "Select a data variable ", c("Billable.Duration", "count")),
                                       dateRangeInput("dates", 
                                                      "Date Range",
                                                      start = parse_date_time("2012-01-01", "ymd"),
                                                      end = round_date(parse_date_time(Sys.time(), "ymd HMS"), unit = "day")
                                                      ),
                                       plotOutput("plot")
                                      ),
                              tabPanel("Member Metrics"
                                      )
                              ),
                   navbarMenu("Forecasting",
                              tabPanel("Demand"),
                              tabPanel("Availability")
                              ), 
                   navbarMenu("Managing Availability",
                              tabPanel("..."),
                              tabPanel("...")
                   ), 
                   navbarMenu("Customer Insight",
                              tabPanel("Drivers of Demand"),
                              tabPanel("...")
                   ), 
                   navbarMenu("Scheme Design",
                              tabPanel("Station Density"),
                              tabPanel("...")
                   ), 
                   navbarMenu("Strategy Dynamics",
                              tabPanel("Central Dynamic"),
                              tabPanel("Customer Development")
                   ), 
                   tabPanel("About")
))