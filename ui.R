renderInputs <- function(prefix) {
  wellPanel(
    fluidRow(
      column(6,
             checkboxGroupInput(paste0(prefix, "_rating"),
                                label = "Rating",
                                choices = Ratings,
                                selected = c("AA","A","B","C"),
                                inline = TRUE
             ),
             
             
             checkboxGroupInput(paste0(prefix, "_workex"),
                                label = "Years of Employment",
                                choices = c(
                                  "0"="LessThan2Years",
                                  "2"="2To5Years",
                                  "5"="5To10Years",
                                  "10"="10To15Years",
                                  "15"="15To25Years",
                                  "25"="MoreThan25Years"
                                ),
                                selected = WorkEx,
                                inline = TRUE
             )
             
      ),
      
      column(6,
             
             sliderInput(paste0(prefix, "_interest"),
                         label = "Interest",
                         min = 0,
                         max = 100,
                         value = c(0,100)
             ),
             
             sliderInput(paste0(prefix, "_age"),
                         "Age",
                         min = 20,
                         max = 80,
                         value = c(20,80)
             )
      )
      
      
    )
  )
}


shinyUI(fluidPage(
  
  tags$h2("Expected Return for the Bondaro Loanbook"),
  hr(),
  
  # Show a plot of the generated distribution

    fluidRow(
      column(6, renderInputs("a")),
      column(6, renderInputs("b"))
    ),
    fluidRow(
      column(6, plotlyOutput("a_plotReturn")),
      column(6, plotlyOutput("b_plotReturn"))
    
  )
)
)
