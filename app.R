# Load packages (installation needed if it is not the case)
library(shiny)
library(shinyjs)
library(shinythemes)
library(bslib)

library(later)
library(rgl)
library(Rvcg)

# Setup R
source(file.path("script", "setup_app.R"))

# ---- User interface (frontend) ----
ui <- fluidPage(
  # Load CSS/Java style
  source(file.path("ui", "style.R"), local = TRUE)$value,
  
  
  page_navbar(
    title = "AppOto3D",
    # Choose page theme
    theme = bs_theme(preset = "simplex"), 
    fillable = TRUE,
    id = "main_navbar",
    
    source(file.path("ui", "application.R"), local = TRUE)$value,
    source(file.path("ui", "description.R"), local = TRUE)$value,
    source(file.path("ui", "guide.R"), local = TRUE)$value,
    source(file.path("ui", "references.R"), local = TRUE)$value,
    source(file.path("ui", "partenaires.R"), local = TRUE)$value,
    source(file.path("ui", "license.R"), local = TRUE)$value
  ),
  
  # Logos on bottom
  div(
    class = "footer-logos",
    tags$a(href = "https://manchemerdunord.ifremer.fr/", target = "_blank",
           img(src = "logo/ifremer.png", alt = "Ifremer")),
    
    tags$a(href = "https://www.univ-littoral.fr/", target = "_blank",
           img(src = "logo/ulco.png", alt = "ULCO")),
    
    tags$a(href = "https://www-lisic.univ-littoral.fr/", target = "_blank",
           img(src = "logo/lisic.png", alt = "LISIC"))
  ),
  
  # Copyright
  div(
    class = "footer-copyright",
    HTML("Copyright &copy; 2025 Nicolas Andrialovanirina, Emilie Poisson Caillault, Kélig Mahé.")
  )
)

# ---- Run the server (backend) ----
server <- function(input, output, session) {
  source(file.path("server", "app.server.R"), local = TRUE)$value
}

# ---- Run the app ----
shinyApp(ui, server)
