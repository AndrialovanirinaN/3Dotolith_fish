results_ui <- reactiveVal(NULL)

# Reactive value to track reset state
reset_trigger <- reactiveVal(0)

selected_row <- reactive({
  req(input$selected_object != "")
  obj_name <- gsub("\\.stl$", "", input$selected_object)
  row_data <- df[df$NAMES == obj_name, ]
  validate(need(nrow(row_data) > 0, "Données introuvables pour cet objet"))
  row_data
})

# Observer to reset results when the selected object changes
observeEvent(input$selected_object, {
  # Clear previous results
  results_ui(NULL)
  
  # enable button verify
  shinyjs::enable("verify")
  
  # Reset user selections if a new object is selected
  if(input$selected_object != "") {
    for (trait in traits) {
      updateSelectInput(session, paste0("user_", trait), selected = "")
    }
  }
}, ignoreInit = TRUE)

# Conditional title for the viewer
output$viewerTitle <- renderUI({
  if(input$selected_object != "") {
    h4("Visualisation 3D interactive")
  } else {
    tags$i("Veuillez sélectionner un otolithe pour afficher le modèle 3D et jouer")
  }
})

output$trait_inputs <- renderUI({
  req(input$selected_object != "")
  
  # Custom messages for each trait
  trait_labels <- list(
    habitat = "J'habite où dans la colonne d'eau ?",
    fish_shape = "Quelle est ma forme ?",
    fin_shape = "Quelle est la forme de ma nageoire caudale ?",
    # family = "À quelle famille j'appartiens ?",
    fish_name = "Quelle espèce je suis ?"
  )
  
  tagList(lapply(traits, function(trait) {
    selectInput(inputId = paste0("user_", trait),
                label = trait_labels[[trait]],
                choices = c("", sort(unique(as.character(df[[trait]])))),
                selected = "")
  }))
})

# Use a reactive value to control viewer rendering
viewer_data <- reactiveVal(NULL)

observe({
  # Observer to detect changes in the selected object
  req(input$selected_object != "")
  reset_trigger() # Also depends on the reset trigger
  
  # Ensure RGL device handling is correct
  close3d() # Close any existing RGL devices
  open3d(useNULL=TRUE) # Open a new device in "NULL" mode
  
  # Checks if the selected STL file exists and loads it.
  filepath <- file.path(stl_dir, input$selected_object)
  if (!file.exists(filepath)) {
    viewer_data(list(error = TRUE, message = "Fichier STL introuvable"))
  } else {
    tryCatch({
      mesh <- vcgImport(filepath)
      viewer_data(list(error = FALSE, mesh = mesh))
    }, error = function(e) {
      viewer_data(list(error = TRUE, message = paste("Erreur :", e$message)))
    })
  }
})

output$viewer <- renderRglwidget({
  # React to changes in viewer_data or reset_trigger
  reset_trigger()
  
  # Always start by clearing the scene
  clear3d()
  
  # If no object is selected or reset has been triggered with no selection
  if (input$selected_object == "") {
    return(rglwidget())
  }
  
  # If we have data to render the mesh
  data <- viewer_data()
  if (!is.null(data)) {
    if (data$error) {
      text3d(0, 0, 0, data$message)
    } else {
      shade3d(data$mesh, col = "lightgray")
      # view3d(theta = 30, phi = 20, zoom = 0.7) # modify the initial 3D view
    }
  }
  
  rglwidget()
})

# Add reactive output
output$show_results <- reactive({
  !is.null(results_ui())
})
outputOptions(output, "show_results", suspendWhenHidden = FALSE)

