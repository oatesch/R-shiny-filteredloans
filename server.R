shinyServer(function(input, output) {
  
  output$a_plotReturn <- renderPlotly({
    loans %>%
    filter(Age >= input$a_age[1], Age <= input$a_age[2]) %>%
    filter(Rating %in% input$a_rating)%>%
    filter(WorkExperience %in% input$a_workex)%>%
    filter(Interest >= input$a_interest[1], Interest <= input$a_interest[2])%>%
    ggplot(aes(ExpectedReturn * 100, colour = Rating)) +
      geom_line(stat="density") +
      scale_colour_manual(name = "Rating",values = RatingCols) +
      geom_line(aes(color="Avg"),stat="density",group=1) +
      ylab("") + xlab("Expected Return / %") +
      xlim(c(0,25))
  })
  
  output$b_plotReturn <- renderPlotly({
    loans %>%
      filter(Age >= input$b_age[1], Age <= input$b_age[2]) %>%
      filter(Rating %in% input$b_rating)%>%
      filter(WorkExperience %in% input$b_workex)%>%
      filter(Interest >= input$b_interest[1], Interest <= input$b_interest[2])%>%
      ggplot(aes(ExpectedReturn * 100, colour = Rating)) +
      geom_line(stat="density") +
      scale_colour_manual(name = "Rating",values = RatingCols) +
      geom_line(aes(color="Avg"),stat="density",group=1) +
      ylab("") + xlab("Expected Return / %") +
      xlim(c(0,25))
  })
  
})
