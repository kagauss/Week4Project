#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  data("mtcars")
  fit <- lm(mpg~hp, data = mtcars)    
  
  output$text1 <- renderText({ "About the app: Just select your cars horsepower with the slider and the
        app will predict your car's MPG based on a model using data 
        from the 'mtcars' dataset." })
  
  output$afit <- renderText({ req(input$text1)
      paste("Predicted MPG: ", round(coef(fit)[1] + input$text1 * coef(fit)[2], 0)) })
  
  output$plot1 <- renderPlot({ 
      ggplot(data = mtcars, aes(x = hp, y = mpg))+geom_point()+geom_smooth(method = "lm")+geom_point(size = 5, color = "red", aes(x=input$text1, y=coef(fit)[1] + input$text1 * coef(fit)[2]))
      })
  
  
})
