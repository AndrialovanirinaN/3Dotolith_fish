tabPanel("Application",
         
         useShinyjs(),
         
         h3("Démonstration utilisation des otolithes 3D"),
         h5("Identification de caractéristique d'un poisson à partir de son otolithe"),
         
         fluidRow(column(12,
                         wellPanel(
                           selectInput("selected_object", "Choisissez un otolithe :", choices = choices, selected = "")
                         )
         )
         ),
         
         # 3D view and interaction part
         fluidRow(
           column(12, 
                  uiOutput("viewerTitle"),
                  # Use conditionalPanel to display the viewer only when an object is selected
                  conditionalPanel(
                    condition = "input.selected_object != ''",
                    div(id = "viewer-container", rglwidgetOutput("viewer", width = "100%", height = "100%"))
                  )
           )
         ),
         
         # Add conditionalPanel to hide the entire section when no object is selected
         conditionalPanel(
           condition = "input.selected_object != ''",
           
           hr(),
           
           # Poll part
           fluidRow(
             column(5,
                    wellPanel(
                      p("D'après mon otolithe, qui suis-je comme poisson"),
                      uiOutput("trait_inputs"),
                      actionButton("verify", "Vérifier", icon = icon("check-circle"), class = "btn-primary"),
                      actionButton("reset", "Réinitialiser", icon = icon("redo"), class = "btn-default"),
                      br(),
                      conditionalPanel(
                        condition = "output.show_results == true",
                        div(style = "margin-top: 10px; color: #6c757d; font-style: italic;",
                            "Appuyer sur 'Réinitialiser' pour rejouer")
                      )
                    )
             ),
             
             # Result and comparison part
             column(7,
                    h5("Résultats :"),
                    uiOutput("results")
             )
           )
         )
)