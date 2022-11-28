irisData <- iris
library(shiny)
library(shinythemes)
library(rsconnect)

ui <- fluidPage(theme = shinytheme("paper"),
  
  # App title ----
  titlePanel("Visualizing Iris Flowers"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for variable to plot against petal length ----
      selectInput("variable", "Variable:",
                  c("Species" = "Species",
                    "Sepal Width" = "Sepal.Width",
                    "Petal Width" = "Petal.Width",
                    "Sepal Length" = "Sepal.Length")),
      
      # Input: Checkbox for whether outliers should be included ----
      checkboxInput("outliers", "Show outliers", TRUE)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
      
      # Output: Plot of the requested variable against petal length ----
      plotOutput("irisPlot")
      
    )
  )
)


# Define server logic to plot various variables against petal length ----
server <- function(input, output) {
  
  # Compute the formula text ----
  # This is in a reactive expression since it is shared by the
  # output$caption and output$irisPlot functions
  formulaText <- reactive({
    paste("Petal.Length ~", input$variable)
  })
  
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against petal length ----
  # and only exclude outliers if requested
  output$irisPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = irisData,
            outline = input$outliers,
            col = "purple", pch = 20)
  })
  
}

shinyApp(ui, server)

