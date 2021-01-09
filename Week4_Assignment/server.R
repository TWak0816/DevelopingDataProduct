library(shiny)
library(caret)
library(e1071)
shinyServer(function(input,output){
    modFit <- train(Species ~ ., method = "rpart",
                    data = iris)
    
    prediction <- reactive({
        predict(modFit,
                newdata = data.frame(Sepal.Length = input$sliderSepLen,
                                     Sepal.Width = input$sliderSepWid,
                                     Petal.Length = input$sliderPetLen,
                                     Petal.Width = input$sliderPetWid))
    }) 

    output$pred <- prediction #Prediction result
    
    selectedData <- reactive({
        iris[,c(input$xcol, input$ycol)]
    })
    # Output plot
    output$plot1 <- renderPlot({
        par(mar = c(5, 4, 1, 1))
        plot(selectedData(),
             col = iris$Species,
             pch = 20, cex = 4)
        legend("topright", legend = levels(iris$Species),
               col = 1:3, pch = 20)
    })
})