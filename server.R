
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  output$oenvelopeType <- renderPrint({input$envelopeType})
  output$onumPackages <- renderPrint({input$numPackages})
  output$onumAdditionalPages <- renderPrint({input$numAdditionalPages})
  output$ototalCost <- renderPrint({totalCost(input$envelopeType, input$numPackages, input$numAdditionalPages)})
  
})

totalCost <- function(envelopeType, numPackages, numAdditionalPages) {
  if (envelopeType == "6x9") {
    costForPackages <- numPackages * 0.279
    costForAdditionalPages <- (numAdditionalPages) * 0.029
    return(costForPackages + costForAdditionalPages)
  } else {
    costForPackages <- numPackages * 0.179
    costForAdditionalPages <- (numAdditionalPages) * 0.029
    return(costForPackages + costForAdditionalPages)
  }
}
