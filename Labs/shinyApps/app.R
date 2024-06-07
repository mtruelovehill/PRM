library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("The Normal Distribution"),
    tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #4CA384}")),
    tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: #4CA384}")),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("mean",
                        "Value of Mean:",
                        min = -10,
                        max = 10,
                        value = 0),
            sliderInput('sd',
                        'Value of Standard Deviation:',
                        min = .5,
                        max = 15,
                        value = .5,
                        step = .5)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput('distPlot')
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
      dat <- data.frame(X=rnorm(300, mean = input$mean, sd = input$sd))
      
      ggplot(data.frame(X = c(-60, 60)), aes(x = X)) +
        geom_histogram(data=dat, aes(x=X, y = ..density..), fill = '#4CA384', color = '#19424C') +
        stat_function(fun=dnorm, geom = "line", args = list(mean = input$mean, sd = input$sd), 
                      linewidth = 1, color = '#19424C') + 
        theme(axis.title.x = element_text(size = 16, face = 'bold'),
              axis.text.x = element_text(size = 16),
              axis.line.y = element_blank(),
              axis.text.y = element_blank(),
              axis.ticks = element_blank(),
              axis.title.y = element_blank())
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
