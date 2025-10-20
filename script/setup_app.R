# Script to setup R

# Configure RGL (avoid open windows plot)
options(rgl.useNULL = TRUE)

# ---- Load models and data ----
tryCatch({
  load("data/data_class_pc.RData")  # load dataframe
  load("data/best_knn_models_data.RData")  # load models selected_knn_models, best_models_df
}, error = function(e) {
  stop("Erreur lors du chargement des données : ", e$message)
})

# ---- Prediction function ----
predict_from_best_knn <- function(new_data, trait_to_predict) {
  model_info <- subset(best_models_df, trait == trait_to_predict)
  if (nrow(model_info) == 0) stop(paste("Pas de modèle pour le trait :", trait_to_predict))
  model_name <- as.character(model_info$model_name)
  pc_needed <- as.numeric(model_info$pc)
  model <- selected_knn_models[[model_name]]
  pc_cols <- paste0("PC", 1:pc_needed)
  test_input <- new_data[, pc_cols, drop = FALSE]
  class::knn(train = model$train, test = test_input, cl = model$cl, k = model$k)
}

# ---- Setup ----
stl_dir <- "stlfile"
stl_files <- if (dir.exists(stl_dir)) list.files(stl_dir, pattern = "\\.stl$") else character(0)
choices <- setNames(stl_files, paste0("Otolithe ", seq_along(stl_files)))
choices <- c("Sélectionner..." = "", choices)

# load and reorder parameter to estimate
traits <- c("habitat", "fish_shape", "fin_shape", "fish_name")