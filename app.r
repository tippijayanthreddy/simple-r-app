# app.r

# Install shiny if not installed
if (!require(shiny)) {
  install.packages("shiny", repos = "https://cran.r-project.org")
}

# Load the shiny library
library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("jayanth"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider", "Slider Input", min = 20, max = 200, value = 100)
    ),
    mainPanel(
      textOutput("slider_value")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$slider_value <- renderText({
    paste("Slider Value: ", input$slider)
  })
}

# Run the shiny app
# Run the shiny app on all interfaces and a specific port

shiny::runApp(host = "0.0.0.0", port = 3562)
