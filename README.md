# AppOto3D – Fish Species Prediction from Otolith Shape

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![R](https://img.shields.io/badge/R-%3E%3D4.0-blue.svg)](https://www.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-App-brightgreen.svg)](https://shiny.rstudio.com/)

Welcome to **AppOto3D**, an interactive R Shiny application designed to explore the fascinating world of fish otoliths (ear stones) and predict biological characteristics from their 3D morphology using artificial intelligence.
---

## 🌊 About the Project

**Otoliths** are calcified structures found in fish inner ears that act as natural biological recorders. By analyzing their shape and structure, scientists can:

- 🎂 Determine a fish's age
- 🌍 Study habitat preferences and migration patterns  
- 🐠 Identify species or taxonomic families
- 📊 Infer past environmental conditions

This application provides an educational and interactive interface to explore 3D otolith structures and apply machine learning techniques for biological trait prediction.

---

## ✨ Key Features

- **🔍 3D Interactive Viewer**: Rotate, zoom, and explore otolith morphology in real-time
- **🧠 AI-Powered Predictions**: K-Nearest Neighbors (KNN) model predicts:
  - Species identification
  - Tail fin type (caudal fin morphology)
  - General body shape
  - Habitat zone (benthic, pelagic, etc.)
  - And more biological traits
- **🎯 Interactive Game Mode**: Make your own predictions and compare them with the AI
- **📚 Educational Content**: Learn about otolith biology and their scientific applications
- **💻 Modern UI**: Responsive design with sleek themes and intuitive navigation

---

## 🛠️ Installation & Setup

### Prerequisites

Ensure you have **R (≥ 4.0)** installed on your system. You can download it from [CRAN](https://cran.r-project.org/).

### Required R Packages

Install the necessary packages by running:

```r
install.packages(c(
  "shiny", 
  "shinyjs", 
  "shinythemes", 
  "bslib", 
  "later", 
  "rgl", 
  "Rvcg"
))
```

### Clone the Repository

```bash
git clone https://github.com/AndrialovanirinaN/AppOto3D.git
cd AppOto3D
```

### Run the Application

Launch the app from R or RStudio:

```r
shiny::runApp("app.R")
```

The application will open in your default web browser.

---

## 📁 Project Structure

```
AppOto3D/
│
├── app.R                    # Main application file
│
├── script/
│   ├── setup_app.R          # Initialization and setup routines
│   ├── model_generation.R   # Model training and testing scripts
│   ├── select_best_model.R  # Best model selection utilities
│   └── prediction_knn.R     # KNN prediction implementation
│
├── ui/
│   ├── style.R              # Custom styling
│   ├── home.R               # Home page UI
│   ├── application.R        # Main application UI
│   ├── description_esp.R    # Species description page
│   ├── partenaires.R        # Partners page
│   ├── references.R         # References page
│   └── license.R            # License information
│
├── server/
│   └── app.server.R         # Server-side logic
│
├── www/
│   └── logo/                # Partner logos
│       ├── ifremer.png
│       ├── ulco.png
│       └── lisic.png
│
└── README.md                # This file
```

---

## 🎮 How to Use

1. **Upload or Select an Otolith**: Choose a 3D otolith model from the provided dataset or upload your own
2. **Explore in 3D**: Use the interactive viewer to examine the otolith structure
3. **Make Predictions**: Try the hypothesis game to guess biological traits
4. **Compare with AI**: See how the KNN model performs and learn from the results
5. **Learn More**: Explore the educational content to deepen your understanding

---

## 🤖 Machine Learning Model

The application uses a **K-Nearest Neighbors (KNN)** classifier trained on morphometric features extracted from 3D otolith scans. The model predicts multiple biological traits based on shape analysis.

**Model Training Scripts:**
- `model_generation.R`: Training and validation pipeline
- `select_best_model.R`: Model optimization and selection
- `prediction_knn.R`: Real-time prediction implementation

---

## 👥 Partners & Credits

This project is a collaborative effort supported by:

<div align="center">

| Organization | Description |
|--------------|-------------|
| [**ULCO**](https://www.univ-littoral.fr/) | Université du Littoral Côte d'Opale |
| [**LISIC**](https://www-lisic.univ-littoral.fr/) | Laboratoire d'Informatique Signal et Image<br>de la Côte d'Opale |
| [**Ifremer**](https://manchemerdunord.ifremer.fr/) | French Research Institute for Exploitation of the Sea<br>*Manche Mer du Nord* |

</div>

**Developed as part of research initiatives combining marine biology and AI-based ecological data analysis.**

---

**Funding:**

- **CPER CornelIA (2021-2027)** – Co-construction responsable et durable d'une Intelligence Artificielle
- **IFSEA graduate school** – ANR-21-EXES-0011 (Agence Nationale de la Recherche)

## 📜 License

**MIT License**

Copyright © 2025 Nicolas Andrialovanirina, Emilie Poisson Caillault, Kélig Mahé

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED.

## ⚠️ Disclaimer

This application provides estimations for educational purposes only. 
Expert validation is always recommended for research and fisheries management applications.

## 💬 Contact

For questions, suggestions, or collaboration:

- **Email:** nicolasandrialova@gmail.com
- **GitHub:** [github.com/AndrialovanirinaN](https://github.com/AndrialovanirinaN)
