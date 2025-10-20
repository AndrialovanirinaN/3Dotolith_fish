tabPanel("Partenaires",
         
         
         
         # Custom CSS for logo styling
         tags$head(
           tags$style(HTML("
      .logo-container {
        text-align: center;
        padding: 15px;
        margin: 10px;
        border: 1px solid #ffffff;
        border-radius: 8px;
        background-color: #ffffff;
        height: 100px;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      .logo-img {
        max-width: 150px;
        max-height: 100px;
        width: auto;
        height: auto;
      }
      .row-spacing {
        margin-bottom: 10px;
      }
    "))
         ),
         
         
         div(
           class = "container-fluid py-4",
           
           # Partenaire institutionnel
           card(
             card_header("Partenaires institutionnels"),
             card_body(
               div(
                 class = "text-center p-3",
                 h6("Université Littoral Côte d'Opale"),
                 "Laboratoire d'Informatique Signal & Image de la Côte d'Opale",
                 hr(),
                 h6("Ifremer - Unité Halieutique Manche-Mer du Nord"),
                 "Laboratoire Ressources Halieutiques - Pôle Sclérochronologie"
               )
             )
           ),
           
           # Partenaires techniques
           card(
             card_header("Partenaires financiers"),
             card_body(
               div(
                 class = "text-center p-3",
                 h6("CPER CornelIA (2021-2027)"),
                 "Co-construction responsable et durable d’une Intelligence Artificielle",
                 hr(),
                 h6("IFSEA graduate school • ANR-21-EXES-00 11"),
                 "Provenant de l'Agence Nationale de la Recherche dans le cadre du Programmes d’investissements d'avenir."
               )
             )
           )
         ),
           
           # Main content with 3 rows of logos
           div(style = "padding: 20px;",
               
               tags$h3("Logos de tous les partenaires"),
               
               # Row 1 - Official Partners (7 logos, will wrap to multiple lines)
               fluidRow(class = "row-spacing",
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/par_off_1.png", class = "logo-img", alt = "Official Partner 1")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/par_off_2.png", class = "logo-img", alt = "Official Partner 2")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/par_off_3.png", class = "logo-img", alt = "Official Partner 3")
                               )
                        )
               ),
               fluidRow(class = "row-spacing",
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/par_off_4.png", class = "logo-img", alt = "Official Partner 4")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/par_off_5.png", class = "logo-img", alt = "Official Partner 5")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/par_off_6.png", class = "logo-img", alt = "Official Partner 6")
                               )
                        )
               ),
               fluidRow(class = "row-spacing",
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/par_off_7.png", class = "logo-img", alt = "Official Partner 7")
                               )
                        )
               ),
               
               # Row 2 - Project Partners (5 logos)
               fluidRow(class = "row-spacing",
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/proj_1.png", class = "logo-img", alt = "Project Partner 1")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/proj_2.png", class = "logo-img", alt = "Project Partner 2")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/proj_3.png", class = "logo-img", alt = "Project Partner 3")
                               )
                        )
               ),
               fluidRow(class = "row-spacing",
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/proj_4.png", class = "logo-img", alt = "Project Partner 4")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/proj_5.png", class = "logo-img", alt = "Project Partner 5")
                               )
                        )
               ),
               
               # Row 3 - Other Partners (7 logos)
               fluidRow(class = "row-spacing",
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/part_1.png", class = "logo-img", alt = "Partner 1")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/part_2.png", class = "logo-img", alt = "Partner 2")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/part_3.png", class = "logo-img", alt = "Partner 3")
                               )
                        )
               ),
               fluidRow(class = "row-spacing",
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/part_4.png", class = "logo-img", alt = "Partner 4")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/part_5.png", class = "logo-img", alt = "Partner 5")
                               )
                        ),
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/part_6.png", class = "logo-img", alt = "Partner 6")
                               )
                        )
               ),
               fluidRow(class = "row-spacing",
                        column(4, 
                               div(class = "logo-container",
                                   img(src = "partenaires/part_7.png", class = "logo-img", alt = "Partner 7")
                               )
                        )
               )
           )
           
)