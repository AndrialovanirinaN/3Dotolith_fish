# Load data
load("data/best_knn_models_data.RData")
load("data/data_class_pc.RData")  # Contient df

predict_from_best_knn <- function(new_data, trait_to_predict, df_path = "data/best_knn_models_data.RData") {
  # Load the saved best models if not already loaded
  if (!exists("best_models_df") || !exists("selected_knn_models")) {
    load(df_path)
  }
  
  # Check if the trait is in the list
  if (!(trait_to_predict %in% best_models_df$trait)) {
    stop(paste("Trait", trait_to_predict, "is not found in best_models_df."))
  }
  
  # Get the best model row
  model_info <- subset(best_models_df, trait == trait_to_predict)
  model_name <- as.character(model_info$model_name)
  pc_needed <- as.numeric(model_info$pc)
  
  # Extract the model
  model <- selected_knn_models[[model_name]]
  
  # Get only the required PC columns (e.g. PC1 to PC10)
  pc_cols <- paste0("PC", 1:pc_needed)
  
  if (!all(pc_cols %in% colnames(new_data))) {
    stop("Some required PC columns are missing in new_data.")
  }
  
  # Format new data
  test_input <- new_data[, pc_cols, drop = FALSE]
  
  # Run prediction
  prediction <- class::knn(train = model$train,
                           test = test_input,
                           cl = model$cl,
                           k = model$k)
  
  return(prediction)
}


# Example : choose random sample
set.seed(123)
sample_row <- df[sample(1:nrow(df), 1), ]

# Predict all listed traits
traits <- c("fish_name", "family", "habitat", "fin_shape", "fish_shape")
predictions <- sapply(traits, function(tr) predict_from_best_knn(sample_row, tr))
print(predictions)