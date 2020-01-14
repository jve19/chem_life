#setwd("C:\\Users\\Gebruiker\\Documents\\R\\shiny\\trial glasgow")
setwd("C:\\Users\\Gebruiker\\Documents\\R\\shiny\\tortilla_script_070120")
library(shiny)
library(ggplot2)


# Define the fields we want to save from the form
#fields <- c("text_demo", 'secret?')
fields <- c("t_where", 't_which', 'opinion', 'rating')
outputDir <- 'responses'

############################################################
#source('trial glasgow\\f_save_Data.R')
source("C:\\Users\\Gebruiker\\Documents\\R\\shiny\\trial\\trial glasgow\\f_save_Data.R")

############################################################
source("C:\\Users\\Gebruiker\\Documents\\R\\shiny\\trial\\trial glasgow\\f_load_Data.R")


# anser text question
t_where       <- textInput("t_where", "Where did you ate tortilla?")
# textarea_demo <- textAreaInput("textarea_demo", "what tortilla dit you got")
t_which       <- textInput("t_which", "what type of tortilla?")
opinion       <- textInput('opinion', 'how did you like it?')

# make a slider
rating        <- sliderInput(
  "rating", 
  "Which mark would you give it?",
  min = 0, max = 10, step = 1, value = 1
)

slider_demo <- sliderInput(
  "slider_demo", 
  "How would you rate the 80s musically, on a scale from 0-100?",
  min = 0, max = 100, step = 1, value = 50
)


action_demo   <- actionButton("clear", "Clear Form")
download_demo <- downloadButton("download", "Download")
# file_demo     <- fileInput("file_demo", "Upload a PDF", accept = "pdf")
# help_demo     <- helpText("You can write help text in your form this way")

#source('trial glasgow\\f_reset_form.R')
source("C:\\Users\\Gebruiker\\Documents\\R\\shiny\\trial\\trial glasgow\\f_reset_form.R")


# Set up questionnaire interface ----
ui <- fluidPage(
  title = "Questionnaire Framework",
  # CSS ----
  # stop the default input containers being 300px, which is ugly
  tags$head(
    tags$style(HTML("
                    .shiny-input-container:not(.shiny-input-container-inline) {
                    width: 100%;
                    max-width: 100%;
                    }
                    "))
    ),
  
  # App title ----
  h3("BEEEEEH"),
  
  p("pues nasa... tortilla time"),
  
  fluidRow(
    column(width=6, t_where),
    column(width=6, t_which), 
    column(width=6, opinion)
  ),
  
  rating,

  actionButton("submit", "Submit"),
  action_demo
    )

# Reactive functions ----
outputDir <- "responses"

server = function(input, output, session) {
  
  # When the Submit button is clicked, save the form data
  observeEvent(input$submit, {
    saveData(input)
    resetForm(session)
    
    # thank the user
    n_responses <- length(list.files(outputDir))
    response <- paste0("Thank you for eating tortilla! You supplied tortilla nr ",
                       n_responses, ".")
    showNotification(response, duration = 0, type = "message")
  })
  
  # clear the fields
  observeEvent(input$clear, {
    resetForm(session)
  })
}

shinyApp(ui, server)
