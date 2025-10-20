tabPanel("Description",
         # Main header
         div(class = "page-header",
             h4(" Découvrez le monde secret des otolithes"),
             p("Explorez le monde fascinant des poissons grâce à leurs pierres d'oreille")
         ),
         
         # Main content
         div(class = "container-fluid",
             
             # Introduction
             div(class = "card mb-4",
                 div(class = "card-body",
                     p("Avez-vous déjà entendu parler des otolithes ? 
                       Ces petites structures calcifiées, situées dans l'oreille 
                       interne des poissons osseux, sont bien plus que de simples 
                       \"pierres\". Ce sont de véritables archives biologiques, 
                       qui racontent l'histoire de la vie d'un poisson et de son 
                       environnement. Un peu comme les cernes de croissance d'un 
                       arbre, les otolithes grandissent avec le poisson, 
                       enregistrant des informations précieuses.")
                 )
             ),
             
             div(class = "card-body",
                 tags$img(
                   src = "illustrations/scan_fish.png",
                   alt = "Scan otolithe",
                   class = "img-fluid",
                   style = "max-width: 100%; height: auto;"
                 )
             ),
             
             
             # Section: wealth of information
             div(class = "card mb-4",
                 div(class = "card-header",
                     h4(class = "mb-0", icon("microscope"), " L'Otolithe : une 
                        mine d'informations pour les scientifiques")
                 ),
                 div(class = "card-body",
                     p("Les scientifiques étudient les otolithes pour de 
                       nombreuses raisons :"),
                     div(class = "row",
                         div(class = "col-md-6 mb-3",
                             div(class = "card h-100",
                                 div(class = "card-body",
                                     h5(class = "card-title", icon("calendar-alt"), 
                                        " Déterminer l'âge"),
                                     p(class = "card-text", "En comptant les 
                                       anneaux de croissance, on peut savoir 
                                       quel âge avait le poisson.")
                                 )
                             )
                         ),
                         div(class = "col-md-6 mb-3",
                             div(class = "card h-100",
                                 div(class = "card-body",
                                     h5(class = "card-title", icon("route"), 
                                        " Comprendre les migrations"),
                                     p(class = "card-text", "L'analyse chimique 
                                       des différentes couches de l'otolithe peut 
                                       révéler les différents milieux aquatiques 
                                       que le poisson a fréquentés au cours de sa vie.")
                                 )
                             )
                         ),
                         div(class = "col-md-6 mb-3",
                             div(class = "card h-100",
                                 div(class = "card-body",
                                     h5(class = "card-title", icon("fish"), 
                                        " Étudier les populations"),
                                     p(class = "card-text", "La forme et la 
                                       composition des otolithes peuvent aider 
                                       à distinguer différentes populations d'une 
                                       même espèce ou à identifier des espèces.")
                                 )
                             )
                         ),
                         div(class = "col-md-6 mb-3",
                             div(class = "card h-100",
                                 div(class = "card-body",
                                     h5(class = "card-title", icon("history"), 
                                        " Reconstituer le passé"),
                                     p(class = "card-text", "Les otolithes peuvent 
                                       donner des indices sur la température de l'eau, 
                                       la salinité et même la pollution à différentes époques.")
                                 )
                             )
                         )
                     ),
                     div(class = "well well-sm mt-3",
                         p(class = "mb-0", 
                           icon("info-circle"), " ",
                           strong("En bref : "), 
                           "Chaque otolithe est une capsule temporelle qui nous 
                           aide à mieux comprendre la biologie des poissons, 
                           la santé des écosystèmes aquatiques et l'impact 
                           des changements environnementaux.")
                     )
                 )
             ),
             
             div(class = "card-body text-center",
                 tags$img(
                   src = "illustrations/3D_oto.gif",
                   alt = "Scan otolithe",
                   class = "img-fluid",
                   style = "max-width: 100%; max-height: 200px;"
                 ),
                 h6("Scan d'un otolithe en 3D")
             ),
             
             # Section : 3D analysis
             div(class = "card mb-4",
                 div(class = "card-header",
                     h4(class = "mb-0", icon("cube"), 
                        " Pourquoi analyser la forme 3D des otolithes ?")
                 ),
                 div(class = "card-body",
                     p("Traditionnellement, les scientifiques examinaient la 
                       forme des otolithes en 2D. Cependant, comme toute structure complexe, 
                       les otolithes ont une forme tridimensionnelle unique 
                       et riche en détails. L'analyse de la forme 3D nous 
                       permet d'aller plus loin :"),
                     div(class = "list-group",
                         div(class = "list-group-item",
                             h5(icon("plus-circle"), " Plus de précision"),
                             p(class = "mb-0", "La 3D capture des subtilités de la 
                               forme qui pourraient être manquées en 2D, offrant 
                               une discrimination plus fine entre 
                               les espèces ou les populations.")
                         ),
                         div(class = "list-group-item",
                             h5(icon("link"), 
                                " Meilleure compréhension des liens forme-fonction"),
                             p(class = "mb-0", "La forme 3D peut être liée plus 
                               directement à la fonction de l'otolithe dans 
                               l'audition et l'équilibre du poisson.")
                         ),
                         div(class = "list-group-item",
                             h5(icon("chart-line"), " Informations écologiques"),
                             p(class = "mb-0", "Des variations subtiles dans 
                               la forme 3D peuvent être corrélées avec l'habitat 
                               du poisson, sa morphologie générale ou encore le 
                               type de nageoire caudale qu'il possède.")
                         )
                     ),
                     div(class = "well well-sm mt-3",
                         p(class = "mb-0", icon("laptop-code"), " En utilisant 
                           des techniques d'imagerie avancées et des analyses 
                           informatiques (comme celles basées sur les composantes 
                           principales que notre application utilise en coulisses), 
                           nous pouvons quantifier ces formes 3D et les utiliser 
                           pour prédire des caractéristiques importantes du poisson.")
                     )
                 )
             ),
             
             # Section : application
             div(class = "panel panel-primary mb-4",
                 div(class = "panel-heading",
                     h4(class = "panel-title", icon("gamepad"), 
                        " Découvrez notre application : Devine 
                        qui je suis grâce à mon otolithe")
                 ),
                 div(class = "panel-body",
                     p(class = "lead", "Notre application interactive vous 
                       invite à devenir un scientifique le temps d'un instant."),
                     div(class = "row mt-4",
                         div(class = "col-md-3 mb-3",
                             div(class = "text-center",
                                 div(class = "mb-3",
                                     span(class = "label label-default", 
                                          style = "font-size: 2em; padding: 15px 20px; border-radius: 50%;", "1")
                                 ),
                                 h5(icon("eye"), " Visualisez en 3D"),
                                 p("Choisissez un otolithe et explorez sa 
                                   forme complexe sous tous les angles grâce à 
                                   notre visionneuse 3D interactive.")
                             )
                         ),
                         div(class = "col-md-3 mb-3",
                             div(class = "text-center",
                                 div(class = "mb-3",
                                     span(class = "label label-default", 
                                          style = "font-size: 2em; padding: 15px 20px; border-radius: 50%;", "2")
                                 ),
                                 h5(icon("lightbulb"), " Faites vos hypothèses"),
                                 p("Essayez de deviner l'habitat, la forme du corps, 
                                   la nageoire caudale et même l'espèce du poisson.")
                             )
                         ),
                         div(class = "col-md-3 mb-3",
                             div(class = "text-center",
                                 div(class = "mb-3",
                                     span(class = "label label-default", 
                                          style = "font-size: 2em; padding: 15px 20px; border-radius: 50%;", "3")
                                 ),
                                 h5(icon("robot"), " Confrontez-vous à l'IA"),
                                 p("Notre application utilisera des modèles d'intelligence 
                                   artificielle (KNN) pour prédire ces mêmes caractéristiques.")
                             )
                         ),
                         div(class = "col-md-3 mb-3",
                             div(class = "text-center",
                                 div(class = "mb-3",
                                     span(class = "label label-default", 
                                          style = "font-size: 2em; padding: 15px 20px; border-radius: 50%;", "4")
                                 ),
                                 h5(icon("check-circle"), " Découvrez la vérité"),
                                 p("Comparez vos réponses à celles de l'IA et découvrez 
                                   les véritables caractéristiques du poisson.")
                             )
                         )
                     )
                 )
             ),
             
             # Conclusion
             div(class = "well",
                 h5(icon("star"), " ", strong("Une expérience ludique et éducative")),
                 p("Cette application a pour but de montrer de manière ludique comment 
                   la forme 3D d'une petite structure comme l'otolithe peut nous 
                   renseigner sur la vie d'un poisson. C'est un exemple de la 
                   manière dont la technologie et la science se rencontrent 
                   pour décoder les secrets de la nature."),
                 hr(),
                 p(class = "mb-0", strong("Amusez-vous bien et bonne exploration "), " ", icon("smile"))
             )
         )
)