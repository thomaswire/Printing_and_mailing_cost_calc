


# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Printing and Mailing Cost Calculator"),
  
  # Sidebar
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "envelopeType", label = "Envelope Type",
        choices = list("6x9", "#10"),
        selected = "6x9"
      ),
      
      sliderInput(
        "numPackages",
        "Number of Packages:",
        min = 1,
        max = 10000,
        value = 1000
      ),
      
      sliderInput(
        "numAdditionalPages",
        "Number of Additional Pages:",
        min = 1,
        max = 10000,
        value = 1000
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(tabsetPanel(
      tabPanel(
        "Output",
        h4("Envelope type selected:"),
        verbatimTextOutput("oenvelopeType"),
        h4("Number of packages:"),
        verbatimTextOutput("onumPackages"),
        h4("Number of additional pages:"),
        verbatimTextOutput("onumAdditionalPages"),
        h4("Total cost:"),
        verbatimTextOutput("ototalCost")
      ),
      tabPanel(
        "About",
        p(
          "This Shiny application can be used to calculate the printing and mailing costs
          to be charged by the firm XYZ Mailings to mail a set of packages.
          In the side panel to the left, select the envelope type (6x9 envelopes or #10
          envelopes), the number of packages and the number of additional pages. Note
          that 'additional pages' are any pages in a package beyond the first page. So,
          the value for 'additional pages' is calculated as the total number of pages
          minus the number of packages."
        ),
        
        p(
          "The ui.R and server.R files can be found in the following repository:"
        ),
        
        a(href="https://github.com/thomaswire/Printing_and_mailing_cost_calc.git", "GitHub repository for Printing and Mailing Cost Calculator")
      )
      
        ))
    )
      ))
