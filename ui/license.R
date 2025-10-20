tabPanel(
  title = "Licence",
  
  div(
    class = "container-fluid py-4",
    
    # Software licence
    card(
      card_header("Licence du logiciel"),
      card_body(
        h6("MIT License"),
        "Cette application est distribuée sous licence MIT.",
        
        tags$pre(
          class = "bg-light p-3 rounded",
          "MIT License

Copyright © 2025 Nicolas Andrialovanirina, Emilie Poisson Caillault, Kélig Mahé

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the Software), to deal in the
Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software."
        )
      )
    ),
    
    br(),
    
    # Terms of use
    card(
      card_header("Conditions d'utilisation"),
      card_body(
        h6("Usage autorisé"),
        tags$ul(
          tags$li("Usage éducatif uniquement")
        ),
        
        h6("Limitations"),
        tags$ul(
          tags$li("Les estimations sont données à titre indicatif"),
          tags$li("Ne pas utiliser comme seule méthode de détermination d'espèces et de ses traits de vie"),
          tags$li("Validation par un expert recommandée")
        ),
        
        h6("Responsabilité"),
        "Les développeurs ne peuvent être tenus responsables des erreurs d'estimation. 
                Cette application n'est pas un outil d'aide à la décision, il ne remplace pas l'expertise humaine."
      )
    )
    
  )
)