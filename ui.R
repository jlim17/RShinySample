
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  pageWithSidebar(
    headerPanel("View Histogram of Distributions"),
    
    sidebarPanel(
      selectInput("Distribution", "Pls Select Distribution Type",
                 choices=c("Normal", "Exponential", "Poisson")),
      sliderInput("SampleSize", "Pls Select Sample Size",
                  min=100, max=5000, value=1000, step=100),
      conditionalPanel(condition= "input.Distribution == 'Normal'",
                       textInput("Mean", "Pls Enter Mean", value=10),
                       textInput("SD", "Pls Enter SD", value=1)),
      conditionalPanel(condition= "input.Distribution == 'Exponential'",
                       textInput("Lambda", "Pls Enter Lambda", value=3)),
      conditionalPanel(condition="input.Distribution == 'Poisson'",
                       textInput("LambdaP", "Pls Enter Lambda", value=1))
    ),
    
    mainPanel(
      plotOutput("myPlot")
    )
  )  
  )
  # Application title
  #titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  # sidebarLayout(
  #   sidebarPanel(
  #     sliderInput("bins",
  #                 "Number of bins:",
  #                 min = 1,
  #                 max = 50,
  #                 value = 30)
  #   ),
  # 
  #   # Show a plot of the generated distribution
  #   mainPanel(
  #     plotOutput("distPlot")
  #   )
  # )
)
