
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
    output$myPlot <- renderPlot({
      
      distType <- input$Distribution
      size <- input$SampleSize
      
      if(distType == "Normal"){
        randomVec <- rnorm(size, mean=as.numeric(input$Mean),
                           sd=as.numeric(input$SD))
      }
      else if (distType == "Exponential") {
        randomVec <- rexp(size, rate=1/as.numeric(input$Lambda))
      }
      else {
        randomVec <- rpois(size, lambda=as.numeric(input$LambdaP))
      }
      
      histName <- paste("Histogram of Random",distType,"Distribution", sep=" ")
      hist(randomVec, col="blue", main=histName)
    })
  }
)
  # output$distPlot <- renderPlot({
  # 
  #   # generate bins based on input$bins from ui.R
  #   x    <- faithful[, 2]
  #   bins <- seq(min(x), max(x), length.out = input$bins + 1)
  # 
  #   # draw the histogram with the specified number of bins
  #   hist(x, breaks = bins, col = 'darkgray', border = 'white')
  # 
  # })
