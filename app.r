# app.r

# Check if shiny is installed
if (!requireNamespace("shiny", quietly = TRUE)) {
  install.packages("shiny", repos = "https://cran.r-project.org")
}

# Load the shiny package
library(shiny)

# Define the UI and server
ui <- fluidPage(
  titlePanel("Simple Shiny App"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider", "Slider Input", min = 1, max = 100, value = 50)
    ),
    mainPanel(
      textOutput("slider_value")
    )
  )
)

server <- function(input, output) {
  output$slider_value <- renderText({
    paste("Slider Value: ", input$slider)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
