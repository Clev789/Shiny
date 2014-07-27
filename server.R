
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ElemStatLearn)


data(SAheart)
set.seed(8484)

# set data

train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/1.2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

# model for predicting probability of heart decease
model <- glm(chd ~ age+alcohol+obesity+tobacco+typea+ldl,  
               family = "binomial", data = trainSA)

predserver <- function(age, alcohol, obesity, tobacco, typea, ldl){
        newdata <- data.frame(age = age,
                              alcohol = alcohol,
                              obesity = obesity,
                              tobacco = tobacco,
                              typea = typea,
                              ldl = ldl)
        
        predict(model, newdata = newdata, type = "response")   
}


shinyServer(function(input, output) {
        
        output$distPlot <- renderPlot({
                
                hist(predict(model, newdata = trainSA, type = "response"), col = 'darkgray', 
                     border = 'white', xlab = "Probability", 
                     main = "Hist. of heart disease prob.") 
                
                
                
                abline(v = predserver(input$age, input$alcohol, input$obesity, input$tobacco,
                                      input$typea, input$ldl), col = 'red', lwd = 4)
                
                
                
        })
        
        #generate probability for the particular value
        output$prob <- renderPrint({ 
                
                newdata <- data.frame(age = input$age,
                                      alcohol = input$alcohol,
                                      obesity = input$obesity,
                                      tobacco = input$tobacco,
                                      typea = input$typea,
                                      ldl = input$ldl)
                
                predict(model, newdata = newdata, type = "response") * 100
                
                
        })
        
})


