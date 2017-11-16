draw <- function(funcinfo, total){
  data <- read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  
  index <- 0
  
  for(i in 1:nrow(data)){
    if(data[i, 1] == funcinfo){
      index <- i
    }
  }
  
  if(index == 0){
    return()
  }
  
  if(index > 2 && index < nrow(data)){
    title <- paste(funcinfo, sep = " ")
  } else {
    title <- funcinfo
  }
  
  if(total){
    barplot(as.matrix(data[index, 2:4]), main = title, ylab="The number of cars Wolksvagen", xlab="")
  } else {
    barplot(as.matrix(data[index, 3:4]), main = title, ylab="The number of cars Wolksvagen", xlab="")
  }
}

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      draw(input$funcinfo, input$total)
    })
  }
)