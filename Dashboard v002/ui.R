library(lubridate)

shinyUI(navbarPage("London's Santander Cycle Dashboard",  theme = "united.css", 
                   tabPanel("Overview", 
                            h2("In Development!"), h2("")),
                   tabPanel("Daily Trips",
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
                   navbarMenu("Station Trips",
                              tabPanel("Sub-Component A",
                                       selectInput("plotInterval","Select Horizontal Axis", c("Date", "weekNum")
                                                   , selected  = "Date")
                              ),
                              tabPanel("Sub-Component B")), 
                              tabPanel("Top Trips"), 
                              tabPanel("About")
))