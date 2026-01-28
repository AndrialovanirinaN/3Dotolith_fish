tabPanel("Guide",
         # Main header
         div(class = "page-header",
             h4("Les différents caractéristiques des poissons à déviner dans cette application"),
         ),
         
         # Habitat
         div(class = "card mb-4",
             div(class = "card-header",
                 h5(class = "mb-0", "Habitat des poissons dans la colonne d'eau")
             ),
             div(class = "card-body",
                 div(class = "row",
                     div(class = "col-md-4 text-center",
                         h6("Pélagique"),
                         tags$img(
                           src = URLencode("habitat/Pélagique.png"),
                           alt = "Pélagique",
                           class = "img-fluid",
                           style = "max-width: 100%; max-height: 200px;"
                         )
                     ),
                     div(class = "col-md-4 text-center",
                         h6("Démersal"),
                         tags$img(
                           src = URLencode("habitat/Démersal.png"),
                           alt = "Démersal",
                           class = "img-fluid",
                           style = "max-width: 100%; max-height: 200px;"
                         )
                     ),
                     div(class = "col-md-4 text-center",
                         h6("Benthique"),
                         tags$img(
                           src = URLencode("habitat/Benthique.png"),
                           alt = "Benthique",
                           class = "img-fluid",
                           style = "max-width: 100%; max-height: 200px;"
                         )
                     )
                 )
             )
         ),
         
         # Fish shape
         div(class = "card mb-4",
             div(class = "card-header",
                 h5(class = "mb-0", "Forme du poisson")
             ),
             div(class = "card-body",
                 div(class = "row",
                     div(class = "col-md-6 text-center",
                         h6("Plats comme la plie"),
                         tags$img(
                           src = "fish_shape/Plats.png",
                           alt = "Plats",
                           class = "img-fluid",
                           style = "max-width: 100%; max-height: 150px;"
                         )
                     ),
                     div(class = "col-md-6 text-center",
                         h6("Ronds comme le thon"),
                         tags$img(
                           src = "fish_shape/Ronds.png",
                           alt = "Ronds",
                           class = "img-fluid",
                           style = "max-width: 100%; max-height: 150px;"
                         )
                     )
                 )
             )
         ),
         
         # Shape of the caudal fin
         div(class = "card mb-4",
             div(class = "card-header",
                 h5(class = "mb-0", "Forme de la nageoire caudale")
             ),
             div(class = "card-body",
                 div(class = "row",
                     div(class = "col-md-4 text-center",
                         h6("Arrondie"),
                         tags$img(
                           src = URLencode("fin_shape/Arrondie.png"),
                           alt = "Arrondie",
                           class = "img-fluid",
                           style = "max-width: 100%; max-height: 150px;"
                         )
                     ),
                     div(class = "col-md-4 text-center",
                         h6("Fourchue"),
                         tags$img(
                           src = URLencode("fin_shape/Fourchue.png"),
                           alt = "Fourchue",
                           class = "img-fluid",
                           style = "max-width: 100%; max-height: 150px;"
                         )
                     ),
                     div(class = "col-md-4 text-center",
                         h6("Tronquée"),
                         tags$img(
                           src = URLencode("fin_shape/Tronquée.png"),
                           alt = "Tronquée",
                           class = "img-fluid",
                           style = "max-width: 100%; max-height: 150px;"
                         )
                     )
                 )
             )
         ),
         
         # Species
         div(class = "card mb-4",
             div(class = "card-header",
                 h5(class = "mb-0", "Les espèces à deviner avec la forme de leur otolithe")
             ),
             div(class = "card-body",
                 div(class = "row",
                     div(class = "col-md-12 text-center mb-3",
                         h6("Les poissons plats"),
                         tags$img(
                           src = "illustrations/p_plats.png",
                           alt = "Les poissons plats",
                           class = "img-fluid",
                           style = "max-width: 100%; height: auto;"
                         )
                     ),
                     div(class = "col-md-12 text-center",
                         h6("Les poissons ronds"),
                         tags$img(
                           src = "illustrations/p_ronds.png",
                           alt = "Les poissons ronds",
                           class = "img-fluid",
                           style = "max-width: 100%; height: auto;"
                         )
                     )
                 )
             )
         )
)
