library(shiny)
library(nivopie)

ui <- fluidPage(
  titlePanel("reactR HTMLWidget Example"),
  nivopieOutput('widgetOutput')
)

server <- function(input, output, session) {
  output$widgetOutput <- renderNivopie({
    id=c("A", "B", "C","D", "E")
    value=c(12,13,45, 16, 56)

    data=data.frame(id, value)
    nivopie(data)

  })
}

shinyApp(ui, server)
