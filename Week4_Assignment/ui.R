library(shiny)
library(e1071)
# Preprocess
vars <- setdiff(names(iris), "Species")

shinyUI(fluidPage(
    titlePanel("Iris Decision Tree Prediction"),
    sidebarLayout(
        sidebarPanel(
            h4("Sepal Length"),
            sliderInput("sliderSepLen", 
                        "Choose Sepal Length",
                        min(iris$Sepal.Length),
                        max(iris$Sepal.Length),
                        median(iris$Sepal.Length)),
            h4("Sepal Width"),
            sliderInput("sliderSepWid",
                        "Choose Sepal Width",
                        min(iris$Sepal.Width),
                        max(iris$Sepal.Width),
                        median(iris$Sepal.Width)),
            h4("Petal Length"),
            sliderInput("sliderPetLen", 
                        "Choose Petal Length",
                        min(iris$Petal.Length),
                        max(iris$Petal.Length),
                        median(iris$Petal.Length)),
            h4("Petal Width"),
            sliderInput("sliderPetWid",
                        "Choose Petal Width",
                        min(iris$Petal.Width),
                        max(iris$Petal.Width),
                        median(iris$Petal.Width)),
            h2("Prediction:"),
            textOutput("pred"),
            h3("Plotting"),
            selectInput('xcol', 'X variable', vars),
            selectInput('ycol', 'Y Variable', vars, selected = vars[[2]])
        ),
        mainPanel(
            plotOutput('plot1'),
            h3("Description"),
            p("This ideploys a simple simulation tool for the classification of Species of a new observation."),
            h3("Data set"),
            p("The dataset used for this prediction is the famous Edgar Anderson's Iris Data."),
            p("The measurements of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica."),
            h3("Prediction"),
            p("The algorithm for the prediction is Decision Tree with all the variables except for the Species itself. You can choose values for each variable with the sliders, which have upper and lower limits provided by the dataset. Once you choose the values for each variable, the prediction will be provided below the slider."),
            h3("Visualization"),
            p("For youre reference, you can see the scatterplot above how those Species distributed by 2 Variables")
            
        ))    
))
