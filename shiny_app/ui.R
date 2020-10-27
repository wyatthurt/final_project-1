library(shiny)
library(shinythemes)
library(tidyverse)
library(janitor)
# Define UI for application that draws a histogram

state.names <- c("CA", "NY", "KS")

shinyUI(
    navbarPage(theme = shinytheme("united"),
               "UFO Sightings in the U.S.",
               tabPanel(
                   "About",
                   h2("UFO Sightings in the United States"),
                   p("GitHub Repo for the Final Project:", a("Link",
                      href = "https://github.com/UlucKadioglu/final-project"),
                   p("For Milestone #4, I gathered my main data and placed it 
                      in the raw_data folder. I also gathered a second data set 
                      that I will be using. Although I have 2 datasets now, 
                      there will probably be a few more as I make porgress. 
                      The main data set is downloaded from data.world, but the 
                      data itself is from the National UFO Research Center 
                      (NUFORC). The second dataset is from NASA. So far, my 
                      main goals is to see whether certain factors (such as 
                      education, income, etc.) have any effect on UFO sighting 
                      patterns in the United States. Under the Data tab, there 
                      is an initial visualization of the frequency with which 
                      UFOs of specific shapes have been sighted. To make this 
                      plot, I first grouped by shape, then made a new column 
                      called shape_count that counts the number of occasions 
                      for each shape. I then called ggplot to assign shape to 
                      the x-axis and shape_count to the y-axis, and finished 
                      with geom_col to produce the plot."))), 
               
               tabPanel(
                   "Data",
                   sidebarLayout(
                     sidebarPanel("Test",
                                  p("Test")),
                     selectInput(inputId = "selected_state",                  
                                 label = "Choose a state from this list!",    
                                 choices = state.names)),
                     mainPanel(
                   plotOutput("shape_plot"),
                   textOutput("state_message")
                   
               )
                   )
    ))