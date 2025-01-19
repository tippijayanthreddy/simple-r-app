ui <- fluidPage(
    titlePanel("Simple Shiny App"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("slider", "Select a value:", min = 1, max = 100, value = 50)
        ),
        mainPanel(
            textOutput("output")
        )
    )
)

server <- function(input, output) {
    output$output <- renderText({
        paste("You selected:", input$slider)
    })
}

shinyApp(
    ui = ui,
    server = server,
    options = list(host = "0.0.0.0", port = 3562)
)
 