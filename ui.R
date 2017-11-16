library(shiny)

funcinfo <- function(){
  data <- read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  return(data[, 1])
}

shinyUI(pageWithSidebar(
  headerPanel("The number of cars Wolksvagen issued in world"),
  
  sidebarPanel(
    selectInput("funcinfo", "Year:", choices=funcinfo()),
    hr(),
    checkboxInput("total", "Show the total cars", value = TRUE)
  ),
  
  mainPanel(
    plotOutput("plot")
  )
))