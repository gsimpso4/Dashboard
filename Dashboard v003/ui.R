library(lubridate)

shinyUI(navbarPage("Santander Cycle Analytics Dashboard",  theme = "united.css", 
                   tabPanel("Overview", 
                            h2("In Development!"), h2("")),
                   navbarMenu("Business Dynamics",
                              tabPanel("Central Dynamic",
                                       p("The business must carefully manage two strategic resources: customers and stations."),
                                       p("Customers must be acquired faster than they are lost,"),
                                       p("and they must visit stations frequently enough to cover costs"),
                                       img(src = "CoreSchemeDynamic.png")
                                        ),
                              tabPanel("Customer Development")
                              ),
                   navbarMenu("Metrics",
                              tabPanel("Usage",
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
                              tabPanel("Member"
                                      ),
                              tabPanel("Service"
                                      )
                              ),
                   navbarMenu("Customer Insight",
                              tabPanel("Demand Drivers"),
                              tabPanel("...")
                             ), 
                   navbarMenu("Forecasting",
                              tabPanel("Demand", 
                                       h4("Number of trips and duration vs weather etc.")
                                      ),
                              tabPanel("Availability")
                              ), 
                   navbarMenu("Managing Availability",
                              tabPanel("..."),
                              tabPanel("...")
                             ), 
                   navbarMenu("Scheme Design",
                              tabPanel("Station Density"),
                              tabPanel("Expansion"),
                              tabPanel("Intensification")
                   ), 
 
                   tabPanel("About")
))