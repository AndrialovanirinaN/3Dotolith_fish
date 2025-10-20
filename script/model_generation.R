# Clear environment and plots
rm(list = ls())           # Remove all objects
graphics.off()            # Close all graphic devices

# Load required packages
library(caret)
library(class)
library(randomForest)

# Load data
load("data/data_class_pc.RData")

# Define the list of traits to predict
traits_to_predict <- c("fish_name", "family", "habitat", "fin_shape", "fish_shape")

# Function to generate stratified training indices
generate_train_indices <- function(df, group_col, sizes = 1:2, reps = 1:5) {
  train_indices <- list()
  for (j in sizes) {
    for (h in reps) {
      set.seed(h)
      indices <- unlist(lapply(unique(df[[group_col]]), function(val) {
        all_inds <- which(df[[group_col]] == val)
        sample(all_inds, size = min(length(all_inds), j))
      }))
      train_indices[[paste0("base.", j, "_r", h)]] <- indices
    }
  }
  return(train_indices)
}

# Generate stratified train/test splits
indtrain <- generate_train_indices(df, group_col = "fish_name")

# Initialize result table and model containers
resume <- data.frame(matrix(ncol = 8, nrow = 0))
colnames(resume) <- c("pc", "model", "param_Mod", "base", "trait", "trainacc", "testacc", "model_name")

rf_resume <- list()
rf_models <- list()

knn_resume <- list()
knn_models <- list()

# Loop over different numbers of Principal Components
for (npc in c(10, 50, 103)) {
  pckeep <- paste0("PC", 1:npc)
  dfcshape <- df[, pckeep]
  
  for (base in names(indtrain)) {
    train_idx <- indtrain[[base]]
    test_idx <- setdiff(1:nrow(df), train_idx)
    
    df_train <- dfcshape[train_idx, ]
    df_test  <- dfcshape[test_idx, ]
    
    for (trait in traits_to_predict) {
      y_train <- df[train_idx, trait]
      y_test  <- df[test_idx, trait]
      
      # ===== KNN Models =====
      for (k in 1:2) {
        model_name <- paste0("knn.k", k, ".", base, ".pc_", npc, ".", trait)
        
        pred_train <- knn(train = df_train, test = df_train, cl = y_train, k = k)
        pred_test  <- knn(train = df_train, test = df_test, cl = y_train, k = k)
        
        cm_train <- confusionMatrix(table(y_train, pred_train))
        cm_test  <- confusionMatrix(table(y_test, pred_test))
        
        # Save confusion matrices
        knn_resume[[paste0("cm.train.", model_name)]] <- cm_train
        knn_resume[[paste0("cm.test.", model_name)]] <- cm_test
        
        # Save the KNN "model" info
        knn_models[[model_name]] <- list(
          train = df_train,
          cl = y_train,
          k = k
        )
        
        # Add results to summary table
        resume <- rbind(resume, data.frame(
          pc = npc,
          model = "knn",
          param_Mod = k,
          base = base,
          trait = trait,
          trainacc = cm_train$overall[1],
          testacc = cm_test$overall[1],
          model_name = model_name
        ))
      }
      
      # ===== Random Forest Models =====
      for (ntree in c(10, 20, 50, 100)) {
        model_name <- paste0("rf.ntree_", ntree, ".", base, ".pc_", npc, ".", trait)
        
        rf_model <- randomForest(x = df_train, y = as.factor(y_train),
                                 ntree = ntree, importance = TRUE)
        
        pred_train_rf <- predict(rf_model, df_train)
        pred_test_rf  <- predict(rf_model, df_test)
        
        cm_train_rf <- confusionMatrix(table(y_train, pred_train_rf))
        cm_test_rf  <- confusionMatrix(table(y_test, pred_test_rf))
        
        # Save model and results
        rf_models[[model_name]] <- rf_model
        rf_resume[[paste0("cm.train.", model_name)]] <- cm_train_rf
        rf_resume[[paste0("cm.test.", model_name)]] <- cm_test_rf
        
        # Add results to summary table
        resume <- rbind(resume, data.frame(
          pc = npc,
          model = "rf",
          param_Mod = ntree,
          base = base,
          trait = trait,
          trainacc = cm_train_rf$overall[1],
          testacc = cm_test_rf$overall[1],
          model_name = model_name
        ))
      }
    }
  }
}

# Save everything needed
save(df, indtrain, resume, rf_resume, rf_models, knn_resume, knn_models,
     file = "data/data_model.RData")