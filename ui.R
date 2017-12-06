#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Week4Project"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("text1", "What is your car's HP?: ", value = 100, min = min(mtcars$hp), max = max(mtcars$hp))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       verbatimTextOutput("text1"),
       textOutput("afit"),
       plotOutput("plot1")
    )
  )
))
