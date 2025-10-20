Shiny App - AppOto3D – Guessing a fish from its otolith
Welcome to this interactive R Shiny application, designed to help you explore the fascinating world of fish otoliths (ear stones) and predict biological characteristics from their 3D shape using artificial intelligence.

🌐 About the Project
Otoliths are natural biological recorders. By analyzing them, scientists can: determine a fish's age, study its habitat and migration, identify its species or family, and even infer past environmental conditions.

This application provides a fun and educational interface to explore the 3D structure of otoliths and apply machine learning techniques to interpret them.

✨ Key Features
🔍 3D interactive viewer for otolith exploration.

🧠 AI-powered prediction of species, tail fin type, general body shape, habitat zone, etc., using a K-Nearest Neighbors (KNN) model.

🎯 Hypothesis game: Make your own predictions and compare them to the AI's.

📚 Educational content on otoliths and their scientific value.

👨‍🔬 Modern user interface with responsive design and sleek themes.

🛠 Installation & Launch
Requirements
Make sure you have R (>= 4.x) installed with the following packages:
install.packages(c("shiny", "shinyjs", "shinythemes", "bslib", "later", "rgl", "Rvcg"))

Run the App
Clone this repository or place all files in a single folder:

/app
  ├── app.R
  ├── script/
  │   └── setup_app.R
  ├── ui/
  │   ├── style.R
  │   ├── home.R
  │   ├── application.R
  │   ├── description_esp.R
  │   ├── partenaires.R
  │   ├── references.R
  │   └── license.R
  ├── server/
  │   └── app.server.R
  └── www/
      └── logo/
          ├── ifremer.png
          ├── ulco.png
          └── lisic.png

From R or RStudio, run:
shiny::runApp("app.R")

📁 Folder Structure
app.R: main script for the UI and server logic.

ui/: contains user interface elements.

server/: back-end logic.

script/setup_app.R: setup and initialization routines.
This folder contains the following scripts:
	•	model_generation.R: Used for training and testing all the models.
	•	select_best_model.R: Utilized to select the best model for use.
	•	prediction_knn.R: A script to apply the KNN model on the data.

www/logo/: logos of project partners.

README.md: this documentation.

👥 Partners & Credits
This project is supported by:

Ifremer – Manche Mer du Nord (https://manchemerdunord.ifremer.fr/)

ULCO – Université du Littoral Côte d’Opale (https://www.univ-littoral.fr/)

LISIC – Laboratoire d'Informatique Signal et Image de la Côte d'Opale (https://www-lisic.univ-littoral.fr/)

Developed as part of research projects combining fish biology and AI-based analysis of ecological data.

📜 License
This application is released under the MIT License. See the “License” tab in the app for more details.


💬 Contact
For questions, suggestions, or collaboration:

Email: [nicolasandrialova@gmail.com]

GitHub: [github.com/AndrialovanirinaN]