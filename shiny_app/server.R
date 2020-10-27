#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
ufo <- readRDS("~/Desktop/Gov50/final_project/shiny_app/raw_data/nuforc_reports.rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$shape_plot <- renderPlot({

       ufo %>%
            select(state, shape) %>%
            filter(state == "AL" | state == "AK" | state == "AZ" |
                   state == "AR" | state == "CA" | state == "CO" |
                   state == "CT" | state == "DE" | state == "FL" |
                   state == "GA" | state == "HI" | state == "ID" |
                   state == "IL" | state == "IN" | state == "IA" |
                   state == "KS" | state == "KY" | state == "LA" |
                   state == "ME" | state == "MD" | state == "MA" |
                   state == "MI" | state == "MN" | state == "MS" |
                   state == "MO" | state == "MT" | state == "NE" |
                   state == "NV" | state == "NH" | state == "NJ" |
                   state == "NM" | state == "NY" | state == "NC" |
                   state == "ND" | state == "OH" | state == "OK" |
                   state == "OR" | state == "PA" | state == "RI" |
                   state == "SC" | state == "SD" | state == "TN" |
                   state == "TX" | state == "UT" | state == "VT" |
                   state == "VA" | state == "WA" | state == "WV" |
                   state == "WI" | state == "WY") %>%
            drop_na() %>%
            ggplot(aes(x = state, fill = shape)) +
            geom_histogram(stat = "count") +
            theme_bw() +
            theme(axis.text.x = element_text(angle = 90)) +
            labs(title = "Number of UFO Sightings by State", subtitle = "Don't forget to take population of each state into account!", 
                 x = "States", y = "Count")

    })

    # output$state_message <- renderText({
    #   paste0("This is the state you chose: ", # this is just a string, so it will never change
    #          input$selected_state, "!")})
    
})
