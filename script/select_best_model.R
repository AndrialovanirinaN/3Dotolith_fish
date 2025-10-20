# Load results
load("data/data_model.RData")  # Assumes resume_shp, knn_models are available

# Step 1: Select best models
traits_to_predict <- c("fish_name", "family", "habitat", "fin_shape", "fish_shape")

select_best_models <- function(resume_df, traits) {
  best_models <- data.frame()
  
  for (trait in traits) {
    sub_df <- resume_df[resume_df$trait == trait, ]
    
    max_acc <- max(as.numeric(sub_df$testacc), na.rm = TRUE)
    best_sub <- sub_df[as.numeric(sub_df$testacc) == max_acc, ]
    
    if (nrow(best_sub) > 1) {
      preferred <- best_sub[grepl("base.2", best_sub$base), ]
      if (nrow(preferred) >= 1) {
        best_model <- preferred[1, ]
      } else {
        best_model <- best_sub[1, ]
      }
    } else {
      best_model <- best_sub
    }
    
    best_models <- rbind(best_models, best_model)
  }
  
  return(best_models)
}

best_models_df <- select_best_models(resume, traits_to_predict)

# Step 2: Filter only KNN models
best_knn_models <- subset(best_models_df, model == "knn")

# Step 3: Extract models and relevant training data
selected_knn_models <- list()
selected_knn_train_data <- list()
selected_knn_labels <- list()

for (i in 1:nrow(best_knn_models)) {
  model_row <- best_knn_models[i, ]
  model_name <- model_row$model_name
  pc_count <- as.numeric(model_row$pc)
  base_id <- as.character(model_row$base)
  trait <- as.character(model_row$trait)
  
  # Extract model object
  knn_model <- knn_models[[model_name]]
  selected_knn_models[[model_name]] <- knn_model
  
  # Store training data and labels explicitly for reuse
  selected_knn_train_data[[model_name]] <- knn_model$train
  selected_knn_labels[[model_name]] <- knn_model$cl
}

# Step 4: Save everything
save(best_models_df,
     selected_knn_models,
     selected_knn_train_data,
     selected_knn_labels,
     file = "data/best_knn_models_data.RData")