observeEvent(input$verify, {
  req(input$selected_object != "")
  ind_data <- selected_row()
  results <- list()
  
  # Disable button verify
  shinyjs::disable("verify")
  
  # Track perfect score
  all_correct <- TRUE
  has_selections <- FALSE
  
  for (trait in traits) {
    user_val <- input[[paste0("user_", trait)]]
    
    # Define display names for each trait in the results
    trait_display_names <- list(
      fish_name = "Espèce",
      habitat = "Habitat",
      fin_shape = "Forme nageoire caudale",
      fish_shape = "Forme"
    )
    
    # Check if the user has made a selection for the current trait
    if (user_val == "") {
      all_correct <- FALSE
      results[[length(results) + 1]] <- div(
        style = "margin-bottom: 20px; padding: 20px; background: linear-gradient(135deg, #fff9e6 0%, #fff4d6 100%); border-left: 4px solid #ffa500; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);",
        div(
          style = "display: flex; align-items: center; gap: 10px; margin-bottom: 8px;",
          icon("circle-exclamation", style = "color: #ffa500; font-size: 20px;"),
          strong(trait_display_names[[trait]], style = "font-size: 16px; color: #333;")
        ),
        div(
          style = "color: #666; font-style: italic;",
          "Aucune sélection effectuée"
        )
      )
      next
    }
    
    has_selections <- TRUE
    
    # Get the true value of the trait for the selected fish
    true_val <- as.character(ind_data[[trait]])
    
    # Predict the trait using the pre-trained KNN model
    pred_val <- tryCatch({
      as.character(predict_from_best_knn(ind_data, trait))
    }, error = function(e) {
      paste("Erreur:", e$message)
    })
    
    # Special handling for fish_name
    if (trait == "fish_name") {
      species_val <- as.character(ind_data[["species"]])
      true_val_display <- HTML(paste0(true_val, " (", "<i>", species_val, "</i>", ")"))
    } else {
      true_val_display <- true_val
    }
    
    # Check correctness
    user_ok <- (user_val == true_val)
    pred_ok <- (!startsWith(pred_val, "Erreur")) && (pred_val == true_val)
    
    if (!user_ok) all_correct <- FALSE
    
    display_name <- trait_display_names[[trait]]
    
    # Building the image path for real value
    img_path <- file.path("www", trait, paste0(true_val, ".png"))
    
    # Check whether the image exists
    img_exists <- file.exists(img_path)
    
    # Card background color based on user correctness
    card_bg <- if (user_ok) {
      "linear-gradient(135deg, #e8f5e9 0%, #f1f8f4 100%)"
    } else {
      "linear-gradient(135deg, #ffebee 0%, #fdf3f4 100%)"
    }
    
    border_color <- if (user_ok) "#4caf50" else "#f44336"
    
    # Display the results card
    results[[length(results) + 1]] <- div(
      style = paste0(
        "margin-bottom: 20px; padding: 20px; background: ", card_bg, "; ",
        "border-left: 4px solid ", border_color, "; ",
        "border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);"
      ),
      
      # Header with trait name
      div(
        style = "font-size: 16px; font-weight: 600; color: #333; margin-bottom: 15px; padding-bottom: 10px; border-bottom: 2px solid rgba(0,0,0,0.05);",
        display_name
      ),
      
      # Content container
      div(
        style = "display: flex; gap: 20px; flex-wrap: wrap;",
        
        # Left side: Comparison table
        div(
          style = "flex: 1; min-width: 300px;",
          
          # Comparison grid
          div(
            style = "display: grid; grid-template-columns: auto 1fr auto; gap: 12px; align-items: center;",
            
            # User row
            div(style = "font-weight: 500; color: #555;", "Vous"),
            div(
              style = paste0(
                "padding: 8px 12px; background: white; border-radius: 8px; ",
                "border: 2px solid ", if (user_ok) "#4caf50" else "#f44336", ";"
              ),
              user_val
            ),
            div(
              style = paste0("font-size: 20px; color: ", if (user_ok) "#4caf50" else "#f44336", ";"),
              if (user_ok) icon("check-circle") else icon("times-circle")
            ),
            
            # AI row
            div(style = "font-weight: 500; color: #555;", "IA"),
            div(
              style = paste0(
                "padding: 8px 12px; background: white; border-radius: 8px; ",
                "border: 2px solid ", if (pred_ok) "#4caf50" else if (startsWith(pred_val, "Erreur")) "#ff9800" else "#f44336", ";"
              ),
              pred_val
            ),
            div(
              style = paste0(
                "font-size: 20px; color: ", 
                if (startsWith(pred_val, "Erreur")) "#ff9800" else if (pred_ok) "#4caf50" else "#f44336", ";"
              ),
              if (startsWith(pred_val, "Erreur")) {
                icon("exclamation-triangle")
              } else if (pred_ok) {
                icon("check-circle")
              } else {
                icon("times-circle")
              }
            )
          ),
          
          # Real value display
          div(
            style = "margin-top: 15px; padding: 12px; background: rgba(255,255,255,0.6); border-radius: 8px; border: 1px dashed #999;",
            div(
              style = "font-size: 13px; color: #666; margin-bottom: 4px;",
              "La bonne réponse"
            ),
            div(
              style = "font-size: 15px; font-weight: 600; color: #333;",
              true_val_display
            )
          )
        ),
        
        # Right side: Image
        if (img_exists) {
          div(
            style = "width: 250px; display: flex; align-items: center; justify-content: center; background: white; border-radius: 10px; padding: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);",
            tags$img(
              src = file.path(trait, paste0(true_val, ".png")), 
              alt = true_val,
              style = "max-width: 100%; max-height: 230px; object-fit: contain; border-radius: 8px;"
            )
          )
        } else {
          NULL
        }
      )
    )
  }
  
  # Add congratulations message if all answers are correct
  if (all_correct && has_selections) {
    congratulations_msg <- div(
      style = "margin-bottom: 25px; padding: 25px; background: linear-gradient(135deg, #ffd700 0%, #ffed4e 100%); border-radius: 16px; box-shadow: 0 4px 12px rgba(255,215,0,0.3); text-align: center; border: 3px solid #ffa500;",
      div(
        style = "font-size: 48px; margin-bottom: 10px;",
        "🎉"
      ),
      div(
        style = "font-size: 24px; font-weight: bold; color: #d97706; margin-bottom: 8px;",
        "Félicitations !"
      ),
      div(
        style = "font-size: 16px; color: #92400e;",
        "Vous avez obtenu 100% de bonnes réponses ! Excellent travail !"
      )
    )
    results <- c(list(congratulations_msg), results)
  }
  
  results_ui(do.call(tagList, results))
  
})

output$results <- renderUI({ results_ui() })

observeEvent(input$reset, {
  # Reset the results
  results_ui(NULL)
  
  # Clear the user input fields
  for (trait in traits) {
    updateSelectInput(session, paste0("user_", trait), selected = "")
  }
  
  # Clear the otolith selection
  updateSelectInput(session, "selected_object", selected = "")
  
  # Increment the reset trigger to force viewer refresh
  reset_trigger(reset_trigger() + 1)
  
  # Clear the RGL scene
  close3d()
  open3d(useNULL=TRUE)
})