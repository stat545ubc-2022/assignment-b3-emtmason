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
                    
                    #Input: Iris Image
                    imageOutput("Iris"),
                    
                    # Input: Selector for variable to plot against petal length ----
                    selectInput("variable", "Variable:",
                                c(
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
                    
                    #Output: Text to introduce app function ----
                    textOutput("appDesc"),
                    
                    # Output: Plot of the requested variable against petal length ----
                    plotOutput("irisPlot"),
                    
                    #Output: Text to introduce next plot ---
                    textOutput("Description"),
                    
                    #Output: Plot of the requested variable against petal length ---
                    plotOutput("ScatterPlot")
                    
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
  
  #generate Image
  output$Iris <- renderImage({
    
    list(src = "www/Iris.jpeg",
         width = "100%",
         height = 300)
    
  }, deleteFile = F)
  
  output$appDesc <- renderText({
    "Iris flowers come in all shapes and sizes. This app can be used to visualize and compare how Iris flower dimensions can relate to each other. Please select which variable you'd like to comapre to petal length, and enjoy!"
  })
  
  # Generate a plot of the requested variable against petal length ----
  # and only exclude outliers if requested
  output$irisPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = irisData,
            outline = input$outliers,
            col = "Forestgreen", pch = 20)
  })
  
  # Return the formula text for printing as a caption ----
  output$Description <- renderText({
    "Iris flower species have different dimensions. Below, you can see how dimensions change by species.
    The colours represent the following species (color on graph):
    Setosa (Red),
    Versicolor (Green), 
    and Virginica (Black)"
  })
  
  #Generate a plot of the requested variable against petal length ---
  output$ScatterPlot <- renderPlot({
    plot(as.formula(formulaText()),
            data = irisData,
         pch = 19, col=Species)
  })
  
}

shinyApp(ui, server)
