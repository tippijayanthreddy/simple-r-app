library(shiny)

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
- name: Copy R Script to EC2
      run: |
        scp -o StrictHostKeyChecking=no app.r ec2-user@54.164.80.110:~/simple-r-app
    - name: Execute R Script on EC2
      run: |
        ssh -o StrictHostKeyChecking=no ec2-user@54.164.80.110 "Rscript ~/simple-r-app/app.r"