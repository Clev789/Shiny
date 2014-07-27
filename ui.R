
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(
        fluidPage(
                
                # Application title
                titlePanel("Predicting coronary heart disease"),
                
                fluidRow(
                        p("The app predicts the probability of heart disease using the data collated by Rousseauw et al, 1983, 
      South African Medical Journal. You can specify parameters to find out the heart disease probability 
based on the Rousseauw data.
                               Some metrics are invented (e. g. pints per year) as there were no detailed data dictionary available. 
                               This is just to demonstrate Shiny App. Do not use in real life!"
                        ),
                        p("Hover the pointer over parameter to find out the details of the particular parameter")),
                
                
                
                sidebarLayout(
                        sidebarPanel(
                                
                                
                                tags$div(title="Click here to define the age",
                                         sliderInput("age",
                                                     "Age", 
                                                     min = 15,
                                                     max = 64,
                                                     value = 30)
                                ),
                                
                                tags$div(title="Alcohol, beer pints per year (5% alhocol)",
                                         sliderInput("alcohol",
                                                     "Alcohol consumption 
                                            (pints per year)",  
                                                     min = 0,
                                                     max = 150,
                                                     value = 20)
                                ),
                                
                                tags$div(title="Condition under which excess body fat impacts health, normal index between 18.50 and 25.00",
                                         sliderInput("obesity",
                                                     "Obesity index", 
                                                     min = 10,
                                                     max = 50,
                                                     value = 25)
                                ),
                                
                                tags$div(title="Tobacco smoked - accumulative during life duration in kg (1 pack = 20 g)",
                                         sliderInput("tobacco",
                                                     "Tobacco (cumulative, kg)", 
                                                     min = 0,
                                                     max = 30,
                                                     value = 1)
                                ),
                                
                                tags$div(title="Antisocial behaviour - conflicts with others converted into scale (yes, it is rather abstract - the most dangerous person will have A behaviour index close to 100",
                                         sliderInput("typea",
                                                     "Antisocial behaviour index", 
                                                     min = 0,
                                                     max = 100,
                                                     value = 1)
                                ),
                                
                                tags$div(title="Increasing levels of ldl associated with health problems. The coefficient should be calculated in clinique",
                                         
                                         sliderInput("ldl",
                                                     "Low density cholesterol index", 
                                                     min = 0,
                                                     max = 15,
                                                     value = 1)
                                )
                                
                                
                                
                                
                                
                                
                                
                        ),
                        
                        # Show a plot of the generated distribution
                        mainPanel(
                                
                                
                                plotOutput("distPlot"),
                                
                                p("Probability of heart disease (%):"),
                                
                                verbatimTextOutput("prob")
                                
                                
                        )
                        
                ) 
        )
        
)
