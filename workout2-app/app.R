library(shiny)
library(ggplot2)
library(reshape2)





ui <- fluidPage(
  
  
  titlePanel(title = "Investment Models"),
  
  fluidRow(
    column(4,
           sliderInput("Initial_amount",
                       "number of Initial Amount",
                       min = 1,
                       max = 100000,
                       step = 500,
                       value = 1000,
                       pre = "$")),
    column(4,
           sliderInput("Return_rate",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 5)),
    column(4,
           sliderInput("years",
                       "Years",
                       min = 0,
                       max = 50,
                       step = 1,
                       value = 10)),
    column(4,
           sliderInput("Annual_Contribution",
                       "nubmer of Annual Contribution",
                       min = 0,
                       max = 50000,
                       step = 500,
                       value = 2000,
                       pre = "$")),
    column(4,
           sliderInput("Growth_rate",
                       "Growth Rate(in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 2)),
    column(4,
           selectInput("facet",
                       "Facet?",
                       c("Yes","No"))
    ),
    
    # Show a plot and a table of the generated distribution
    mainPanel(
      h3("Timeline"),
      plotOutput("distPlot",width = "150%"),
      h3("balances"),
      verbatimTextOutput("modalities")
      
    )))



server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    FV <- c()
    for (i in 1:input$years){
      FV[i]= input$Initial_amount*((1+(input$Return_rate/100))^i)
    }
    
    FVA <- c()
    for (i in 1:input$years){
      FVA[i]=input$Initial_amount*((1+(input$Return_rate/100))^i)+input$Annual_Contribution*((((1+(input$Return_rate/100))^i)-1)/(input$Return_rate/100))
    }
    
    FVGA <- c()
    for (i in 1:input$years){
      FVGA[i]= input$Initial_amount*((1+(input$Return_rate/100))^i)+(input$Annual_Contribution*((((1+(input$Return_rate/100))^i)-((1+(input$Growth_rate/100))^i))/((input$Return_rate/100)-(input$Growth_rate/100))))
    }
    
    modalities <- data.frame(year=0:input$years,no_Contribution=c(input$Initial_amount,FV), fixed_Contribution=c(input$Initial_amount,FVA), growing_Contribution=c(input$Initial_amount,FVGA))
    
    if (input$facet == "Yes") {
      df.m = melt(modalities, id.vars ="year", measure.vars = c("no_Contribution","fixed_Contribution","growing_Contribution"))
      
      ggplot(df.m, aes(year, value)) + geom_area(aes(fill = variable), alpha = 0.4) + geom_point(aes(colour = variable)) + geom_line(aes(colour = variable))+ scale_x_discrete(name ="Years", limits = c(0:input$years)) + ylab("Value") +  
        ggtitle("Investing Models")+ theme_bw()+
        facet_wrap(~variable)
    } else if (input$facet == "No"){
      df.m = melt(modalities, id.vars ="year", measure.vars = c("no_Contributionution","fixed_Contribution","growing_Contribution"))
      ggplot(df.m, aes(year, value)) + geom_point(aes(color = variable)) + geom_line(aes(color = variable)) + scale_x_discrete(name ="Years", limits = c(0:input$years)) + ylab("Balance") +  
        ggtitle("Investing Models") 
    }
    
  })
  
  
  modalities <- reactive({
    FV <- c()
    for (i in 1:input$years){
      FV[i]= input$Initial_amount*((1+(input$Return_rate/100))^i)
    }
    
    FVA <- c()
    for (i in 1:input$years){
      FVA[i]=input$Initial_amount*((1+(input$Return_rate/100))^i)+input$Annual_Contribution*((((1+(input$Return_rate/100))^i)-1)/(input$Return_rate/100))
    }
    
    FVGA <- c()
    for (i in 1:input$years){
      FVGA[i]= input$Initial_amount*((1+(input$Return_rate/100))^i)+(input$Annual_Contribution*((((1+(input$Return_rate/100))^i)-((1+(input$growth/100))^i))/((input$Return_rate/100)-(input$growth/100))))
    }
    modalities <- data.frame(year=0:input$years,no_Contribution=c(input$Initial_amount,FV), fixed_Contribution=c(input$Initial_amount,FVA), growing_Contribution=c(input$Initial_amount,FVGA))
  })
  
  output$modalities  <- renderPrint({(modalities())})
}

shinyApp(ui = ui, server = server)
