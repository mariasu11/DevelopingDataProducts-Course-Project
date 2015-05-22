library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Maryland Home Prices Historical Comparision and Prediction for 2016"),
  
  sidebarLayout(
    
    sidebarPanel(
      h1("What is the price of your Maryland home?"),
      numericInput(inputId="homePrice", label="Your home price", value= 0,min=0), 
      submitButton("Go!")
      
    
    ),
    
    mainPanel(
      tabsetPanel(
        
        tabPanel("Your Results Past and Future Home Prices",  
                 h4("In 1990 your home cost"),
                 verbatimTextOutput("costone"),
                 h4("In 2005 your home cost"),
                 verbatimTextOutput("costtwo"),
                 h4("In 2010 your home cost"),
                 verbatimTextOutput("costthree"),
                 h4("In 2014 your home cost"),
                 verbatimTextOutput("costfour"),
                 h4("In 2016 your home WILL cost"),
                 verbatimTextOutput("costfive")
        ),  
        
   
                 
        tabPanel("Home Price Plot", htmlOutput(outputId = "main_plot")
                 ),
        
        tabPanel("How to use this app", 
                 p("This app takes the current price of a home in Maryland as of May 2015 and provides the user with the price of that home in 1990, 2005, 2010, 2014, and 2016 (based on Zillow forecast). 
                    The second tab plots these prices using GoogleVis to give the user an interactive visual on how the price of homes have increased since 1990.
                                                           
                    The data for historical prices was based on Maryland Appreciation Rates found at http://www.neighborhoodscout.com/md/rates/
                                                           
                    The forecast was based on a Zillow prediction of 2.6% which can be found at http://www.zillow.com/md/home-values/ ")
        ) 
        
      )
    )
  )
))